# tikzducks package
# Matthew Bertucci 2024/12/10 for v1.9

#include:tikz
#include:tikzlibrarypatterns.meta
#include:tikzlibrarycalc
#include:tikzlibrarydecorations.shapes
#include:tikzlibrarydecorations.pathmorphing

\duck
\duck[options%keyvals]

\picduck

\randuck
\randuck[options%keyvals]

#keyvals:\duck#c
body=#%color
head=#%color
bill=#%color
eye=#%color
grumpy
laughing
parrot
longhair
longhair=#%color
shorthair
shorthair=#%color
parting
parting=#%color
crazyhair
crazyhair=#%color
recedinghair
recedinghair=#%color
mohican
mohican=#%color
mullet
mullet=#%color
eyebrow
eyebrow=#%color
beard
beard=#%color
tshirt=#%color
jacket=#%color
tie
tie=#%color
bowtie
bowtie=#%color
aodai
aodai=#%color
cape
cape=#%color
water
water=#%color
alien
alien=#%color
hat
hat=#%color
tophat
tophat=#%color
strawhat
strawhat=#%color
ribbon
ribbon=#%color
cap
cap=#%color
conicalhat
conicalhat=#%color
santa
santa=#%color
graduate
graduate=#%color
tassel
tassel=#%color
beret
beret=#%color
peakedcap
peakedcap=#%color
harlequin
harlequin=#%color
niuqelrah
niuqelrah=#%color
sailor
sailor=#%color
bobblehat
bobblehat=#%color
crown
crown=#%color
queencrown
queencrown=#%color
kingcrown
kingcrown=#%color
helmet
helmet=#%color
viking
viking=#%color
devil
devil=#%color
unicorn
unicorn=#%color
bunny
bunny=#%color
inear=#%color
sheep
horsetail
horsetail=#%color
witch
witch=#%color
magichat
magichat=#%color
magicstars
magicstars=#%color
magicwand
sombrero
sombrero=#%color
sombreroa=#%color
sombrerob=#%color
sombreroc=#%color
glasses
glasses=#%color
squareglasses
squareglasses=#%color
sunglasses
sunglasses=#%color
mask
mask=#%color
signpost
signpost=
signcolour=#%color
signback=#%color
speech
speech=
bubblecolour=#%color
think
think=
buttons
buttons=#%color
lapel
lapel=#%color
book
book=
bookcolour=#%color
cricket
cricket=#%color
hockey
hockey=#%color
football
football=#%color
lightsaber
lightsaber=#%color
darthvader
darthvader=#%color
torch
torch=#%color
prison
prison=#%color
crozier
crozier=#%color
necklace
necklace=#%color
icecream
icecream=#%color
flavoura=#%color
flavourb=#%color
flavourc=#%color
chef
chef=#%color
rollingpin
rollingpin=#%color
cake
cake=#%color
pizza
baguette
baguette=#%color
cheese
cheese=#%color
milkshake
milkshake=#%color
wine
wine=#%color
cocktail
wing
wing=#%color
basket
basket=#%color
easter
easter=#%color
egga=#%color
eggb=#%color
eggc=#%color
stethoscope
stethoscope=#%color
neckerchief
neckerchief=#%color
scarf
scarf=#%color
woggle
woggle=#%color
snowduck
snowduck=#%color
vampire
vampire=#%color
crystalball
crystalball=#%color
shovel
shovel=#%color
pickaxe
pickaxe=#%color
strawbroom
strawbroom=#%color
strawbroomstick=#%color
strawbroomribbon=#%color
broom
broom=#%color
broomstick=#%color
umbrella
umbrella=#%color
umbrellaclosed
umbrellaclosed=#%color
handbag
handbag=#%color
overleaf
megaphone
megaphone=#%color
name=%<name%>
stripes
stripes={%<code%>}
banana
banana=#%color
stick
stick=#%color
leaf
leaf=#%color
#endkeyvals

## generic tikz options
#keyvals:\duck#c,\randuck#c
scale=%<factor%>
xshift=##L
yshift=##L
#endkeyvals

\randomhead#*
\randomaccessories#*
\shuffleducks#*

\duckpathbody#*
\duckpathgrumpybill#*
\duckpathbill#*
\duckpathtshirt#*
\duckpathjacket#*
\duckpathcape#*
\duckpathshorthair#*
\duckpathlonghair#*
\duckpathcrazyhair#*
\duckpathrecedinghair#*
\duckpathcrown#*
\duckpathmohican#*
\duckpathmullet#*
\duckpathqueencrown#*
\duckpathkingcrown#*
\duckpathdarthvader#*
\duckpathhorsetail#*

\duckhookbackground#*
\duckhookbody#*
\duckhookclothing#*
\duckhookhair#*
\duckhookhat#*
\duckhookforeground#*

\stripes
\stripes[options%keyvals]

#keyvals:\stripes
color=#%color
distance=%<number%>
width=%<number%>
height=%<number%>
initialx=%<number%>
initialy=%<number%>
rotate=%<degrees%>
emblem=
#endkeyvals
