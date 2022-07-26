# jurabib package
# author: Francisco Fernández Labastida 10 Apr 2007
# last modified: Ben E. Hard 27 august 2007
# modified 2022/07/25 for v0.61beta

#include:ifthen
#include:calc
#include:keyval
#include:url
#include:array

\jurabibsetup{options%keyvals}

#keyvals:\jurabibsetup#c,\usepackage/jurabib#c
authorformat=#smallcaps,italic,dynamic,citationreversed,allreversed,firstnotreversed,reducedifibidem,and,year,indexed,abbrv
annotatorformat=#italic,normal
round
square
superscriptedition=#all,commented,switch,kerning,bib,address,year,multiple
biblikecite
edby
endnote
titleformat=#italic,all,colonsep,commasep,noreplace
annotatorlastsep=#divis
annotatorfirstsep=#in,comma
ibidem
ibidem=#strict,nostrict,strictdoublepage,name,name&title,name&title&auto
commabeforerest
silent
bibformat=#nohang,tabular,numbered,ibidem,ibidemalt,compress,raggedright
lookforgender
annote
super
config=%<file%>
dotafter=#bibentry,endnote
howcited=#normal,multiple,compare,all
pages=#format,test,always
hypercite#true,false
citefull=#first,chapter,section,all
see
natoptargorder
crossref=#dynamic,normal,short,long
lookat
idem
idem=#strict,nostrict,strictdoublepage,halfstrict
opcit
citetoend#true,false
#endkeyvals

\cite[page-range]{bibid}#c
\cite[Annotator/See][page-range]{bibid}
\cite*[page-range]{bibid}#c
\cite*[Annotator/See][page-range]{bibid}
\citefield[page-range]{field}{bibid}
\citenotitlefortype{article,book,…}
\citeswithoutentry{bibid1,bibid2,…}
\citeswithoutentry{keylist}#S
\citetitle[page-range]{bibid}#c
\citetitle[Annotator/See][page-range]{bibid}
\citetitlefortype{article,book,…}
\footcite[page-range]{bibid}#c
\footcite[Annotator/See][page-range]{bibid}
\footcite*[page-range]{bibid}#c
\footcite*[Annotator/See][page-range]{bibid}
\footcitetitle[page-range]{bibid}#c
\footcitetitle[Annotator/See][page-range]{bibid}
\footfullcite[page-range]{bibid}#c
\footfullcite[Annotator/See][page-range]{bibid}
\fullcite[page-range]{bibid}#c
\fullcite[Annotator/See][page-range]{bibid}
\nextcitefull{bibid1,bibid2,…}
\nextcitefull{keylist}#S
\nextcitenotitle{bibid1,bibid2,…}
\nextcitenotitle{keylist}#S
\nextcitereset{bibid1,bibid2,…}
\nextcitereset{keylist}#S
\nextciteshort{bibid1,bibid2,…}
\nextciteshort{keylist}#S
\nobibliography{bib file}
\noibidem
\noidem
\bibAnnotePath{file-path%definition}
\biburlfont{choice%keyvals}
#keyvals:\biburlfont
tt
rm
sf
same
#endkeyvals
\nopage{text}
\pageadd{text}
\formatpages{article,book,…}{left-delim}{right-delim}
\formatpages[after-separator]{article,book,…}{left-delim}{right-delim}
\formatpages[after-separator][before-separator]{article,book,…}{left-delim}{right-delim}

# emulated natbib commands
\citealp[postfix]{keylist}#*
\citealp{keylist}#*c
\citealt{keylist}#*c
\citeauthor{keylist}#*c
\citep[postfix]{keylist}#*
\citep[prefix][postfix]{keylist}#*
\citep{keylist}#*c
\citet[postfix]{keylist}#*
\citet{keylist}#*c
\citeyear{keylist}#*c
\citeyearpar{keylist}#*c
\footcitealp[postfix]{keylist}#*
\footcitealp{keylist}#*c
\footcitealt{keylist}#*c
\footciteauthor{keylist}#*c
\footcitep[postfix]{keylist}#*
\footcitep[prefix][postfix]{keylist}#*
\footcitep{keylist}#*c
\footcitet[postfix]{keylist}#*
\footcitet{keylist}#*c
\footciteyear{keylist}#*c

# miscellaneous
\AddTo{cmd}{code}#*
\bibansep#*
\bibartperiodhowcited#*
\bibatsep#*
\bibauthormultiple#*
\bibbdsep#*
\bibbfsasep#*
\bibbfsesep#*
\bibbstasep#*
\bibbstesep#*
\bibbtasep#*
\bibbtesep#*
\bibbtsep#*
\bibbudcsep#*
\bibcommenthowcited#*
\bibhowcited#*
\bibidemPfname#*
\bibidempfname#*
\bibidemPmname#*
\bibidempmname#*
\bibidemPnname#*
\bibidempnname#*
\bibidemSfname#*
\bibidemsfname#*
\bibidemSmname#*
\bibidemsmname#*
\bibidemSnname#*
\bibidemsnname#*
\bibjtsep#*
\bibleftcolumn#*
\bibleftcolumnadjust#*
\bibnotcited#*
\bibnumberformat{text}#*
\bibpagename#*
\bibpagesname#*
\bibrightcolumn#*
\bibrightcolumnadjust#*
\bibsaustrian#*
\bibsdanish#*
\bibsdutch#*
\bibsenglish#*
\bibsfinnish#*
\bibsfrench#*
\bibsgerman#*
\bibsitalian#*
\bibsnfont#*
\bibsnorsk#*
\bibsportuguese#*
\bibsspanish#*
\bibsswedish#*
\biburlprefix#*
\biburlsuffix#*
\diffpageibidemmidname#*
\diffpageibidemname#*
\Edbyname#*
\edbyname#*
\editionname#*
\editorname#*
\editorsname#*
\fifthedname#*
\firstedname#*
\fourthedname#*
\herename#*
\ibidemmidname#*
\ibidemname#*
\idemmidname#*
\idemname#*
\idemPfname#*
\idempfname#*
\idemPmname#*
\idempmname#*
\idemPnname#*
\idempnname#*
\idemSfname#*
\idemsfname#*
\idemSmname#*
\idemsmname#*
\idemSnname#*
\idemsnname#*
\inname#*
\jbactualauthorfnfont#*
\jbactualauthorfont#*
\jbaensep#*
\jbannotatorfont#*
\jbannoteformat{text}#*
\jbapifont#*
\jbatsep#*
\jbauthorfnfont#*
\jbauthorfont#*
\jbauthorfontifannotato#*
\jbauthorfontifannotator#*
\jbauthorindexfont{text}#*
\jbbfsasep#*
\jbbfsesep#*
\jbbibhang#*
\jbbibyearformat{arg}#*
\jbbstasep#*
\jbbstesep#*
\jbbtasep#*
\jbbtesep#*
\jbbtitlefont#*
\jbcitationoyearformat{arg}#*
\jbcitationyearformat{arg}#*
\jbdisablecitationcrossref#*
\jbdonotindexauthors#*
\jbdonotindexeditors#*
\jbdonotindexorganizations#*
\jbeditorindexfont{text}#*
\jbedseplikecite#*
\jbfirstcitepageranges#*
\jbfulltitlefont#*
\jbhowsepbeforetitle#*
\jbignorevarioref#*
\jbindexbib#*
\jbindexonlyfirstauthors#*
\jbindexonlyfirsteditors#*
\jbindexonlyfirstorganizations#*
\jbindextype#*
\jblangle#*
\jbmakeindexactual#*
\jbnoformatafterstartpagefalse#*
\jbnoformatafterstartpagetrue#*
\jborganizationindexfont{text}#*
\jborgauthorfont#*
\jboyearincitation#*
\jbpagename#*
\jbpagesname#*
\jbrangle#*
\jbshorttitlefont#*
\jbsuperscripteditionafterauthor#*
\jbtitlefont#*
\jbyearaftertitle#*
\lookatprefix#*
\lookatsuffix#*
\opcit#*
\samepageibidemmidname#*
\samepageibidemname#*
\secondedname#*
\SSS#*
\thedname#*
\thirdedname#*
\updatename#*
\updatesep#*
\urldatecomment#*
\volumename#*
\Volumename#*

# not documented
\addtoalllanguages#S
\afterfoundersep#S
\aftervolsep#S
\ajtsep#S
\alsothesisname#S
\aprname#S
\apyformat{arg}#S
\artnumberformat{arg}#S
\artvolnumformat{arg1}{arg2}#S
\artvolumeformat{arg}#S
\artyearformat{arg}#S
\augname#S
\backrefparscanfalse#S
\backrefparscantrue#S
\backrefprint#S
\bibaesep#S
\bibaldelim#S
\bibaltformatalign#S
\bibandname#S
\bibanfont#S
\bibAnnote{arg}#S
\bibAnnoteFile{arg}#S
\bibAnSep#S
\bibapifont#S
\bibapyldelim#S
\bibapyrdelim#S
\bibardelim#S
\Bibbfsasep#S
\Bibbfsesep#S
\Bibbstasep#S
\Bibbstesep#S
\bibbtafont#S
\Bibbtasep#S
\Bibbtesep#S
\bibbtfont#S
\bibBTsep#S
\bibces#S
\bibchapterlongname#S
\bibchaptername#S
\Bibchaptername#S
\bibcite#S
\bibcolumnsep#S
\bibcontinuedname#S
\bibcrossrefcite#S
\bibcrossrefciteagain#S
\bibeandname#S
\bibedformat{arg}#S
\bibedinformat{arg}#S
\bibefnfont#S
\bibeimfont#S
\bibEIMfont{arg}#S
\bibel{arg}#S
\bibelnfont#S
\bibenf{arg1}{arg2}{arg3}{arg4}{arg5}#S
\Bibetal#S
\bibfnfmt#S
\bibfnfont#S
\bibibidfont#S
\bibidemhrule#S
\bibimfont#S
\bibIMfont{arg}#S
\bibincollcrossrefcite#S
\bibincollcrossrefciteagain#S
\bibjtfont#S
\bibJTsep#S
\bibleftcolumnstretch#S
\biblenf{arg1}{arg2}{arg3}{arg4}{arg5}#S
\biblnfmt#S
\biblnfont#S
\bibnf{arg1}{arg2}{arg3}{arg4}{arg5}#S
\bibnumberwidth#S
\bibPageName#S
\bibPagesName#S
\bibpagesnamesep#S
\bibpldelim#S
\bibprdelim#S
\bibrenf{arg1}{arg2}{arg3}{arg4}{arg5}#S
\bibrevtfont#S
\bibrightcolumnstretch#S
\bibrlenf{arg1}{arg2}{arg3}{arg4}{arg5}#S
\bibrnf{arg1}{arg2}{arg3}{arg4}{arg5}#S
\bibsall#S
\bibSheetName#S
\bibsheetname#S
\bibSheetsName#S
\bibsheetsname#S
\bibsheetsnamesep#S
\bibshorttitlefmt{arg}#S
\bibstyle{arg}#S
\bibtabularitemsep#S
\bibtafont#S
\bibtfont#S
\bibtnf{arg1}{arg2}{arg3}{arg4}{arg5}#S
\bibtotalpagesname#S
\bibvolumecomment#S
\bibvtfont#S
\bibYear{arg}#S
\bothaesep#S
\bpubaddr#S
\byname#S
\citefullfirstfortype{arg}#S
\citetitleonly#S
\citeworkwithtitle{arg}#S
\commaename#S
\commaname#S
\dateldelim#S
\daterdelim#S
\decname#S
\ecmd#S
\edbysep#S
\edfont{arg}#S
\el{arg}#S
\enoteformat#S
\etalname#S
\etalnamenodot#S
\febname#S
\footcitetitleonly#S
\foundername#S
\fromdutch#S
\fromenglish#S
\fromfinnish#S
\fromfrench#S
\fromgerman#S
\fromitalian#S
\fromnorsk#S
\fromportuguese#S
\fromspanish#S
\fsted{arg}#S
\fullnameoxfordcrossref{arg}#S
\gobblecite{arg}#S
\howcitedprefix#S
\howcitedsuffix#S
\IbidemMidName#S
\IbidemName#S
\idemPfedbyname#S
\idempfedbyname#S
\idemPmedbyname#S
\idempmedbyname#S
\idemPnedbyname#S
\idempnedbyname#S
\idemSfedbyname#S
\idemsfedbyname#S
\idemSmedbyname#S
\idemsmedbyname#S
\idemSnedbyname#S
\idemsnedbyname#S
\ifbackrefparscan#S
\ifjbaltformat#S
\ifjbchicago#S
\ifjbcross#S
\ifjbetal#S
\ifjbhum#S
\ifjbidemabbrvwithperiod#S
\ifjblookforgender#S
\ifjbmhra#S
\ifjbnoformatafterstartpage#S
\ifjbopcit#S
\ifjboxford#S
\ifjbusehowcitedforcite#S
\ifjbuseidemhrule#S
\ifjbweareinbib#S
\ifjbweareinendnotes#S
\ifjbweareinhowcited#S
\incolledformat{arg1}{arg2}{arg3}{arg4}{arg5}#S
\inseriesname#S
\janname#S
\jbaddtomakehowcited#S
\jbafterstartpagesep#S
\jbaltformatfalse#S
\jbaltformattrue#S
\jbarchnameformat{arg}#S
\jbarchnameformat{arg}#S
\jbarchnamesep#S
\jbArchPages{arg}#S
\jbarchprformat{arg}#S
\jbArchSheets{arg}#S
\jbarchsig{arg1}{arg2}#S
\jbartcrossrefchecked[opt]{arg}#S
\jbartcrossrefchecked{arg}#S
\jbartPages{arg}#S
\jbauthorinfo#S
\jbbeforestartpagesep#S
\jbbibargs{arg1}{arg2}{arg3}{arg4}{arg5}{arg6}#S
\jbbibonly{arg}#S
\jbbookedaftertitle#S
\jbbtfont#S
\jbCheckedFirst#S
\jbchicagofalse#S
\jbchicagotrue#S
\jbciteonly{arg}#S
\jbcitetitle#S
\jbcrossfalse#S
\jbcrossrefchecked[opt]{arg}#S
\jbcrossrefchecked{arg}#S
\jbcrosstrue#S
\jbdoitem#S
\jbdy#S
\jbedafti{arg}#S
\jbedbyincollcrossrefcite{arg}#S
\jbedbyincollcrossrefciteagain{arg}#S
\jbedbyincollcrossreflong{arg}#S
\jbedbyincollcrossrefshort{arg}#S
\jbedbyincollcrossrefshortnoapy{arg}#S
\jbedbyincollcrossrefshortwithapy{arg}#S
\jbedition{arg}#S
\jbedwidth#S
\jbeimfont#S
\jbendnote{arg}#S
\jbetalfalse#S
\jbetaltrue#S
\jbFirst#S
\jbFirstAbbrv#S
\jbflanguage{arg}#S
\jbfootcite#S
\jbfootcitenotitle#S
\jbfootcitetitle#S
\jbfootfullcite#S
\jbfootnoteformat#S
\jbfootnoteindent#S
\jbfootnotenumalign#S
\jbfootnotenumwidth#S
\jbfullcite#S
\jbhowcitedcomparepart#S
\jbhowcitednormalpart#S
\jbhowsepannotatorfirst#S
\jbhowsepannotatorlast#S
\jbhowsepbeforetitleae#S
\jbhowsepbeforetitleibidemname#S
\jbhumfalse#S
\jbhumtrue#S
\jbidemabbrvwithperiodfalse#S
\jbidemabbrvwithperiodtrue#S
\jbimfont#S
\jbincollcrossref{arg1}{arg2}#S
\jbisbn{arg}#S
\jbissn{arg}#S
\jbJunior#S
\jbLast#S
\jblinebreak#S
\jblookforgender#S
\jblookforgenderfalse#S
\jblookforgendertrue#S
\jbmakeinbib#S
\jbmakeinbiblist#S
\jbmakelookforgender#S
\jbmhrafalse#S
\jbmhratrue#S
\jbnote{arg1}{arg2}#S
\jbNotRevedNoVonJr#S
\jbNotRevedNoVonNoJr#S
\jbNotRevedOnlyLast#S
\jbNotRevedVonJr#S
\jbNotRevedVonNoJr#S
\jbnotsamearch#S
\jbnovarioref#S
\jbonlyforbib#S
\jbonlyforcitations#S
\jbonlyforfirstcitefullbegin#S
\jbonlyforfirstcitefullend#S
\jbopcitfalse#S
\jbopcittrue#S
\jboxfordfalse#S
\jboxfordtrue#S
\jbPageName#S
\jbpages#S
\jbPAGES#S
\jbPages{arg}#S
\jbpagesep#S
\jbpagesformat{arg}#S
\jbPagesName#S
\jbpagesnamesep#S
\jbprformat{arg}#S
\jbpublisher{arg}#S
\jbrealcitation{arg1}{arg2}#S
\jbRevedFirstNoVonJr#S
\jbRevedFirstNoVonNoJr#S
\jbRevedFirstOnlyLast#S
\jbRevedFirstVonJr#S
\jbRevedFirstVonNoJr#S
\jbRevedNotFirstNoVonJr#S
\jbRevedNotFirstNoVonNoJr#S
\jbRevedNotFirstOnlyLast#S
\jbRevedNotFirstVonJr#S
\jbRevedNotFirstVonNoJr#S
\jbsamearch#S
\jbsamesubarch#S
\jbsamesubarchindent#S
\jbselectlanguage#S
\jbSheetName#S
\jbsheetname#S
\jbSheetsName#S
\jbsheetsname#S
\jbsheetsnamesep#S
\jbshortarchformat{arg}#S
\jbshortsubarchformat{arg}#S
\jbshowbibextralabel#S
\jbsrformat{arg}#S
\jbssedbd#S
\jbsubarchsep#S
\jbsy{arg}#S
\jbtiafed{arg}#S
\jbts{arg}#S
\jburldef{arg}#S
\jburluse{arg}#S
\jbusehowcitedforcitefalse#S
\jbusehowcitedforcitetrue#S
\jbuseidemhrule#S
\jbuseidemhrulefalse#S
\jbuseidemhruletrue#S
\jbVon#S
\jbweareinbibfalse#S
\jbweareinbibtrue#S
\jbweareinendnotesfalse#S
\jbweareinendnotestrue#S
\jbweareinhowcitedfalse#S
\jbweareinhowcitedtrue#S
\jbyear#S
\julname#S
\junname#S
\jurthesisname#S
\lookatfortype{arg}#S
\marname#S
\mastersthesisname#S
\mayname#S
\nocitebuthowcited{arg}#S
\nofirstnameforcitation#S
\novname#S
\numberandseries{arg1}{arg2}#S
\numbername#S
\Numbername#S
\octname#S
\ofseriesname#S
\OpCit#S
\organizationname#S
\origartPages{arg}#S
\origbibces#S
\origcrossref#S
\origPAGES{arg}#S
\origpages{arg}#S
\origPages{arg}#S
\osep#S
\pernumberformat{arg}#S
\pervolnumformat{arg1}{arg2}#S
\pervolumeformat{arg}#S
\peryearformat{arg}#S
\phdthesisname#S
\ProcessOptionsWithKV{family}#S
\Reprint#S
\reprint#S
\reprintname#S
\reviewbyname#S
\reviewname#S
\reviewofname#S
\revnumberformat{arg}#S
\revvolnumformat{arg1}{arg2}#S
\revvolumeformat{arg}#S
\revyearformat{arg}#S
\sepname#S
\sndecmd#S
\snded{arg}#S
\sndeditorname#S
\sndeditorsname#S
\technicalreportname#S
\testnosig#S
\textandname#S
\texteandname#S
\textitswitch{text}#S
\thebibnamereplace#S
\thecitefull#S
\theidemcnt#S
\thejbbibcnt#S
\thejbbibcnta#S
\theopcit#S
\trans#S
\transby#S
\transfrom#S
\Transfrom#S
\translator{arg1}{arg2}{arg3}#S
\volname#S
\volumeformat{arg}#S
\volumeofname#S
\Wrapquotes{text}#S

# deprecated
\formatarticlepages[opt]{arg1}{arg2}#S
\formatarticlepages{arg1}{arg2}#S
\jbdotafterbibentry#S
\jbdotafterendnote#S
\jbsilent#S
