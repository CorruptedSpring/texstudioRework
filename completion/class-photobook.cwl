# photobook class
# Matthew Bertucci 2023/04/27 for v0.1.21

#include:kvoptions
#include:class-book
#include:calc
#include:xargs
#include:ifthen
#include:iftex
#include:pgffor
#include:xint
#include:xinttools
#include:listofitems
#include:xkeyval
#include:etoolbox
#include:atbegshi
#include:hyperref
#include:eso-pic
#include:environ
#include:numprint
#include:trimclip
#include:xcolor
#include:pagecolor
#include:colorspace
#include:graphicx
#include:adjustbox
#include:textpos
#include:fancyvrb
#include:tikz
#include:rotating
#include:fancyhdr
#include:pdfpages
#include:geometry

#keyvals:\documentclass/photobook#c
blockwidth=##L
blockheight=##L
bindingoffset=##L
gutteroffset=##L
bleed=##L
flatfold=##L
pagefold=#in,out
foldout=%<fold-spec%>
layoutmode=#block,spread,endpaper,cover,jacket
block
endpaper
cover
jacket
spinewidth=##L
spinefold=##L
coverboardgrow=##L
coverflap=##L
jacketwrap=##L
jacketflap=##L
jacketflapfront=##L
jacketflapback=##L
clearimage=##L
imageblockwidth=##L
imageblockheight=##L
imageblockoffsettop=##L
pdfpagelayout=#SinglePage,OneColumn,TwoColumnRight,TwoColumnLeft,TwoPageRight,TwoPageLeft
SinglePage
OneColumn
TwoColumnRight
TwoColumnLeft
TwoPageRight
TwoPageLeft
nofoldmarks
foldmarksize=##L
geometrynodefaults
roundprintedlengthsto=%<number%>
#endkeyvals

\begin{adjustcell}{adjustbox options%keyvals}{width}{height}
\begin{adjustcell}[valign]{adjustbox options%keyvals}{width}{height}
\end{adjustcell}
\begin{adjustcell*}{adjustbox options%keyvals}{width}{height}
\begin{adjustcell*}[valign]{adjustbox options%keyvals}{width}{height}
\end{adjustcell*}
\begin{backcover}
\end{backcover}
\begin{backflap}
\end{backflap}
\begin{bottomup}
\begin{bottomup}[valign]
\end{bottomup}
\begin{cell}{left,top}{width}{height}
\end{cell}
\begin{cell*}{left,top}{width}{height}
\end{cell*}
\begin{CellContent}{name}
\begin{CellContent}[parent-align]{name}
\end{CellContent}
\begin{CellContent*}{name}{width}{height}
\begin{CellContent*}[parent-align]{name}{width}{height}
\end{CellContent*}
\begin{cliptocell}
\begin{cliptocell}[size]
\end{cliptocell}
\begin{foldout}
\begin{foldout}[fold-spec]
\end{foldout}
\begin{foldoutcell}
\begin{foldoutcell}[number]
\end{foldoutcell}
\begin{foldoutcell*}
\begin{foldoutcell*}[%<<from>-<to>%>]
\end{foldoutcell*}
\begin{frontcover}
\end{frontcover}
\begin{frontflap}
\end{frontflap}
\begin{inlinecell}{width}{height}
\begin{inlinecell}[valign]{width}{height}
\end{inlinecell}
\begin{inlinecell*}{width}{height}
\begin{inlinecell*}[valign]{width}{height}
\end{inlinecell*}
\begin{leftpage}
\end{leftpage}
\begin{leftside}
\end{leftside}
\begin{minipagecell}{width}{height}
\begin{minipagecell}[valign]{width}{height}
\end{minipagecell}
\begin{minipagecell*}{width}{height}
\begin{minipagecell*}[valign]{width}{height}
\end{minipagecell*}
\begin{MinipageCellContent}{name}
\begin{MinipageCellContent}[parent-align]{name}
\end{MinipageCellContent}
\begin{MinipageCellContent*}{name}{width}{height}
\begin{MinipageCellContent*}[parent-align]{name}{width}{height}
\end{MinipageCellContent*}
\begin{page}
\end{page}
\begin{pagebleedcell}
\end{pagebleedcell}
\begin{pagecell}
\end{pagecell}
\begin{pagecell*}
\end{pagecell*}
\begin{paperbleedcell}
\end{paperbleedcell}
\begin{papercell}
\end{papercell}
\begin{rightside}
\end{rightside}
\begin{spine}
\end{spine}
\begin{spreadtopages}
\begin{spreadtopages}[page-count]
\end{spreadtopages}
\begin{spreadtopages*}{name}
\begin{spreadtopages*}[page-count]{name}
\end{spreadtopages*}
\begin{textcell}
\end{textcell}
\begin{topdown}
\begin{topdown}[valign]
\end{topdown}
\begin{vspine}
\end{vspine}
\begin{zinlinecell}
\begin{zinlinecell}[valign]
\end{zinlinecell}
\begin{zinlinecell*}
\begin{zinlinecell*}[valign]
\end{zinlinecell*}

\bindingoffset#L
\bleed#L
\bleedblockheight#L
\bleedblockwidth#L
\blockheight#L
\blockwidth#L
\BookAuthors
\BookEdition
\BookFonts
\BookFullInfoPage
\BookFullInfoPage[text]
\BookInfo
\BookInfoPage
\BookInfoPage[text]
\BookSoftwareInfoPage
\BookSoftwareInfoPage[text]
\BookTitle
\BookVersion
\BookYear
\ByNotice
\captionblockcell[options%keyvals]{caption%text}
\captionblockcell{caption%text}
\captioncell[options%keyvals]{caption%text}
\captioncell{caption%text}
\captioncellspacing#L
\captionclearpage#L
\captionformat{text}#*
\captionsize#*
\CellContentOptions{arg}#*
\cellheight#L
\celloffsetleft#L
\celloffsettop#L
\cellparentheight#L
\cellparentwidth#L
\cellwidth#L
\clearance#L
\clearcaption#L
\clearfoldoutedge#L
\clearfoldoutfold#L
\clearfoldoutgutter#L
\clearimage#L
\cleartoleftpage
\cliptocellbleeds{size}
\CopyrightNotice
\coverboardgrow#L
\coverflap#L
\defaultfoldout
\emptypage
\emptypage[pagestyle]
\flatfold#L
\foldmarkoffset#L
\foldmarksfalse
\foldmarkstrue
\foldoutwidth#L
\GenerateTemplate
\GenerateTemplate[unit]
\gsavecell[valign]{name}{width}{height}{content%text}
\gsavecell{name}{width}{height}{content%text}
\gutteroffset#L
\iffoldmarks
\ifwriteimagelist#*
\imageblockheight#L
\imageblockoffsettop#L
\imageblockwidth#L
\imagecell[options%keyvals]{caption%text}{imagefile}#g
\imagecell{caption%text}{imagefile}#g
\ImageHalfPageL*[options%keyvals]{caption%text}{imagefile}#g
\ImageHalfPageL*{caption%text}{imagefile}#g
\ImageHalfPageL[options%keyvals]{caption%text}{imagefile}#g
\ImageHalfPageL{caption%text}{imagefile}#g
\ImageHalfPageLCaption{text}
\ImageHalfPageR*[options%keyvals]{caption%text}{imagefile}#g
\ImageHalfPageR*{caption%text}{imagefile}#g
\ImageHalfPageR[options%keyvals]{caption%text}{imagefile}#g
\ImageHalfPageR{caption%text}{imagefile}#g
\ImageHalfPageRCaption{text}
\imageoffsetleft#L
\imageoffsettop#L
\ImagePage*[options%keyvals]{caption%text}{imagefile}#g
\ImagePage*{caption%text}{imagefile}#g
\ImagePage[options%keyvals]{caption%text}{imagefile}#g
\ImagePage{caption%text}{imagefile}#g
\ImagePageCaption{text}
\ImagePageClear*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClear*{caption%text}{imagefile}#g
\ImagePageClear[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClear{caption%text}{imagefile}#g
\ImagePageClearB*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClearB*{caption%text}{imagefile}#g
\ImagePageClearB[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClearB{caption%text}{imagefile}#g
\ImagePageClearBCaption{text}
\ImagePageClearCaption{text}
\ImagePageClearL*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClearL*{caption%text}{imagefile}#g
\ImagePageClearL[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClearL{caption%text}{imagefile}#g
\ImagePageClearLCaption{text}
\ImagePageClearR*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClearR*{caption%text}{imagefile}#g
\ImagePageClearR[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClearR{caption%text}{imagefile}#g
\ImagePageClearRCaption{text}
\ImagePageClearT*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClearT*{caption%text}{imagefile}#g
\ImagePageClearT[options%keyvals]{caption%text}{imagefile}#g
\ImagePageClearT{caption%text}{imagefile}#g
\ImagePageClearTCaption{text}
\ImagePageFill*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFill*{caption%text}{imagefile}#g
\ImagePageFill[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFill{caption%text}{imagefile}#g
\ImagePageFillCaption{text}
\ImagePageFit*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFit*{caption%text}{imagefile}#g
\ImagePageFit[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFit{caption%text}{imagefile}#g
\ImagePageFitB*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFitB*{caption%text}{imagefile}#g
\ImagePageFitB[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFitB{caption%text}{imagefile}#g
\ImagePageFitBCaption{text}
\ImagePageFitCaption{text}
\ImagePageFitL*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFitL*{caption%text}{imagefile}#g
\ImagePageFitL[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFitL{caption%text}{imagefile}#g
\ImagePageFitLCaption{text}
\ImagePageFitR*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFitR*{caption%text}{imagefile}#g
\ImagePageFitR[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFitR{caption%text}{imagefile}#g
\ImagePageFitRCaption{text}
\ImagePageFitT*[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFitT*{caption%text}{imagefile}#g
\ImagePageFitT[options%keyvals]{caption%text}{imagefile}#g
\ImagePageFitT{caption%text}{imagefile}#g
\ImagePageFitTCaption{text}
\ImagePageTemplate{name}{code}
\imagescale
\ImageSpread*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpread*{caption%text}{imagefile}#g
\ImageSpread[options%keyvals]{caption%text}{imagefile}#g
\ImageSpread{caption%text}{imagefile}#g
\ImageSpreadB*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadB*{caption%text}{imagefile}#g
\ImageSpreadB[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadB{caption%text}{imagefile}#g
\ImageSpreadBCaption{text}
\ImageSpreadCaption{text}
\ImageSpreadFill*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFill*{caption%text}{imagefile}#g
\ImageSpreadFill[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFill{caption%text}{imagefile}#g
\ImageSpreadFillCaption{text}
\ImageSpreadFit*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFit*{caption%text}{imagefile}#g
\ImageSpreadFit[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFit{caption%text}{imagefile}#g
\ImageSpreadFitB*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFitB*{caption%text}{imagefile}#g
\ImageSpreadFitB[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFitB{caption%text}{imagefile}#g
\ImageSpreadFitBCaption{text}
\ImageSpreadFitCaption{text}
\ImageSpreadFitL*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFitL*{caption%text}{imagefile}#g
\ImageSpreadFitL[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFitL{caption%text}{imagefile}#g
\ImageSpreadFitLCaption{text}
\ImageSpreadFitR*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFitR*{caption%text}{imagefile}#g
\ImageSpreadFitR[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFitR{caption%text}{imagefile}#g
\ImageSpreadFitRCaption{text}
\ImageSpreadFitT*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFitT*{caption%text}{imagefile}#g
\ImageSpreadFitT[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadFitT{caption%text}{imagefile}#g
\ImageSpreadFitTCaption{text}
\ImageSpreadL*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadL*{caption%text}{imagefile}#g
\ImageSpreadL[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadL{caption%text}{imagefile}#g
\ImageSpreadLCaption{text}
\ImageSpreadR*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadR*{caption%text}{imagefile}#g
\ImageSpreadR[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadR{caption%text}{imagefile}#g
\ImageSpreadRCaption{text}
\ImageSpreadT*[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadT*{caption%text}{imagefile}#g
\ImageSpreadT[options%keyvals]{caption%text}{imagefile}#g
\ImageSpreadT{caption%text}{imagefile}#g
\ImageSpreadTCaption{text}
\InitPages
\ISBN
\jacketflap#L
\jacketflapback#L
\jacketflapfront#L
\jacketwrap#L
\keywords{keywords%text}
\LATEX
\layoutmode
\License
\maxdim{dimen1%l}{dimen2%l}
\mindim{dimen1%l}{dimen2%l}
\OtherSoftware
\pageblockheight#L
\pageblockwidth#L
\pagefold
\pagefoldpanelfolds
\pagefoldpanels
\PageInfo
\PageInfo[unit]
\pagetextheight#L
\pagetextwidth#L
\pdfboxesset[bleed]{bleedboxwidth}{bleedboxheight}
\pdfboxesset{bleedboxwidth}{bleedboxheight}
\pdfcommentcell[options%keyvals]{comment%text}
\pdfcommentcell{comment%text}
\pdfpagecount{.pdf file%file}
\pdfpagelayout
\pdfspinewidth{paper-thickness}{cover-thickness}{.pdf file%file}
\pdfspreadstopages{.pdf file%file}
\pdfspreadstopages[delta]{.pdf file%file}
\rcaptioncell[options%keyvals]{caption%text}
\rcaptioncell{caption%text}
\ReInitPages
\ChangeLayout{mode%keyvals}
\resetImageHalfPageLCaption
\resetImageHalfPageRCaption
\resetImagePageCaption
\resetImagePageClearBCaption
\resetImagePageClearCaption
\resetImagePageClearLCaption
\resetImagePageClearRCaption
\resetImagePageClearTCaption
\resetImagePageFillCaption
\resetImagePageFitBCaption
\resetImagePageFitCaption
\resetImagePageFitLCaption
\resetImagePageFitRCaption
\resetImagePageFitTCaption
\resetImageSpreadBCaption
\resetImageSpreadCaption
\resetImageSpreadFillCaption
\resetImageSpreadFitBCaption
\resetImageSpreadFitCaption
\resetImageSpreadFitLCaption
\resetImageSpreadFitRCaption
\resetImageSpreadFitTCaption
\resetImageSpreadLCaption
\resetImageSpreadRCaption
\resetImageSpreadTCaption
\resetimagetweaks
\ResettableMacro{name}[args][default]{code}
\ResettableMacro{name}[args]{code}
\ResettableMacro{name}{code}
\savecell[valign]{name}{width}{height}{content%text}
\savecell{name}{width}{height}{content%text}
\SoftwareInfo
\SoftwareNotice
\spinefold#L
\spinewidth#L
\subject{subject%text}
\TEX
\ThanksTo
\tweakimageoffsetleft{length}
\tweakimageoffsettop{length}
\tweakimagescale{factor}
\usecell*{name}{top,left}{width}{height}
\usecell{name}{top,left}{width}{height}
\usespreadpage*[page-num]{name}
\usespreadpage*{name}
\usespreadpage[page-num]{name}
\usespreadpage{name}
\vcaptioncell[options%keyvals]{caption%text}
\vcaptioncell{caption%text}
\writeimagelisttrue#*
\writeimagelistfalse

#keyvals:\captionblockcell
left#true,false
right#true,false
align=#flushleft,center,flushright
valign=#t,c,b
clearance=##L
constraintoparent#true,false
clearparent=##L
spacing=##L
width=##L
showbox#true,false
#endkeyvals

#keyvals:\captioncell,\rcaptioncell
over#true,false
top#true,false
center#true,false
bottom#true,false
under#true,false
align=#flushleft,center,flushright
margin=##L
#endkeyvals

#keyvals:\imagecell,\ImageHalfPageL,\ImageHalfPageL*,\ImageHalfPageR,\ImageHalfPageR*,\ImagePage,\ImagePage*,\ImagePageClear,\ImagePageClear*,\ImagePageClearB,\ImagePageClearB*,\ImagePageClearL,\ImagePageClearL*,\ImagePageClearR,\ImagePageClearR*,\ImagePageClearT,\ImagePageClearT*,\ImagePageFill,\ImagePageFill*,\ImagePageFit,\ImagePageFit*,\ImagePageFitB,\ImagePageFitB*,\ImagePageFitL,\ImagePageFitL*,\ImagePageFitR,\ImagePageFitR*,\ImagePageFitT,\ImagePageFitT*,\ImageSpread,\ImageSpread*,\ImageSpreadB,\ImageSpreadB*,\ImageSpreadFill,\ImageSpreadFill*,\ImageSpreadFit,\ImageSpreadFit*,\ImageSpreadFitB,\ImageSpreadFitB*,\ImageSpreadFitL,\ImageSpreadFitL*,\ImageSpreadFitR,\ImageSpreadFitR*,\ImageSpreadFitT,\ImageSpreadFitT*,\ImageSpreadL,\ImageSpreadL*,\ImageSpreadR,\ImageSpreadR*,\ImageSpreadT,\ImageSpreadT*
fit#true,false
fill#true,false
center#true,false
left#true,false
right#true,false
inside#true,false
outside#true,false
top#true,false
bottom#true,false
clearance=##L
offsettop=##L
offsetleft=##L
scale=%<factor%>
captionalign=#t,c,b
captionclearparent=##L
#endkeyvals

#keyvals:\vcaptioncell
bottomup#true,false
topdown#true,false
before#true,false
left#true,false
center#true,false
right#true,false
after#true,false
align=#flushleft,center,flushright
margin=##L
#endkeyvals

#keyvals:\pdfcommentcell
avatar=%<avatar%>
style=%<style%>
subject=%<subject%>
author=%<author%>
icon=#Comment,Key,Note,Help,NewParagraph,Paragraph,Insert,Check,Circle,Cross,Star,RightArrow,RightPointer,UpArrow,UpLeftArrow,CrossHairs
color=%<color%>
opacity=
open#true,false
hspace=##L
voffset=##L
hoffset=##L
disable#true,false
date=%<date%>
timezone=%<timezone%>
id=
deadline=%<deadline%>
#endkeyvals

#keyvals:\begin{adjustcell},\begin{adjustcell*}
### \includegraphics keys
alt={%<alt text%>}
bb=%<llx lly urx ury%>
bbllx=
bblly=
bburx=
bbury=
natwidth=
natheight=
hiresbb#true,false
pagebox=#mediabox,cropbox,bleedbox,trimbox,artbox
viewport=%<llx lly urx ury%>
trim=%<llx lly urx ury%>
angle=%<degrees%>
origin=
width=##L
height=##L
totalheight=##L
keepaspectratio#true,false
scale=%<factor%>
clip#true,false
draft#true,false
type=%<file type%>
ext=%<file extension%>
read=%<read-file extension%>
command=
quiet
page=%<page number%>
interpolate#true,false
decodearray={%<color array%>}
intent
maskarray
ocobjnum
ocobjref
resetcolor
resolution
xmpfile
### \adjustbox specific keys
Trim=
Viewport=
Clip=
Clip*=
rndcorners=
margin=
margin*=
padding=
padding*=
vspace=
vspace*=
min width=##L
max width=##L
min height=##L
max height=##L
min totalheight=##L
max totalheight=##L
min size={%<width%>}{%<height%>}
max size={%<width%>}{%<height%>}
min totalsize={%<width%>}{%<totalheight%>}
max totalsize={%<width%>}{%<totalheight%>}
warn width
warn width=##L
scale={%<h-factor%>}{%<v-factor%>}
reflect
fbox
fbox=
frame
frame=
cfbox=
cframe=
rndframe=
rndcornersbox
rndfbox
valign=#T,M,B,t,m,b
raise=
set height=##L
set depth=##L
set vsize={%<height%>}{%<depth%>}
center
center=##L
right
right=##L
left
left=##L
inner
inner=##L
outer
outer=##L
pagecenter
pagecenter=##L
pageleftalign
pageleftalign=##L
pagerightalign
pagerightalign=##L
pageinner
pageinner=##L
pageouter
pageouter=##L
textareacenter
textareacenter=##L
textarealeftalign
textarealeftalign=##L
textarearightalign
textarearightalign=##L
textareainner
textareainner=##L
textareaouter
textareaouter=##L
noindent
leavevmode
lap=
rlap
llap
clap
color=
color*=%<color macro%>
fgcolor=
fgcolor*=%<color macro%>
bgcolor=
bgcolor*=%<color macro%>
bgimage=
bgimage*=
fgimage=
fgimage*=
background=
background*=
foreground=
foreground*=
dpi=%<number%>
pxdim=##L
minipage=
varwidth=##L
tabular=[%<position%>]{%<col spec%>}
tabular*=[%<position%>]{%<width%>}{%<col spec%>}
array=[%<position%>]{%<col spec%>}
stack
stack=
innerenv=%<envname%>
innercode={%<begin code%>}{%<end code%>}
caption=
captionabove=
captionbelow=
label=##l
figure
figure=%<placement%>
float=
nofloat=%<float type%>
rotate=
env=
addcode={%<code before%>}{%<code after%>}
Addcode={%<code before%>}{%<code after%>}
appcode=%<code after%>
precode=%<code before%>
Precode={%<code before%>}
execute=%<code%>
Execute=%<code%>
phantom
phantom=#h,v
gobble
discard
content=%<new content%>
gstore=%<box register%>
gstore*=%<box register%>
gstore width=%<length register%>
gstore height=%<length register%>
gstore depth=%<length register%>
gstore totalheight=%<length register%>
gstore sizes=
process
#endkeyvals

#keyvals:\ChangeLayout
block
spread
endpaper
cover
jacket
#endkeyvals

# not documented
\begin{resizedpages}{width}{height}#*
\begin{resizedpages}[bleed]{width}{height}#*
\end{resizedpages}#*
\begin{shipoutbgcell}#*
\end{shipoutbgcell}#*
\blocklayoutfalse#S
\blocklayouttrue#S
\coverlayoutfalse#S
\coverlayouttrue#S
\coverlikelayoutfalse#S
\coverlikelayouttrue#S
\endpaperlayoutfalse#S
\endpaperlayouttrue#S
\foldinmark#*
\foldinmark[baseline]#*
\foldoutmark#*
\foldoutmark[baseline]#*
\hardcoverlayoutfalse#S
\hardcoverlayouttrue#S
\ifblocklayout#*
\ifcoverlayout#*
\ifcoverlikelayout#*
\ifendpaperlayout#*
\ifhardcoverlayout#*
\ifjacketlayout#*
\ifsoftcoverlayout#*
\ifspreadlayout#*
\jacketlayoutfalse#S
\jacketlayouttrue#S
\pagefoldpanelslen#S
\pdfcover{.pdf file%file}#*
\pdfcoverback{.pdf file%file}#*
\pdfcoverfront{.pdf file%file}#*
\pdfendpaper{.pdf file%file}#*
\pdfweb{file1%file}{file2%file}#*
\ResetFoldMarks#*
\restorepdfboxes#*
\restorepdfboxes[opt]#*
\ShowMarks#*
\ShowMarks[unit]#*
\softcoverlayoutfalse#S
\softcoverlayouttrue#S
\spreadlayoutfalse#S
\spreadlayouttrue#S
\storepdfboxes#*
\storepdfboxes[opt]#*
\thefoldoutpanel#*
