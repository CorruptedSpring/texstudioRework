# ysabeau package
# Matthew Bertucci 2024/11/05 for v1.4

#include:fontenc
# loads T1 option of fontenc
#include:mweights
#include:xstring
#include:ifthen
#include:scalefnt
#include:etoolbox
#include:xkeyval
#include:fontaxes

#keyvals:\usepackage/ysabeau#c
scale=%<factor%>
lining
oldstyle
tabular
proportional
scosf
mainfont
black
extrabold
bold
semibold
medium
regular
light
extralight
thin
hairline
foresolidus=
aftsolidus=
#endkeyvals

\black{text}
\blackfont
\bold{text}
\boldfont
\defigures#*
\denfigures
\denstyle#*
\extrabold{text}
\extraboldfont
\extralight{text}
\extralightfont
\hairline{text}
\hairlinefont
\inffigures
\infigures#*
\infstyle#*
\lfstyle
\light{text}
\lightfont
\liningnums#*
\mediumfont
\nufigures#*
\numfigures
\numstyle#*
\onehalf
\onequarter
\osfstyle
\regularfont
\semibold{text}
\semiboldfont
\subscript#*
\sufigures#*
\supfigures
\supscript#*
\supstyle#*
\tabularliningnums#*
\tabularoldstylenums#*
\textde{text}#*
\textden{text}
\textdenominators{text}#*
\textfrac[whole part]{numerator}{denominator}
\textfrac{numerator}{denominator}
\textin{text}#*
\textinf{text}
\textinferior{text}#*
\textlf{text}
\textnum{text}
\textnumerators{text}#*
\textosf{text}
\textsu{text}#*
\textsup{text}
\textsuperior{text}#*
\texttlf{text}
\texttosf{text}
\thin{text}
\thinfont
\threequarters
\tlfstyle
\tosfstyle

# from T1 option of fontenc
\DH#n
\dh#n
\dj#n
\DJ#n
\guillemetleft#n
\guillemetright#n
\guillemotleft#*n
\guillemotright#*n
\guilsinglleft#n
\guilsinglright#n
\Hwithstroke#n
\hwithstroke#n
\k{arg}#n
\NG#n
\ng#n
\quotedblbase#n
\quotesinglbase#n
\textogonekcentered{arg}#n
\textquotedbl#n
\th#n
\TH#n
