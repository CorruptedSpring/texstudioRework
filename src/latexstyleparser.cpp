#include "latexstyleparser.h"
#include "latexparser/latexparser.h"
#include "smallUsefulFunctions.h"
#include "execprogram.h"

LatexStyleParser::LatexStyleParser(QObject *parent, QString baseDirName, QString kpsecmd) :
	SafeThread(parent)
{
	baseDir = baseDirName;
	stopped = false;
	kpseWhichCmd = kpsecmd;
	mFiles.clear();
	//check if pdflatex is present
	texdefDir = kpsecmd.left(kpsecmd.length() - 9);
	ExecProgram execProgram(texdefDir + "pdflatex --version", "");
	texdefMode = execProgram.execAndWait();
	if (texdefMode) {
		QString output = execProgram.m_standardOutput.split("\n").first().trimmed();
		if (output.contains("MiKTeX")) {
			kpseWhichCmd.chop(9);
			kpseWhichCmd.append("findtexmf");
		}
	}
}

void LatexStyleParser::stop()
{
	stopped = true;
	mFilesAvailable.release();
}

void LatexStyleParser::run()
{
	forever {
		//wait for enqueued lines
		mFilesAvailable.acquire();
		if (stopped && mFiles.count() == 0) break;
		mFilesLock.lock();
		QString fn = mFiles.dequeue();
		mFilesLock.unlock();
		QString topPackage = "";
		QString dirName = "";
		if (fn.contains("/")) {
			int i = fn.indexOf("/");
			if (i > -1) {
				dirName = fn.mid(i + 1);
				fn = fn.left(i);
			}
		}
		if (fn.contains('#')) {
			QStringList lst = fn.split('#');
            if (!lst.isEmpty()){
				topPackage = lst.takeFirst();
            }
            if (!lst.isEmpty()){
				fn = lst.last();
                if(topPackage.isEmpty()){
                    topPackage = fn;
                    topPackage.chop(4);
                }
            }
		} else {
			topPackage = fn;
			topPackage.chop(4);
		}
		QString fullName = kpsewhich(fn); // find file
		if (fullName.isEmpty()) {
			if (!dirName.isEmpty()) {
				fullName = kpsewhich(fn, dirName); // find file
			}
		}
		if (fullName.isEmpty())
			continue;

		QStringList results, parsedPackages;
		results = readPackage(fullName, parsedPackages); // parse package(s)
        results.sort();
        auto last = std::unique(results.begin(),results.end());  // remove duplicates
        results.erase(last,results.end());


		if (texdefMode) {
			QStringList appendList;
			//QStringList texdefResults=readPackageTexDef(fn); // parse package(s) by texdef as well for indirectly defined commands
			QStringList texdefResults = readPackageTracing(fn);
            texdefResults.sort();
            auto last = std::unique(texdefResults.begin(),texdefResults.end());  // remove duplicates
            texdefResults.erase(last,texdefResults.end());

			// add only additional commands to results
			if ( !results.isEmpty() && !texdefResults.isEmpty()) {
				QStringList::const_iterator texdefIterator;
				QStringList::const_iterator resultsIterator = results.constBegin();
				QString result = *resultsIterator;
				for (texdefIterator = texdefResults.constBegin(); texdefIterator != texdefResults.constEnd(); ++texdefIterator) {
					QString td = *texdefIterator;
					if (td.startsWith('#'))
						continue;
					int i = td.indexOf("#");
					if (i >= 0)
						td = td.left(i);
					while (result < td && resultsIterator != results.constEnd()) {
						++resultsIterator;
						if (resultsIterator != results.constEnd()) {
							result = *resultsIterator;
						} else {
							result.clear();
						}
					}
					//compare result/td
					bool addCommand = true;

					if (result.startsWith(td)) {
						if (result.length() > td.length()) {
							QChar c = result.at(td.length());
							switch (c.toLatin1()) {
							case '#':
                                [[fallthrough]];
							case '{':
                                [[fallthrough]];
							case '[':
								addCommand = false;
								break;
							default:
								break;
							}
						} else {
							addCommand = false; //exactly equal
						}
					}

					if (addCommand) {
						appendList << *texdefIterator;
						//qDebug()<<td;
					}
				}
			} else {
				if (results.isEmpty())
					results << texdefResults;
			}
			results << appendList;
		}


		// if included styles call for additional generation, do it.
        QStringList included = results.filter(QRegularExpression("#include:.+"));
		foreach (QString elem, included) {
			elem = elem.mid(9);
			if (!QFileInfo("cwl:" + elem + ".cwl").exists()) {
				QString hlp = kpsewhich(elem + ".sty");
				if (!hlp.isEmpty()) {
                    if (!topPackage.isEmpty()){
						elem = topPackage + "#" + elem + ".sty";
                    }
					addFile(elem);
				}
			}
		}

		// write results
		if (!results.isEmpty()) {
			QFileInfo info(fn);
			QString baseName = info.completeBaseName();
			if (!baseName.isEmpty()) {
				QFile data(joinPath(baseDir, "completion/autogenerated", baseName + ".cwl"));
				if (data.open(QFile::WriteOnly | QFile::Truncate)) {
					QTextStream out(&data);
					out << "# autogenerated by txs\n";
					foreach (const QString &elem, results) {
						out << elem << "\n";
					}
				}
				if (!topPackage.isEmpty() && topPackage != baseName)
                    baseName = topPackage + "#" + baseName;
				emit scanCompleted(baseName);
			}
		}
	}
}

void LatexStyleParser::addFile(QString filename)
{
	mFilesLock.lock();
	mFiles.enqueue(filename);
	mFilesLock.unlock();
	mFilesAvailable.release();
}

/*!
 * \return "{arg1}..{argN}" where N=count. If with optional, return "[opt]{arg1}..{argN}"
 */
QString LatexStyleParser::makeArgString(int count, bool withOptional)
{
	QString args;
	if (withOptional) {
		args.append("[opt]");
	}
	for (int j = 0; j < count; j++) {
		args.append(QString("{arg%1}").arg(j + 1));
	}
	return args;
}

/*!
 * \brief LatexStyleParser::parseLine
 * \param line: the text line to parse
 * \param inRequirePackage: context information: are we inside \\RequirePackage{ - This may be modified by the function.
 * \param parsedPackages: context information. - This may be modified by the function.
 * \param fileName: the file from which line comes
 * \return a list of cwl commands
 */
QStringList LatexStyleParser::parseLine(const QString &line, bool &inRequirePackage, QStringList &parsedPackages, const QString &fileName) const
{
	QStringList results;
	if (line.startsWith("\\endinput"))
		return results;
	if (parseLineRequirePackage(results, line, inRequirePackage)) {
		return results;
	}
	if (parseLineDef(results, line)) {
		return results;
	}
	if (parseLineLet(results, line)) {
		return results;
	}
	if (parseLineCommand(results, line)) {
		return results;
	}
	if (parseLineEnv(results, line)) {
		return results;
	}
	if (parseLineInput(results, line, parsedPackages, fileName)) {
		return results;
	}
	if (parseLineNewLength(results, line)) {
		return results;
	}
	if (parseLineNewCounter(results, line)) {
		return results;
	}
	if (parseLineDecMathSym(results, line)) {
		return results;
	}
	if (parseLineRequire(results, line)) {
		return results;
	}
	if (parseLineRequireStart(results, line, inRequirePackage)) {
		return results;
	}
	if (parseLineLoadClass(results, line)) {
		return results;
	}
	if (parseLineXparseCommand(results, line)) {
		return results;
	}
	if (parseLineXparseEnv(results, line)) {
		return results;
	}
	return results;
}

bool LatexStyleParser::parseLineRequirePackage(QStringList &results, const QString &line, bool &inRequirePackage)
{
	if (inRequirePackage == false) {
		return false;
	}
	int col = line.indexOf('}');
	if (col > -1) {
		QString zw = line.left(col);
		foreach (QString elem, zw.split(',')) {
			QString package = elem.remove(' ');
			if (!package.isEmpty())
				results << "#include:" + package;
		}
		inRequirePackage = false;
	} else {
		foreach (QString elem, line.split(',')) {
			QString package = elem.remove(' ');
			if (!package.isEmpty())
				results << "#include:" + package;
		}
	}
	return true;
}

bool LatexStyleParser::parseLineDef(QStringList &results, const QString &line)
{
    static const QRegularExpression rxDef("\\\\[egx]?def\\s*(\\\\[\\w@]+)(\\s*#1)?(\\s*#2)?(\\s*#3)?(\\s*#4)?(\\s*#5)?");

    QRegularExpressionMatch rxDefm=rxDef.match(line);
    if (!rxDefm.hasMatch()) {
		return false;
	}
    QString name = rxDefm.captured(1);
	if (name.contains("@")) {
		return true;
	}
	int optionCount = 0;
    for (int c = 2; c <= rxDef.captureCount(); c++) {
        if (rxDefm.captured(c).isEmpty()) {
			break;
		}
		optionCount++;
	}
	//qDebug() << line << rxDef.capturedTexts() << optionCount;
	name += makeArgString(optionCount) + "#S";
	if (!results.contains(name)) {
		results << name;
	}
	return true;
}

bool LatexStyleParser::parseLineLet(QStringList &results, const QString &line)
{
    static const QRegularExpression rxLet("\\\\let\\s*(\\\\[\\w@]+)");

    QRegularExpressionMatch rxmLet=rxLet.match(line);
    if (!rxmLet.hasMatch()) {
		return false;
	}
    QString name = rxmLet.captured(1);
	if (name.contains("@")) {
		return true;
	}
	name.append("#S");
	if (!results.contains(name)) {
		results << name;
	}
	return true;
}

bool LatexStyleParser::parseLineCommand(QStringList &results, const QString &line)
{
    static const QRegularExpression rxComBrace("\\\\(newcommand|providecommand|DeclareRobustCommand|algnewcommand)\\*?\\s*\\{(\\\\\\w+)\\}\\s*\\[?(\\d+)?\\]?(?:\\s*\\[([^\\]]*)\\])?");
    static const QRegularExpression rxComNoBrace("\\\\(newcommand|providecommand|DeclareRobustCommand|algnewcommand)\\*?\\s*(\\\\\\w+)\\s*\\[?(\\d+)?\\]?(?:\\s*\\[([^\\]]*)\\])?");

    QRegularExpressionMatch rxm=rxComBrace.match(line);
    if (!rxm.hasMatch()) {
        rxm=rxComNoBrace.match(line);
    }
    if (!rxm.hasMatch()){
		return false;
	}
    QString name = rxm.captured(2);
	if (name.contains("@")) {
		return true;
	}
    int optionCount = rxm.captured(3).toInt(); //returns 0 if conversion fails
    QString optionalArg = rxm.captured(4);
	if (!optionalArg.isEmpty()) {
		optionCount--;
		QString nameWithOpt = name + makeArgString(optionCount, true) + "#S";
		if (!results.contains(nameWithOpt)) {
			results << nameWithOpt;
		}
	}
	name += makeArgString(optionCount) + "#S";
	if (!results.contains(name)) {
		results << name;
	}
	return true;
}

bool LatexStyleParser::parseLineEnv(QStringList &results, const QString &line)
{
    static const QRegularExpression rxEnv("\\\\newenvironment\\*?\\s*\\{(\\w+)\\}\\s*\\[?(\\d+)?\\]?");

    QRegularExpressionMatch rxmEnv=rxEnv.match(line);
    if (!rxmEnv.hasMatch()) {
		return false;
	}
    QString name = rxmEnv.captured(1);
	if (name.contains("@")) {
		return true;
	}
    //QString optionStr = rxEnv.cap(2);
	//qDebug()<< name << ":"<< optionStr;
	QString zw = "\\begin{" + name + "}#S";
	if (!results.contains(zw))
		results << zw;
	zw = "\\end{" + name + "}#S";
	if (!results.contains(zw)) {
		results << zw;
	}
	return true;
}

bool LatexStyleParser::parseLineInput(QStringList &results, const QString &line, QStringList &parsedPackages, const QString &fileName) const
{
    static const QRegularExpression rxInput("\\\\input\\s*\\{?([\\w._-]+)");

    QRegularExpressionMatch rxmInput=rxInput.match(line);

    if (!rxmInput.hasMatch()) {
		return false;
	}
    QString name = rxmInput.captured(1);
    // check if included is already known as cwl
    QFileInfo fi(name);
    QString baseName=fi.baseName();

    if(fi.exists("cwl:"+baseName+".cwl")){
        // refer to already provided cwl
        results<<"#include:"+baseName;
    }else{
        name = kpsewhich(name);
        if (!name.isEmpty() && name != fileName) { // avoid indefinite loops
            results << readPackage(name, parsedPackages);
        }
    }
	return true;
}

bool LatexStyleParser::parseLineNewLength(QStringList &results, const QString &line)
{
    static const QRegularExpression rxNewLength("\\\\newlength\\s*\\{\\\\(\\w+)\\}");

    QRegularExpressionMatch rxmNewLength=rxNewLength.match(line);

    if (!rxmNewLength.hasMatch()) {
		return false;
	}
    QString name = "\\" + rxmNewLength.captured(1);
	if (name.contains("@")) {
		return true;
	}
	if (!results.contains(name)) {
		results << name;
	}
	return true;
}

bool LatexStyleParser::parseLineNewCounter(QStringList &results, const QString &line)
{
    static const QRegularExpression rxNewCounter("\\\\newcounter\\s*\\{(\\w+)\\}");

    QRegularExpressionMatch rxmNewCounter=rxNewCounter.match(line);
    if (!rxmNewCounter.hasMatch()) {
		return false;
	}
    QString name = "\\the" + rxmNewCounter.captured(1);
	if (name.contains("@")) {
		return true;
	}
	if (!results.contains(name)) {
		results << name;
	}
	return true;
}

bool LatexStyleParser::parseLineDecMathSym(QStringList &results, const QString &line)
{
    static const QRegularExpression rxDecMathSym("\\\\DeclareMathSymbol\\s*\\{\\\\(\\w+)\\}");

    QRegularExpressionMatch rxmDecMathSym=rxDecMathSym.match(line);
    if (!rxmDecMathSym.hasMatch()) {
        return false;
	}
    QString name = "\\" + rxmDecMathSym.captured(1);
	if (name.contains("@")) {
		return true;
	}
	name.append("#Sm");
	if (!results.contains(name)) {
		results << name;
	}
	return (true);
}

bool LatexStyleParser::parseLineRequire(QStringList &results, const QString &line)
{
    static QRegularExpression rxRequire("\\\\(RequirePackage|RequirePackageWithOptions)\\s*?(\\[\\S*?\\])?\\s*?\\{(\\S+?)\\}");

    QRegularExpressionMatch rxmRequire=rxRequire.match(line);
    if (!rxmRequire.hasMatch()) {
		return false;
	}
    QString arg = rxmRequire.captured(3);
	foreach (QString elem, arg.split(',')) {
		QString package = elem.remove(' ');
		if (!package.isEmpty())
			results << "#include:" + package;
	}
	return true;
}

bool LatexStyleParser::parseLineRequireStart(QStringList &results, const QString &line, bool &inRequirePackage)
{
    static const QRegularExpression rxRequireStart("\\\\(RequirePackage|RequirePackageWithOptions)\\s*(\\[\\S*\\])?\\s*\\{(.+)");

    QRegularExpressionMatch rxmRequireStart=rxRequireStart.match(line);

    if (!rxmRequireStart.hasMatch()) {
        return false;
	}
    QString arg = rxmRequireStart.captured(3);
	int requireEnd = arg.indexOf('}');
	if (requireEnd >= 0) {
		arg = arg.left(requireEnd);
	} else {
		inRequirePackage = true;
	}
	foreach (QString elem, arg.split(',')) {
		QString package = elem.remove(' ');
		if (!package.isEmpty()) {
			results << "#include:" + package;
		}
	}
	return (true);
}

bool LatexStyleParser::parseLineLoadClass(QStringList &results, const QString &line) const
{
    static const QRegularExpression rxLoadClass("\\\\(LoadClass|LoadClassWithOptions)\\s*(\\[\\S*\\])?\\s*\\{(\\w+)\\}");

    QRegularExpressionMatch rxmLoadClass=rxLoadClass.match(line);

    if (!rxmLoadClass.hasMatch()) {
		return false;
	}
    QString arg = rxmLoadClass.captured(3);
	if (!arg.isEmpty()) {
		if (mPackageAliases.contains(arg))
			foreach (QString elem, mPackageAliases.values(arg)) {
				results << "#include:" + elem;
			}
		else {
			results << "#include:" + arg;
		}
	}
	return true;
}

bool LatexStyleParser::parseLineXparseCommand(QStringList &results, const QString &line)
{
    static const QRegularExpression rxComBrace("\\\\(?:New|Provide|Declare)(?:Expandable)?DocumentCommand\\s*\\{(\\\\\\w+)\\}\\s*");
    static const QRegularExpression rxComNoBrace("\\\\(?:New|Provide|Declare)(?:Expandable)?DocumentCommand\\s*(\\\\\\w+)\\s*");

    QRegularExpressionMatch rxm=rxComBrace.match(line);
    if (!rxm.hasMatch()) {
        rxm=rxComNoBrace.match(line);
    }
    if (!rxm.hasMatch()) {
		return false;
	}
    QString name = rxm.captured(1);
	if (name.contains("@")) {
		return true;
	}
	XpArgList xpArgs;
    int pos=rxm.capturedStart();
    if (parseLineXparseArgs(xpArgs, line, pos + rxm.capturedLength()) == false) {
		return false;
	}
    parseLineXparseOutputCwl(results, name, xpArgs.constBegin(), xpArgs.constEnd(), 1);
	return true;
}

bool LatexStyleParser::parseLineXparseEnv(QStringList &results, const QString &line)
{
    static const QRegularExpression rxComEnv("\\\\(?:New|Provide|Declare)DocumentEnvironment\\s*\\{\\s*(\\w+)\\s*\\}\\s*");

    QRegularExpressionMatch rxmComEnv=rxComEnv.match(line);
    if (!rxmComEnv.hasMatch()) {
		return false;
	}
    QString name = rxmComEnv.captured(1);
	if (name.contains("@")) {
		return true;
	}
	XpArgList xpArgs;
    int pos = rxmComEnv.capturedStart();
    if (parseLineXparseArgs(xpArgs, line, pos + rxmComEnv.capturedLength()) == false) {
		return false;
	}
    parseLineXparseOutputCwl(results, "\\begin{" + name + "}", xpArgs.constBegin(), xpArgs.constEnd(), 1);
	QString zw = "\\end{" + name + "}#S";
	if (!results.contains(zw)) {
		results << zw;
	}
	return true;
}

bool LatexStyleParser::parseLineXparseArgs(XpArgList &xpArgs, const QString &line, int lineOffset)
{
	QString group;

	if (parseLineGetGroup(group, line, lineOffset) == false) {
		return false;
	}
	xpArgs.clear();
	int groupOffset = 0;
	for (;;) {
        static const QRegularExpression rxProc("^\\s*>\\s*\\{[^}]*\\}\\s*");
        static const QRegularExpression rxArgDef("^\\s*([!+]*\\w+(?:\\{[^}]*\\})*)\\s*");

        QRegularExpressionMatch rxmProc=rxProc.match(group, groupOffset);
        if (rxmProc.hasMatch()) {
            groupOffset += rxmProc.capturedLength();
        } else {
            QRegularExpressionMatch rxmArgDef=rxArgDef.match(group, groupOffset);
            if (rxmArgDef.hasMatch()) {
                XpArg oneXpArg;

                if (parseLineXparseOneArg(oneXpArg, rxmArgDef.captured(1))) {
                    xpArgs.push_back(oneXpArg);
                }
                groupOffset += rxmArgDef.capturedLength();
            } else {
                // Reached end of group or trailing whitespace
                break;
            }
        }
	}
	return true;
}

bool LatexStyleParser::parseLineGetGroup(QString &group, const QString &line, int groupStart)
{
	int len, groupEnd, depth;

	len = line.length();
	if (len - groupStart < 2) {
		return false;
	}
	if (line [groupStart] != '{') {
		return false;
	}
	++groupStart;
	depth = 1;
	for (groupEnd = groupStart; groupEnd < len; ++groupEnd) {
		QChar oneChar = line.at (groupEnd);
		if (oneChar == '{') {
			++depth;
		} else if (oneChar == '}') {
			if (--depth == 0) {
				group = line.mid(groupStart, groupEnd - groupStart);
				return true;
			}
		}
	}
	return false;
}

bool LatexStyleParser::parseLineXparseOneArg(XpArg &xpArg, const QString &argDef)
{
    static const QRegularExpression rxArg(
		"^"
		"(?:!|\\+)*"
		"("
			"([moOs])|"
			"([rRdD]..)|"
			"(t.)"
		")"
	);

    QRegularExpressionMatch rxmArg=rxArg.match(argDef);
    if (!rxmArg.hasMatch()) {
		return false;
	}
    QString match = rxmArg.captured(1);
	QChar type = match.at (0);
	if (type == 'm') {
		xpArg.optional = false;
		xpArg.delimLeft = '{';
		xpArg.delimRight = '}';
        xpArg.fixedChar = QChar();
	} else if ((type == 'o') || (type == 'O')) {
		xpArg.optional = true;
		xpArg.delimLeft = '[';
		xpArg.delimRight = ']';
        xpArg.fixedChar = QChar();
	} else if (type == 's') {
		xpArg.optional = true;
        xpArg.delimLeft = QChar();
        xpArg.delimRight = QChar();
		xpArg.fixedChar = '*';
	} else if ((type == 'r') || (type == 'R')) {
		xpArg.optional = false;
		xpArg.delimLeft = match.at(1);
		xpArg.delimRight = match.at(2);
        xpArg.fixedChar = QChar();
	} else if ((type == 'd') || (type == 'D')) {
		xpArg.optional = true;
		xpArg.delimLeft = match.at(1);
		xpArg.delimRight = match.at(2);
        xpArg.fixedChar = QChar();
	} else if (type == 't') {
		xpArg.optional = true;
        xpArg.delimLeft = QChar();
        xpArg.delimRight = QChar();
		xpArg.fixedChar = match.at(1);
	} else {
		// Should never happen
		return false;
	}
	return true;
}

void LatexStyleParser::parseLineXparseOutputCwl(QStringList &results, const QString &prefix, XpArgList::const_iterator itPos, XpArgList::const_iterator itEnd, int argIndex)
{
	if (itPos == itEnd) {
		QString cwlLine = prefix + "#S";
		if (!results.contains(cwlLine)) {
			results << cwlLine;
		}
		return;
	}
	const XpArg &xpOneArg = *itPos++;
	QString cwlOneArg =
        (xpOneArg.fixedChar != nullptr) ?
		QString(xpOneArg.fixedChar) :
		(
			QString(xpOneArg.delimLeft) +
			(xpOneArg.optional ? "optarg" : "arg") +
			QString::number(argIndex) +
			xpOneArg.delimRight
		);
	parseLineXparseOutputCwl(results, prefix + cwlOneArg, itPos, itEnd, argIndex+1);
	if (xpOneArg.optional) {
		parseLineXparseOutputCwl(results, prefix, itPos, itEnd, argIndex);
	}
}

QStringList LatexStyleParser::readPackage(QString fileName, QStringList &parsedPackages) const
{
	if (parsedPackages.contains(fileName))
		return QStringList();
	QFile data(fileName);
	QStringList results;
	if (data.open(QIODevice::ReadOnly | QIODevice::Text)) {
		QTextStream stream(&data);
		parsedPackages << fileName;
		QString line;
		bool inRequirePackage = false;
		while (!stream.atEnd()) {
            line = cutComment(stream.readLine());
			results << parseLine(line, inRequirePackage, parsedPackages, fileName);
		}
	}
	return results;
}

QString LatexStyleParser::kpsewhich(QString name, QString dirName) const
{
	if (name.startsWith("."))
		return "";  // don't check .sty/.cls
	QString fn = name;
	if (!kpseWhichCmd.isEmpty()) {
		ExecProgram execProgram(kpseWhichCmd, QStringList());
		if (!dirName.isEmpty()) {
			execProgram.m_arguments << "-path=" + dirName;
		}
		execProgram.m_arguments << fn;
		if (execProgram.execAndWait()) {
			fn = execProgram.m_standardOutput.split('\n').first().trimmed(); // in case more than one results are present
		} else
			fn.clear();
	}
	return fn;
}

QStringList LatexStyleParser::readPackageTexDef(QString fn) const
{
	if (!fn.endsWith(".sty"))
		return QStringList();

	QString fname = fn.left(fn.length() - 4);
	ExecProgram execProgram(texdefDir + "texdef", QStringList(), texdefDir);
	execProgram.m_arguments << "-t" << "latex" << "-l" << "-p" << fname;
	if (!execProgram.execAndWait()) {
		return QStringList();
	}
	QStringList lines = execProgram.m_standardOutput.split('\n');
	QStringList args;
	bool incl = false;
	for (int i = 0; i < lines.length(); i++) {
		if (lines.at(i).startsWith("Defined")) {
			QString name = lines.at(i);
			name = name.mid(17);
			name = name.left(name.length() - 2);
			incl = (name == fn);
			if (!incl)
				args << "#include:" + name;
		}
		if (incl && lines.at(i).startsWith("\\")) {
			if (lines.at(i).startsWith("\\\\")) {
				QString zw = lines.at(i) + "#S";
				zw.remove(0, 1);
				//args<<zw;
			} else {
				args << lines.at(i) + "#S";
			}
		}
	}
	// replace tex env def by latex commands
    QStringList zw = args.filter(QRegularExpression("\\\\end.+"));
	foreach (const QString &elem, zw) {
		QString begin = elem;
		begin.remove(1, 3);
		int i = args.indexOf(begin);
		if (i != -1) {
			QString env = begin.mid(1, begin.length() - 3);
			args.replace(i, "\\begin{" + env + "}");
			i = args.indexOf(elem);
			args.replace(i, "\\end{" + env + "}");
		}
	}

	return args;
}

QStringList LatexStyleParser::readPackageTracing(QString fn) const
{
	if (!fn.endsWith(".sty"))
		return QStringList();

	fn.chop(4);

	QString tempPath = QDir::tempPath() + QDir::separator() + "." + QDir::separator();
	QTemporaryFile *tf = new QTemporaryFile(tempPath + "XXXXXX.tex");
	if (!tf) return QStringList();
	tf->open();

	QTextStream out(tf);
	out << "\\documentclass{article}\n";
	out << "\\usepackage{filehook}\n";
	out << "\\usepackage{currfile}\n";
	out << "\\AtBeginOfEveryFile{\\message{^^Jentering file \\currfilename ^^J}}\n";
	out << "\\AtEndOfEveryFile{\\message{^^Jleaving file \\currfilename ^^J}}\n";
	out << "\\tracingonline=1\n";
	out << "\\tracingassigns=1\n";
	out << "\\usepackage{" << fn << "}\n";
	out << "\\tracingassigns=0\n";
	out << "\\AtBeginOfEveryFile{}\n";
	out << "\\AtEndOfEveryFile{}\n";
	out << "\\begin{document}\n";
	out << "\\end{document}";
	tf->close();

	ExecProgram execProgram(texdefDir + "pdflatex", QStringList(), texdefDir, QFileInfo(tf->fileName()).absoluteDir().absolutePath());
	execProgram.m_arguments << "-draftmode" << "-interaction=nonstopmode" << "--disable-installer" << tf->fileName();
	if (!execProgram.execAndWait()) {
		return QStringList();
	}
	QStringList lines = execProgram.m_standardOutput.split('\n');
	QStringList args;
	QStack<QString> stack;
	foreach (const QString elem, lines) {
		if (elem.startsWith("entering file")) {
			QString name = elem.mid(14);
			stack.push(name);
			if (stack.size() == 2) { // first level of include
				args << "#include:" + name;
			}
		}
		if (elem.startsWith("leaving file")) {
			stack.pop();
			if (stack.isEmpty())
				break;
		}
		if (stack.size() == 1 && elem.endsWith("=undefined}")) {
			if (elem.startsWith("{changing ")  && !elem.contains("@")) {
				QString zw = elem.mid(10);
				zw.chop(11);
                zw=zw.simplified();
				if (!args.contains(zw + "#S"))
					args << zw + "#S";
			}
		}
	}

	// replace tex env def by latex commands
    QStringList zw = args.filter(QRegularExpression("\\\\end.+"));
	foreach (const QString &elem, zw) {
		QString begin = elem;
		begin.remove(1, 3);
		int i = args.indexOf(begin);
		if (i != -1) {
			QString env = begin.mid(1, begin.length() - 3);
			args.replace(i, "\\begin{" + env + "}");
			i = args.indexOf(elem);
			args.replace(i, "\\end{" + env + "}");
		}
	}

	delete tf;
	return args;
}
