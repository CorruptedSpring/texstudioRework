# ltugboat class
# Matthew Bertucci 2024/10/28 for v2.33

#include:mflogo
#include:gettitlestring

#keyvals:\documentclass/ltugboat#c
draft
extralabel
final
harvardcite
noextralabel
nonumber
numbersec
onecolumn
preprint
rawcite
runningfull
runningminimal
runningoff
#endkeyvals

#ifOption:harvardcite
\bibentry#*
\bibhang#*
\bibindent#*
\citeA{key}#c
\citeANP{key}#c
\citeauthoryear{arg1}{arg2}{arg3}#*
\citeN{key}#c
\citeNP{key}#c
\citeyear{key}#c
\citeyearNP{key}#c
\etal#*
\shortcite{key}#c
\shortciteA{key}#c
\shortciteANP{key}#c
\shortciteN{key}#c
\shortciteNP{key}#c
#endif

\acro{acronym}
\address{address%text}
\AddToResetCommands{code}#*
\allowhyphens#*
\AllTeX
\AMS
\AmS
\AmSLaTeX
\AmSTeX
\ANSI
\API
\ASCII
\authorlist{name}#*
\authornumber#*
\AW
\aw
\basezero
\begin{appendix}
\begin{compactdescription}
\begin{compactenumerate}
\begin{compactitemize}
\begin{dedication}
\begin{longabstract}
\begin{reviewitem}#*
\begin{SafeSection}#*
\begin{verbatim}[before code]
\bfBibTeX#*
\Bib
\BibJustification#*
\BibLaTeX
\BibTeX
\bigissdt#*
\BlackBoxes
\booktitle{text}#S
\botregister
\botsmash
\boxcs{csname}
\BSD
\bull
\CandT
\careof
\cents
\chapter*{title}#L1
\chapter[short title]{title}#L1
\chapter{title}#L1
\CMkIV
\ConTeXt
\contributor{name}
\Cplusplus
\CPU
\creditfootnote{text}#*
\cs{csname}
\CSczabbr
\CSS
\CSTUG
\CSV
\CTAN
\Dag
\dash
\Dash
\DeclareLaTeXLogo{family}{series}{shape}{kern1}{kern2}#*
\dlap{text}
\drawoutlinebox[height;width;thickness]
\DTD
\DTK
\DVD
\DVI
\DVIPDFMx
\DVItoVDU
\ECMA
\EDITORnoaddress#*
\EDITORnonetaddress#*
\EdNote[text]#*
\EdNote{text}#*
\EdNoteFont#*
\emdash
\end{appendix}
\end{compactdescription}
\end{compactenumerate}
\end{compactitemize}
\end{dedication}
\end{longabstract}
\end{reviewitem}#*
\end{SafeSection}#*
\endash
\EPS
\eTeX
\ExTeX
\FAQ
\fileinput{file}#*i
\FirstParfalse#*
\FirstPartrue#*
\FTP
\Ghostscript
\GNU
\gobble#*
\GUI
\HarfBuzz
\Hawaii
\hours#*
\HTML
\HTTP
\HTTPS
\hyph
\IDE
\IEEE
\ifFirstPar#*
\ifPrelimDraft
\ifpreprint#*
\ifSecTitle#*
\ifshortAuthor#*
\ifTBunicodeengine#*
\ifTestIf#*
\iftubfinaloption#*
\iftubomitdoioption#*
\iftubsecondcolstart#*
\iftubtitlerulefullwidth#*
\ifundefined{csname}
\ifWideSecTitle#*
\Input{file}#*i
\iOS
\ISBN
\ISO
\issdate#*
\issdt#*
\ISSN
\issno#*
\issueseqno#*
\issyear#*
\JoT
\JPEG
\JTeX
\KOMAScript
\La#*
\LAMSTeX
\latexnobreakspace#*
\latextubstyle#*
\ldash
\Ldash
\LMTX
\lstlistingnamestyle#*
\LuaHBLaTeX
\LuaHBTeX
\LuaLaTeX
\LuaTeX
\luatex#*
\LyX
\macOS
\MacOSX
\makeactive%<<symbol>%>#*
\makealign%<<symbol>%>#*
\makebgroup%<<symbol>%>#*
\makecomment%<<symbol>%>#*
\makeegroup%<<symbol>%>#*
\makeeol%<<symbol>%>#*
\makeescape%<<symbol>%>#*
\makeignore%<<symbol>%>#*
\makeletter%<<symbol>%>#*
\makemath%<<symbol>%>#*
\makeother#*
\makeparm%<<symbol>%>#*
\MakeRegistrationMarks#*
\makesignature
\makespace%<<symbol>%>#*
\makestrut[height;depth]
\makesub%<<symbol>%>#*
\makesup%<<symbol>%>#*
\makevmeta
\MathML
\Mc
\meta{arg}
\mf
\MFB
\midrtitle
\minutes#*
\MkIV
\mp
\mspmetavar{var}{value}#*
\mtex
\nameref{label}#r
\net#S
\netaddrat#*
\NetAddrChars#*
\netaddrdot#*
\netaddress[opt]{email%URL}#*U
\netaddress{email%URL}#U
\netaddrpercent#*
\network{arg}#*
\newboxcs{csname}
\ninepoint#*
\NoBlackBoxes
\nohyphens#*
\nomarkfootnote{commands}{text}#*
\NoParIndent
\NormalParIndent
\normalparindent#*
\normalspaces
\now
\Now
\NTG
\nth{number}
\NTS
\nullhrule
\nullvrule
\OCP
\OMEGA
\OOXML
\OpTeX
\ORCID{ORCID}
\OTF
\other#S
\OTP
\PageXref{arg}#*
\pagexref{label}#*r
\PageXrefOFF{arg}#*
\pagexrefOFF{label}#*r
\PageXrefON{arg}#*
\pagexrefON{label}#*r
\Pas
\pcMF
\PCTeX
\pcTeX
\PDF
\pdfLaTeX
\pdflatex#*
\pdfTeX
\pdftex#*
\personalURL{URL}#U
\PGF
\phone#*
\PHP
\PiC
\PiCTeX
\plain
\plaintubstyle#*
\plusplus#*
\PNG
\POBox
\PrelimDraftfalse#*
\PrelimDrafttrue#*
\preprint
\preprintfalse#*
\preprinttrue#*
\ProtectNetChars#*
\PS
\PSTricks
\raggedcenter
\raggedparfill#*
\raggedskip#*
\raggedspaces
\raggedstretch#*
\rdash
\Rdash
\ResetCommands{commands}#*
\restorecat{char}
\RestoreCS{csname}
\revauth{name}#*
\Review[header%text]{text}
\Review{text}
\revpubinfo{info}#*
\revtitle{text}#*
\rhTitle#*
\RIT
\RTF
\rtitlenexttopage
\rtitlex
\ruled
\savecat{char}
\SaveCS{csname}
\SC
\secsep#*
\sectitle#*
\SecTitlefalse#*
\sectitlefont#*
\SecTitletrue#*
\SelfDocumenting#*
\SetBibJustification{justification command}
\setboxcs{csname}
\SetTime
\sfrac%<a/b%>
\SGML
\shortAuthor{name}
\shortAuthorfalse#*
\shortAuthortrue#*
\shortTitle{text}
\signature{signature}
\signaturemark
\signaturewidth#*
\SliTeX
\slMF#S
\SMC
\smc#S
\SQL
\STIX
\stTeX
\supportfootnote{text}#*
\SVG
\TANGLE
\TB
\tbcode{text%plain}
\tbcodebreak{text%plain}
\TBdriver#*
\TBecircacute#*
\TBEnableRemarks#*
\TBError{text}#*
\tbgobbledash#*
\tbhurl{URL}#U
\tbhurlfootnote{URL}#U
\TBInfo{text}#*
\tbotregister#*
\tbppkernfoot#*
\TBremark{text}#*
\tbsurl{URL}#U
\tbsurlfootnote{URL}#U
\TBtocsectionfont#*
\TBunicodeenginefalse#S
\TBunicodeenginetrue#S
\tburl{URL}#U
\tburlfootnote{URL}#U
\tbUTF
\TBWarning{text}#*
\TBWarningNL{text}#*
\tensl#*
\TestBox#*
\TestCount#*
\TestDimen#*
\TestIffalse#*
\TestIftrue#*
\TeXhax
\TeXMaG
\texorpdfstring{arg1}{arg2}#*
\textSMC{text}#*
\texttub{text}#*
\TeXtures
\Textures
\TeXworks
\TeXXeT
\TFM
\Thanh
\theaddress{number}
\theauthor{number}
\thedoi#*
\thenetaddress{number}
\theORCID{number}
\thePersonalURL{number}
\therevauth#*
\therevpubinfo#*
\therevtitle#*
\thinskip#*
\TIFF
\TikZ
\titleref{text}
\topregister
\topsmash
\TP
\TTN
\ttn
\ttopregister#*
\TUB
\tubabovedoi#*
\tubbraced{text%plain}
\tubcaptionfonts#*
\tubcaptionleftglue#*
\tubcentsold#S
\TUBdefaulteTeX#*
\tubdoiprefix#*
\tubdots
\TUBedit{text}#*
\TUBfilename{arg1}{arg2}#*
\tubfinaloptionfalse#*
\tubfinaloptiontrue#*
\tubheadhook#*
\tubhideheight{height}#*
\tubissue{volume}(issue)
\tubjustifiedpar
\tubline{text}#*
\tubmakecaptionbox{arg1}{arg2}#*
\tubmultipleaffilauthor#*
\tubmultipleaffilnet#*
\tubomitdoioptionfalse#*
\tubomitdoioptiontrue#*
\tubraggedfoot#*
\tubreflect{text}#*
\tubruninglue#*
\tubruninsecfmt#*
\tubrunningauthor#*
\tubsecfmt#*
\tubsechook#*
\tubsecondcolstartextra#*
\tubsecondcolstartfalse#*
\tubsecondcolstarttrue#*
\tubsentencespace
\tubsmallerskip#*
\tubthinnerspace#*
\tubthinnerspaceneg#*
\tubtitlerulefullwidthfalse#*
\tubtitlerulefullwidthtrue#*
\tubtypesetdoi#*
\tubtypesetpageno{arg}#*
\tug
\TUG
\UG#*
\ulap{text}
\UNIX
\url{URL}#U
\URLchars#*
\UseExtraLabel#*
\UseTrimMarks#*
\VAX
\vellipsis
\VnTeX
\vol#*
\volno#*
\volyr#*
\VorTeX
\WEAVE
\WEB
\WideSecTitlefalse#*
\WideSecTitletrue#*
\WYSIWYG
\Xe#*
\xEdNote{text}#*
\XekernafterE#*
\XekernbeforeE#*
\XeLaTeX
\XeT#*
\XeTeX
\XHTML
\xlap{text}
\XML
\XMP
\xrefto{label}#*r
\xreftoOFF{label}#*r
\xreftoON{label}#*r
\XSL
\XSLFO
\XSLT
\YAML
\ylap{text}
\zlap{text}
