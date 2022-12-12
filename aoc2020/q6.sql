/*
Advent of Code 2020 question 6 solution using sqlite3
To run, execute the following two lines in a terminal with sqlite3

sqlite3
.read 'q6.sql'

*/

CREATE TABLE IF NOT EXISTS raw_input (
    value TEXT
);

/*
INSERT OR IGNORE INTO raw_input VALUES (
'abc

a
b
c

ab
ac

a
a
a
a

b'
);
*/

INSERT OR IGNORE INTO raw_input VALUES (
'wzaopvscxknyjtiul
belforsgdhuvmwc

kiocpzjhsetqnwbl
maciywlbpodgevujnsktrz
kpebjfchtlsonwiz
pcezwjtsinxlobk

lrcp
cdlbepr
rlqcyutp
lcpr
lrtcpym

gxcqbowaelfjhpknz
gflhackzwqxojeb
lfwocexqbkjhgaz

fpivaozqnkextmbrjhycdwug
motgcrzaisqlpdwbeyhukf
hbiqcdmkpawueyztgfor
zrcehkqyoblmtgfiaupdw

umjz
jzu
vzowkpuj
jmzau

unzlx
lnzxu
mxluzn
nzuxli

szkiauhyntdrbcljomqwepv
amowcpzbyukihsjtqelnd
lzctuqjabmsynphkewxido
sikblhptcoqemdanywzju
jdeiylutspabcwngfzqkhom

zgyhwtnxjdqucbp
ptnzhudjbcxgkqf
zgqhjbdnutcmpx
gjbzhpdxanqcut

wjkcsqlu
ucsjq

vkzsqtunmr
ljcexadhg

fhtrusba
svtk
pgzwytn
astb

hvzjiwlsmnatbxgqcuke
zeaukbgtnjxslmvwiqc
tqsjxvznemblwkgcuai
atwjqckzmgvnlbuxise
mwkteqbcjasvxuizlgn

gypubxsntl
untylgpsb
uynbgltps
nylgutpsb
unsltybpg

qwygnalv
rxdohlnatwy

fcytwkqjaorm
rqfcjokwtmay
cjyftkaqmrwo
tqomfrwycakj
cjktaroqmfwy

ygnjepucrfkxq
ypnqjfgcuerxk
fyghkncqpjxuer
runfcyxgjqpek
qxjrupnygkcfe

rneuh
rhneu
rhune

dyct
tycd
cdty
ytdc
cdty

hoaxpnic
zrocenxaphui
pigyovantxch
vanbocxdpihw

nmadf
cdbykfwtim
fdms

xrlweqhyomniupgasjb
wxlaijmhqbopnugsery
xmkuswchylpbeqirngojfa

u
yuq

d
d
d
dqf

kfnbcvxtogwhsz
nctfsoezgwhkvb
kncbtvgwsozhf
kcfsobzntgrwhv
obnsfczkrvwhtg

ektcsq
tcpqesdk
ightwqxosekj

y
y
y

oaqwmublkjz
qhkduvibzmfx
bomkquz
bzpuqwmko

uybzfemjhvnp
amxynpve
kyvmenxp

vpyznetlsow
njewpszg

a
a
a
x
a

ytixaokbv
vybaoxtudi
kaivoytbx
oavbxity
vytbaixo

okdmepqj
kqodjpe
kpdeoqj
yqdpkeoj

nqtkbvrjizuyhlwmxopscga
ojzqryxwvpkclighnmeuabts
socwtinpyakuqljzmrxvhbg
sruhgbvjmpwnaklioqyzctx
pmojxvkiwztgaslbuyhqrnc

sruqibofpetmjxacnyw
meoxusytawnfrhqicpb

udzjvpxcmg
vzmpdjgxuc
vdgcxujzpim
gpujzcmdvx
jcvpzxmdug

lwke
jqa
jdp

ebcnymdxhsgjoptvkluw
mhewbjgldvutnkxocysp
odkvwhlcupyejbsmxntg
ylhetjbxumpwdocgvkn
yvugktojibqwncmlpehdx

wc
cw
wc
wc

fnatmwk
vbqnoptm
zldysrjuiegcmx
fm
vmh

e
e
e

nd
nd
dn
tdn
nd

bswceuimx
vfugqjk
phrbaulzsdy

fcmpeuxkjiwtszhgnoravb
tjhbsovuzipmracnxf
zfxuvbitrcnamosjph
bafxzhonrsipvcjumt

uopkgzec
uogckpz
czgkopu
gtuopckz

k
k
k
k
k

bucx
zxfu
oluinsxk
cupfxb
pxuz

gw
wg

nif
qby

kazpqyrt
uocensfmvw

vjy
srdfuy
tyz
yt
jyow

wcn
d
m
r

afo
pruao
afo

jiqp
jhp
jp
pj

rvxucn
xmurvtc
uzvmrxc
xeykobgvjpclharfu

bc
cb
bc
bc

hxnparv
vtqhxapn
apnvhx
dvwanihpxys

jdszlimbca
drtmxcqlw
cmdzloub

podyqvae
qyapveod
pvqedayo

scmbwfuldnvkxqehjgatpry
zgltckiwjnuebahmpfqvdrsx

hu
fkixsu

a
a
a
a
a

fkmupthae
vumpwh
ugxwmph

kspnwvyr

yxaw
xw
hzrmxbekw
wicx

l
lz
l
l
l

rwn
wnr

tpankiydfghwlzv
hwnztpvbcsykgl

hcn
cuhq
qc
uq
xsdz

izsctumjfvyo
iuymczbtjo
ytprwciogjkmzx
iyztahnjemcdo

kmepowc
cwmkoep
bmopkect
cjepnkmqo

gqlxpwt
qgwtplv
lpgmwcit
twglpx
gwtphl

uiyeqacdlwxpgt
deyxtgqaulicwp
pgawxtyiucdelq
iaepwxugtdlqyc
aewygpuilxctqd

ksextofz
zxhesk

zxnlhrd
hlnxdbczr
qnxfzdlhr

foryns
rnofsy
fsyonr
rosnyf
orsnyf

o
o
t

raktoz
atkzo
vtkzoaf

yianzfpwbqsvltcuhjg
tpjzhvwfibacusylnq
wdctlhzbjeqavnfiuyps

mhexryd
yerhdmx
ehxymdr
bgmrehxyd
xreyhdm

pebtkqchsoydz
dklqohsupwcyztxe
ckvmsqjpdhaetzofy
wsuohqckerltypdzn
lkxsyowcdzteqhp

nqbmshlg
ebshnqla
sqngvb
nbwqsi

sauebdjhpwtcgnlzorfkxqyvim
adpvbqlnofyxmiuzjsctwkeghr

gy
gy

jf
wpy

guztycblrhfiq
bertlfcmguhv
lbytrcfk
fscbltnpxwor
lqfbjtcrdv

egbvoxlmpczqnafyu
enxqbazvpmolyfcug
kpuezgxbqnaymvflocs
vipegmfbnocqxuzlay
mnofzbaylcqxegvpu

wrclt
lfrcw
rcwl

zbwvmuifpjxqnlgo
jfpwmuznqxvbgio

baheoslg
fygoa
aygo
aog
fmoga

ltpdcyn
ycdlnt
lchgtydn

fvdgksnmphxzcboql
zboknxmfgdvclpq
qdlkpgcbzvmoxfnt
ciozqlvjgkwbfxdumpne

gmlyqkjehrp
ojeizhlgpm
uhgpmflje

atzscwnb
snahqtc

zyjml
jryml
lymtxvod
mryil

iudskmzex
udqkzxesmi

qdywgafzmn
ufobhixk

r
q

alndhupswj
npwlua
nlueapw
npalwu
lawnpu

obsxpclziwauf
fcsjxiblwuotzp
spcvbiwfzdxulo
ulfwpiczosbxd

hknftpgaey
typoqgehn

tyhzpoejxdl
xoejpdztlhyk
hreinoyjvtbdzmfqlp
otjyedpzlh
zdoywjeltshp

n
b
b
b
b

kvupfreobljsmw
sukjromplvfwe
rdwhpkjvqcemlosfi
pvmblwsfkexroj
eokvlrmsujwpgtf

wiqs
l
j
j
h

jx
jxc
jxr

tzv
tzv

aqe
qan
avqs
asqcm
glpayuq

hncexlkpjbdmoftag
pfbxckmdantlogh

ocsdtg
sdgtm
sdgt
tdsg

jfioeacnqv
oqafnicjev
veijfnocaq

xfmnhbpljcg
cmlfhbjxengs
xnmbjhlgfc

vcn
kvc
cv
cv
cvm

wodgjfls
owdgfq
niogfwtd
vcdgfwo
mgwyfod

ozhwa
kotuedjcql

kw
kw
kw
kw

sufmi
rmsuf
jumfpeogs
tmfsbu

siadk
mijcgosk
ski
isk

kplwzh
hzpkwl
lwzkph
wzhkpl

yot
y
sy

lz
fl
lf

kexljydcihonwtgumfsrz
iuywlcxomsedjnhztgrf
wtorjgfuxsmlyecdnhbzi
tczliugorhdjsfyenamxw
zklniaxyujdcwtrhgsmfoe

juzqtibn
qijvuzgtnf
nqxziutj
qitonjzw
zqtnjgbis

tuqygv
gutvqy
tvuqyg

plzqmthysawexgvnr
ptvxasryleqmgznwh
htlgnqexsmwpvyiraz

hizrfynjmqceg
bplsuoydv

bptjc
jcbtp

qedcultavjwizxnkob
bokndqcuivwtxlaezfj
qazlvsjexikwbcudont

vgihxmquktcrywpzj
kpujwxfrgqmzlyihct
domjarxitczhwnqugkyp

wilctjzq
ouwylicgkxvsha
npbwlric
liwqc
qclpidbnw

gbvpdkxclfejtaoq
elabncgfkjdvxop

vfi
vpif
ivf
vif

hvjzxebtqsfwpia
gvaxyiwfkcru

hzrg
lz
fqz
az
qabzpyi

redfpogvxc
zeyh
ainye
tlyzeu
alsemu

gwph
gpw
ywgp
gwp

fjkhnmuwtxialyo
tjuolfnkamwxy

umrdifo
mrfodtuix
jkruohmfdi
ufikzrmdo

blioreudh
brfiaheulndgy

ywstjalubez
wbsautezj
usebjtawz

gatfpyjoznwh
oztwypanjghf
nzgojwfphyta
yjhpgfotwzna

metqoknri
kqmtnwerofi
qtkohjnmeir
qmkrefiton

xdgrbua
bwdukoghcrxln
euvxgrdbi
vusgbrxd

rovayxgkqshzi
olgxhutwzsikbecqdajyp
ksrahngzyiqxo
vosgzynxqaifkh
soqzigyxakh

fopjqgdmhtbv
qbvl
lbvqy
buwvq
bcuqv

feyvazrnows
waynzeorfs
sorafznewy

jpohmywkvqextsd
ahtvoxpumsedq
qbgtpoecsnlmxfirvh

uic
ij
ixgp
alzehimdvybf
tkgi

fpjubodeznsqyxkwami
anuymqskowpedbifzjx
oubjpwznfdxemiyqska

uhzd
uzhd
dhuz
uhdgz
zdhu

bsyituhq
rbjahg

xszkrj
znhjrsx
jzrptkxs
mlzrjbxsyoq
unjxrzsk

rmyilhnkdqjpfceogzu
oegpdtmkwuvfal
budoxkfpglem

xekshpotfzlcmuiwgj
sauekziobrthjgxfcpwl
eifjhkwgpcltsxozvu
okenjhgscxqfuzwtpl
uhcjxzowitsdlegpkf

kzwdconulqtrvihsgp
qwmhutnpyrsxbvgzokdeicl

x
x
i

umvbcenh
egun
tnue
ktuen
wgneu

wysximljeua
uiwxleymsja
iemlyxjsawu

r
wt

hcvos
xv

enzmuaxc
jcdnvzam
nltvobeaym
mfnahipgswr

hsnmlpkujoigaftc
fslotjmpghacnkiu
cbfjlkohumapsngt
lsutoajknfpgchmi

xisn
insxw
nixs

eunflkcda
gcnxefzlud
lspcndufea
onwjutcefdlm

hrivmxpatkgd
hdmxigtprakv
dvpmgcrthkiax
gkdraxithpmv
rvmutdbixpklehga

elmdxqwn
mqlwedn
mwnleqd
qldwnem
qemlwdn

wpjfrlqbs
vwqjlsfbr
srqwbjflk
fpjlqwsrb

u
j
l
w
l

kr
rk
kr
rkd
rk

irpxjsmqgf
bhqpendrjfc
pmwryfjql
mpfqjryux

kjgheiqcox
iklufxgcjeh
gynvizspjhmebakxt

udwlimhqsorbpeynctva
qzxobjpsckyfmtr

xqyjwueda
juehakzxygq
nexjlqumsyra

mvsyaec
xalsmwvyr
msyuav
awsmvy

tyfrcibenxdvgum
diptcfwuroegnlvx

c
i
g
arelmvpoz
n

q
pq
q
asq

oxrchtjsekpw
twoesdckuhnpxml
xkovyetpwschai
tsjwecqzxhgfopk
fspcxrtdoewhk

urjh
njd

ygo
syog
gfoyr

lrvkw
dwarkyg
cphkiqfjsut
xk
vwk

chlog
wughvb
cngh
hlgc

hlu
luh

tgfsbj
btgjf

yflqdgp
dqpflg
dlgpfq
qgdlfp
lfgdpumq

dybxtrizvhcksalqpungfwmeoj
lpotsjiaydfbqwzruxhemcnvgk
qletwyopaivjkgcbszrudmxfnh

rowgvahemlyjkbupxct
jrewbpmktlvxaouhcy

soerhzknbijd
oekgznidsrhj
oihrkaduezsnjf

axthin
ojhtxa
tnahxv

t
f
cv

yjkatqum
eksumriab
wksmhvuaeb

wz
w
wfb

ruvglckjpomqthy
afjbuxevlqiwog

zpyfolacrnqgvhksmjdeuw
ebctoamjkusdrnpyxwih

fxs
sfirlxm
swfx

imftqohzgjcpdlsrebxuv
agptlnyxujfzwkoqmdh

mkbqsgaxojivpyrzwtn
svhgocwbazkyqtxrfnlmu
nozrjkdabxwitqmvegys

tuzmyvqgnsekbwo
vmqgbozknywetus
ymsnwuqoezktgvb
euzowmbqtskgynv
uzesoybkngwmqtv

khgx
xhz
aclrne

kq
qk
qk

i
gmf
dh
owqjb

pstycjadezlbnqwxrig
rbhdpqysicgnlwa
ryhibaqwdclpngs
npdcyqsbrhawiglko
cbsdiwpnqgylra

quvsagtxw
uatvcx
vutax

ndbrlpzxasmto
sdbxjyrofatqlpmnz
bolmatxdszpnr
wplobctzsmxdnra

boxmgljp
xfap

cndeqvy
mzneys
eyn
sieyn
eynm

kbuwp
bqpkh

ljngohfvtpdmw
iwctogfnmvuzlhd

napvy
gaczoidwybm
ysaet

wrnixgyv
wnrxgvyi
vxirywgn
iwryxvng
gvwinxyr

ygtbiqfuornlx
ieuwpgzxhbo
vubi

ohxbkqgsj
qalpsfmiwtzyrdc

fyakzqidcpswn
qwkizfdpyacn

lxf
ifxl
njuxfl

yxqzebvsgpwl
mnjcftohyi
adycurkmo

nxdfptvebg
swjzqh
kwyasj
oljz

lrzunheqgjvcs
kiqshjmgdvuz

feyljcgrqmsdbz
qsgnumzhiayfbcle
pcwfstmkvgeqloxy

qnwcftx
hyewofcl
cwhfi
clfehw

kjuebdvpgqs
ahpubjyske
zksejxbuwp
juboekswp

u
bcytf

rpvshwmn
djnshvmwr
wrshnvm

itpduvwechnrk
ntirkpvdelcuhws
vrcktepindwuqhf

q
q
q

mzhrygf
zhfygmr
msofhrygz
rqfymhzg
ygfmhqrz

nwbpshv
twspladobu
hzinpwbqs

c
c
xecuy
c
c

y
y
o
y

qauijgxfhbztlpvecrk
ljhcamkegxbqyptnzrfoviu
ejibuzlprhtcxaqfgvk
biczvdhgqlxrktjafuep
hpsxgwujqakbrltzevcfi

cmfryo
froyc
dcofgye

dcrbjnza
jdirzacb
bzrdacj
cbadrzj

fnjryzvtxlsdioepm
ldxfzcjtovyisepbmrn
mtoxdilwfrvjespyzn

omqxjypgin
bcrdezl
vflwkrzt

dkabj
ntwpy
jb

krjawyexhnlmcspizoufgt
ryebdifmlhwxgasvkoqjztcn

lrctmfu
clzrmtfu

ivagzecmwyl
xgkrojtfc

bsalmjthvwgxirpqcnyue
ymtqgcsjrxnvaepfhwiolb

tgwkeapzjo
oewgpzjkati
hejoalxzmgprkwb
nojwgazkpet
asoedjkzgpw

zpjncustlhb
nswvlbtzphcjf
pzjlnebcmtfhs
cljbzfinthkps
aoplbczxrstjhyd

ulvwcxg
bsvqwelud
dmxwioulv
nuwqvlb
ulwvpjft

fmlvprndhxa
hmapdxvrnfl
npavmrgfxhdl
mhlanxrdpvf

vfgwzy
yjgfzqxovu
wzbyfgvj
rvfkpdslzthngmyice
qfyzxavg

hzfjbs
sjhzb
nhsjmzgw

gmtvalyn
igtmvlyn
ymgtvn
gueftonmvxcy

j
jge
jm
qwbj
j

oftpvnykgdxrels
nrvksolftepdxy
xopknvbwltdeysrf
dkexlnhprtysfov

gwcvu
wuec
cuw
wcvu
cuw

cndywt
ntdwcy
cqtyngd

noayvkcdsu
yaedfcjozs

rzfhlitjvwdnp
hzxntilvwfprjd
ljinfmrdtpvwzh

zylgudcfbxprwaqokmtjnsi
bosdnqlyjxgwkmrutcifpaz
kqwuipcfsdnzagojrxymbtl
wbixmynrjkgoaztslupqfcd
bnearosgumfildkjtcyxpqzw

fherd
dfreh
hredf
dfrhe

aysber
se
sze
seo

cjofniwx
zxieaocf
uipxrgodcf
bsjtveoizwfxc
jfcoxinzt

wzoegvhldfibmcj
ohurkdjcvifbazew
sxqzjwioefhbdvc

ifrstw
btkqyfscx
lgvedonzjphu

buw
wubhop
zrfwsbu
ucwhb
wbcu

bdpn
wdpnb
dpbn
bdpn
padnb

ukgziahpfyq
etvsrnjilx

w
w
w

kdjrc
kjcd
cqpjidh
tjdmc

fihjqetkprmbgzl
hgjrtqiefompbzkld
amqipgtlebkjrfzh
elgqwbmpkjvzfihrt
mfjcpszthlirkbeqg

vpfmytuob
bftvyoup
zobynvutpf
uypbftov
ubotpfyv

t
k
k
t
po

he
eh
he
he
he

jwkorfnpqhlxvbziedcasm
vzsfxlkqarmhnjpidcboe
lpzkacexvthbfrojsinqmd
mcnzqiekusafdpvoylxbrhj

doqcnfpshrgwxkjubyval
bdjuhgnlvpkcrfawqsyx
pnasqwryjfvduhbtcklxg

pyba
bacs
autxkrgm
bwfa
eiola

bhfrtklucjpinqoexmdgz
orchqmilekjbupzfgdnt
klhbtnzuomxegdivcjqfp
itfgdqualjokhnbspzemc

kjz
jkoz
kzj
zkj

w
v

qfytlkjconpsw
ltfpyjcskqown
wqsfkcoyjpltn
nckhwtpofjyslq

bvsqmnyjkur
qrukybsjvmn
bnkyvusrmqj
ykqumnrsvjb
bjvyursmnkq

ykmabugfjtqdwpevrzx
maezkwtbvxdqupojfyg
mqyvxasgkezudpwtjfb
fumzpyxtdwqjgabveks

wcntqs
sntbcwq

tywbgnf
gbuynfcrt
sygnrufbt
gabfiznmhtpy
ltbfngy

ngkfqmv
gnqavfm
qgmnavf
qgmvfn
gvmqnf

w
a
id
uj

zvqypkadneblrf
vaeqpldzkfrbny
friaqcvdsexyhbnlp
ezflrdqkbnypva

tlhucpwyzrex
lcpwrhqe
pkehrwlc
ewcpfhrl
chlpwerm

wrtljgy
ygqjlw

jvygmx
qxmyg
myxgqr
gmyx
xmgqy

nvmufjzsb
amnzthf

ujgebphztf
hezupfjbt
zjxfubelsphdt
pthbzefju
bzfuhpjte

xhfj
fhgdx
uifoxqwh
hnexaylbfk
fphux

jiqhofdlwkgas
wftrvupnze
bwfmu
muenywfct

mzrf
gkxsqcwo

uaewm
ewmua
muaew
umwea
awmue

njduohc
hndcjou
chndoju

sqrdgapl
dqgpasrl
gdqplsra

aunzfm
munah

paqvw
qp
fqs
vpq
qwp

gfmbcvriax
dlcmbwvfeyp
bixcrmvaf

uczi
bzi
izwrb
wiz
zi

s
j

khqea
qehxka

mj
dj
j

uibwnrakt
torn
rtevnlh

ghwzt
tghz
gzht
zvgcuqh
hzg

t
t
t
mt
t

cszjtfdulmprbawqkexv
fbwnhigouy

eq
feq
eqo

tyvjnf
tfnsvj
bftngjkv

bpxwhjcmogyq
tnfezpk

as
as
as
as

ybqntwcfld
qytlfbdcwn
wtcqdbfnyl
ltywfcbdqn

fzshuktvwp
ukrbmxvyelindgq

fjoweph
tbvfmscxe
aofzek

axjyiwok
mviqawyxutnjbd
xawiyjc
jhwziyxa

xgwq
mohv
w
ertbzsjk
udf

crozvbt
btzvroc

tvnqzmiouaeslxyw
taymuelowxqsviz

jv
xjwv

npohlyejtkbuvca
ytlokvaebhucjn
kutvyngeclaohbj

nbvwheisoxpa
evlntxsmowighb
kwnaviojeshxb
owvphiexbfns
jwbnheyqvsxio

fkvcteqsgd
bzcftexmvwohp

srwf
frnwsj
swafr
rswf
fwrs

iovjntkewabzumpxryqdfcgh
gskjxpotluzqycrifwbdne

luokigf
nuherolcyiqxam
ugiobls
lwtduoi
ligwou

gbfiqhdmpwjo
fwdqmbpjhig
bwjdrqhmfpaig

ulzyiqamhxvpgbj
ftdrcnewhgszp

oakzwdjupviqn
rgdelufhymik

clxpqaryjkt
qycujtlpxa
xulpctqjya
ucjlatypqx

zckf
fvek

zncuxhaeli
nalhizkcuex
xaceinzulh
acuixzelhn
aczqnxhulie

wrzuljei
lnremi
hrikyacgf

odnqfwpugy
ptlwnydoqhmf
fyovwdpqn
oznwbfpykdqecs

gchqvjlypom
kcwtvxdoiu
cvwzfkoe

xw
wmzx

mfihkroznydqp
kfpzqdinhrovym
hnrzqpyfdmiok
rtqdphyfonizmk
fimnyphzdrkqo

nsbiyukormjhdclvaptw
bcrsitpxdklunmajvhwyo
dktbwvmfyrlhisjnacuop
ztcdupvhgjaboqinsylrmkw
clovapfbyhsukwmdtrjni

bgq
gq
egqk
qxg
wfjulqgzo

foc
ocf
fco
vofc
fco

oitbdfympxjw
jfbowrptimh
ftoimpbwj
ktufiojpwbm
yiwbjpmfout

adznvugpirxyfwkeml
uyefgikmdxrznvwap
gwxdmkyiavrpfnzeu

mi
mi
mi
im
mi

redwqtcgofk
apuhyrsdkbf
kfsrnuvmhbxd
rijdfk

ekxfaqmhbptj
efayqhb
wqfuhabecy
qbfheac
eafbuhoq

yxzarums
yzqforucaxs

cwlqfxdrmp
dxipzcambwoveglk
twhmqspdcxl
cjwxpdsumnrfly

zxdgqawjntukphsfbievrloc
twslhaqxoenmzrfybckdijv

abzlckqrnsgfijdtvy
cgdteqlkbzinyrvasjf
dikaynsgrflzjcqbvt

kptwqavin
wkviqxptn
swpvmgnqbiktl
qpvdtkuiwn
vrjikpytnqewo

evjqxlktmroh
tjmelkoxrq
jlekomtqxr
molerxtkjq
njxkltqermo

wkacmijsrponf
rwvpcsu
wzyplbstrc
cdhwylserpx

jocqfpgmy
qjfpgmc
cfpqjmg
zcqjhfpgme
gjcmfqp

evchkgpdqourmtlzbs
plvdteqmjzurk

fgwbxpihnrz
cdktfvmljbeiwr

mhdcqiaswfpeyogjkbtzvxn
xdyifpqzevknmcoathjsgwb
ndvlyzretgkqbswmpxcjiafho
mstqzycowgjhbnaxepvkidf
aygkezvcxowbjfqithmnspd

qdmetvs
dmslt

vaxsreikfulbohwc
avxeiolbkhcswrfu

wiukdyzvenogj
nouyvkdrwagij
yewvhtjkgndqoiu
dnvfswojigkuey

gnuatzydv
amzvnutgy
cvuengaywtz
zmdgvpyntaohu
oayngzstxfhvu

jed
jefn
mjkch

uojxteazifrsch
kaurlehco
ceuaohr
chkauwero
hacuekrno

ygopsthm
fzduxalqjk

hkdu
khdu
dhpuk
duhk
hudk

mtoqrcgzxuavek
mntwviorack
frtmkyaocv

pstolmvrqkwxz
rsipltjxqnmagvwuk
kspmrxtlyqebwv
twqmlexkprvsf

lacfoveut
ocafve
acvjofbresx

ohgclnjdz
ejsyzdolg
riqbwtkjfdgl
zdgjyvxhl
jldaug

weqdtuvmfnygaskb
lsugyqfvnkebmj

zdcpefjvaly
azcjfvdelpy
tayfqbdzlcepjvk
jedazcvfply
zdplceafyjv

jw
j
chj

cda
ja
yaxn
ja

cfrqx
vlju
v
untv
uy

cowiekfanus
wjgdupicnsfr

sh
foywprquj

b
u

dhezbkx
nwyvlisjpr
jqcotumgfa

eoh
oe
oe
xoe

cjdhmxuyg
gjmxhdyuc
huedcxymgj
dugjxyhcm

srctb
crstb
bvlezstprc
trbcs
rctsbj

fbdvkeltq
lotm
nojtl
tl
rtl

nryhkvetf
xkhrtnfycv
rhtvfynk
rfnvhtky

qabfkzotdyjieghumplxs
sqtuhaxjgdkfliymeozbpv
lqgpjmeofdkaxuhtsyizb
usbyhegwtzlpkxidjqfmoa
pyjdkigtbafqohmsxuelz

zolurkepnsm
ymplgvtrond

skgedcfiqz
gfqzsckdei
ckgsdeqzif

uazvbnlgtiscdmfjreq
iszgbjrnqfdtveauclm
nsilqzuamtgjcbrdfev
zmquiblfsgrvjetdcan

faghxbimzvkcqsy
ikzagfmxbqvycsh
fbsxakqcghymviz

ztvufgy
vzftgey

g
g
g
kg
g

cdihy
tsb

ibl
l

cpdatberqxhugms
rgaxceqptsmhdbu
emcrsdbhtxqapgu
drechgxtmapbqus
xqdpcmshbgeatru

f
poj
f
z
u

ezagw
usolp

jagq
qgajs
gjasqk
jqagm

josgetlqimcdxruyazvf
riclqagoskmwuyxdetpfjz
surlmyegxdnactoqzifj
lcydfrxusmvqjagzbeiot
lcrsoyavzubgimfeqxtdj

qevptljankmhs
qmjukehpsatvo
vzmsaqgwetjphkr

e
s
m
iaxgyd

isn
nis
uisn
nis
sni

bvjza
bv
bdv
dvb

betqjy
nqbetj
tjvqe
hqkraxcp

dbhzkpt
pzdhtk
thdkzp
pzthkd

gyrfsaox
xafgkysh
sgxfapy
gmjuitsbcafyxq
xsgafy

mvenpfxkwc
wpstxfev

rftiyogqvue
gucfjnskpxzqoba

htoyrpesdvnbg
rohysvgpetn

yxntbv
vbxynt
vbyuxqn
ynbfxtav
myxnbdv

v
v
vs
fv

exodvrya
vomacygxduis
wajloydxvp
fyxokvadj

qxipfbwly
wpxtlfcibyq
pylqfibwx
lxpyqbifw

bydioqrcftehkaznlvgsx
ypklfesavizqxgohmtnbcrd
dagnriqsexyvflcbtkohz

uhsjxyfniqbvw
auzbviynqgsjxwf
vfjsbqxurwadinlyt
yevixlqfnsbojwu

y
y
y
zh
d

etyjmxdwkfosbqzhigrpacuvn
uktqciyfbnrosaedlzgpwhjvmx

w
wim
w
w

zlkgwbseno
zqngksb
zgnbsk
gobztsnqkp
kcainfghdxzyubmvsjr

qywhjzxlarbutdnvimc
vrbyjhtqlxmcnzui
tljuhyrnqbpzvxcm
tezubhyjxnqlfrvmc
quhxlzrvbmnctjy

mwqlo
xqonftwmacj
gwrodqum
imwoqre

q
q
zq

tgnvlhc
nhcvtgl
clvhgtn
chvlntg
cnhvdgmbftlq

pmfreuoyzdlhsgvcwb
exahjnytqcgk

ayglbtwcxiopqh
ifxvqhtpbyowa
uqyhwaimtfkbxvpjdo

mcwt
tdrckp
ct

hskjp
fihpjksl

rlvixasmotuqcye
tcyvolauqxsmeri
tpsvmceoailuyxrq

ckvego
ecgokv

bu
b
mjb
by
b

odsbf
odbfs
fsdbo
bsdfo
obsfd

tofgjlhuvmyzcnd
uyljsxtdpbewoqnvg

bcfgaorvwqnmdup
rcvxaunwmdpszjfqgyob
fcrmabgqdwonpvue

z
h

cgbpk
uyzbop

ptzqufrekvilxwmgn
qigueptylvckrnxzfhmd
nrxlezgmqoivkfupt
bpexuzmltqifgvrkns
aeglzqrbotpkvximfjnu

cradozehb
dhslfoqrezca

mpzkgcnbot
cemogtbpzn
lozwngjtbpcm
znlwpbgtmco

lodrywvcxjgp
jxgyclpwrvdo
xrcpljogyvdw
pygvwrodcjxl

bfrmhpiuwxznslcdqke
wikulxhrfdnbsmeqzc
dnhurewbcxsqzifkml
mibcendxwshkulrzqf
frnkcszlqmwbxiudeh

pny
ypd
pyg

msgwzuoydtaxkpqhbj
aknbtivsjgupozme

uizgp
gpizau
gpzxu
aupzgi

zkohbpscea
losacbgm
bogytalcs
owtysabnc

swjkz
kszjw
zksqwj

m
mdtqyw
bsnlkfjprv
demi
itdao

gkwqdnaosmvyrbz
brpomnqgk
qotikclbrnemg
rkgqomnpb

pyoclwjxrmibhgaqu
laymqhioubrpgcwxj
qbhuypxogwrjlamci
muicbghjwoyplqarx

xfut
utfx
vfztuhxd
tuyxf
uxtf

foabejk
wugejvkoca
qjazoxli
ahojt

pqzk
zrkp
adihs

xqcigryhkevpfmutwanlds
ecdqztaxonbiprugfmk
rqnpatukmefgoxdic

ewtfcyagsizj
wyfgtviej
stejyfigrw
ctgajeyfwki
jdbeoyqhitufglpnxw

krmsglcbi
kgbmilc
blkgicm
inxkcqglohwmb
kiblcmg

tubipv
ejwrgfqci
nishoxzp

hoqxjktugmrclzywedi
utgiceynvphszkmodrl
cdbihmzolufgea

ichtmwx
cwmuvixtb

qihgfsxnydtwcrkoeamupzvb
goizemfwhaxcdtknubypqsrv
ovshacfrekugzbwipymtxqnd
rqgntzkwxihovbedpsfumacy
oryitqesazgnckxhdvfpwmub

qafihpdwy
saikmrbxecjgnvoy

devizumtxonjhrkpq
zidmnptujoqhkvxre
gqjmkuohnrtxziedvp
pqoixumtdvrzjkhnbe

fmtbrhsynpkxu
npsmubhyktfrx
sbhyxkumnprft
nhpusmfkbrxty

je
x

dagmxqbfvz
sxkur
xkptl
jixu

e
e
hits
q

tko
qtkhoy
topk
otk

r
erh
r
r
r

agrkjyfcw
ktryaw
whyirak

pgzhswrvxumqlai
skgvdxwp
pgvjxdnws
wpnkgjxvs

risotwzapm
eytfvlx

ocdw
dowlc

mlspy
ylpsmn

rxf
xfr

jaecdxiptnzrlomgwuqyhvf
mexsutcqaviywjzhgnropdl
imeufcjtvwyonxpzardlgqh

dxqtwsvaernygbu
unceigjraxzbqwkvd

skogcitreyx
xewqysmchvikduzj
ycxebsrlki

gqdyaw
skxclpvq

uja
kaju
jau

xnjhqlyvgod
odlvnyxf
yndolkxv
vnldxyo

ksmuqpily
oanrztfwjxvu

gulobnahfmjdpkrqvecsz
lnymgsxrcpheqobjdavkf

mgtdqzrebiswvcfnlopaukh
nbomqafeulrtvigdcpwszk
ginlmsraopdukxftbewqzcv
iamtqzvowldfnuscpkrgeb

ipkonymxsvhjcu
iypevgxdhcnl
xhcinvply

d
qbwhp
r
r

hrdmq
qxld
hcqd
dqfc

pqrgvxtzcbmws
xomdqytbiwzr

eo
eo
oe
oe
oe

dwgmk
mrwjdgk
gwmdk

nspfzvdhocirwyebma
bfdcnzoswyermahivp
minwdycaephzsbvrfo

iydcwfzaxlnret
qlusgcyk
lgcyjs

tmjsecngzxfiq
vhzbyoedfu

o
s
s

ubfrgyp
vybfpkrg
erfybg
nbgyrf
zfwrgby

gjnbfartdoiem
ajbtgermdqnfio
mfijcthadgnobuew'
);

WITH RECURSIVE split (element, remaining) AS (
SELECT '', (SELECT value FROM raw_input LIMIT 1)
UNION ALL
SELECT
	CASE
		WHEN INSTR(remaining, X'0A' || X'0A') > 0 THEN
            SUBSTR(remaining, 0, INSTR(remaining, X'0A' || X'0A'))
		ELSE
			remaining
	END,

	CASE
		WHEN INSTR(remaining, X'0A' || X'0A') > 0 THEN
			SUBSTR(remaining, INSTR(remaining, X'0A' || X'0A') + 2)
		ELSE
			''
	END
FROM split
WHERE remaining <> ''
)

SELECT SUM(value) FROM (
    SELECT CAST(INSTR(element, 'a') > 0 AS INTEGER) +
        CAST(INSTR(element, 'b') > 0 AS INTEGER) +
        CAST(INSTR(element, 'c') > 0 AS INTEGER) +
        CAST(INSTR(element, 'd') > 0 AS INTEGER) +
        CAST(INSTR(element, 'e') > 0 AS INTEGER) +
        CAST(INSTR(element, 'f') > 0 AS INTEGER) +
        CAST(INSTR(element, 'g') > 0 AS INTEGER) +
        CAST(INSTR(element, 'h') > 0 AS INTEGER) +
        CAST(INSTR(element, 'i') > 0 AS INTEGER) +
        CAST(INSTR(element, 'j') > 0 AS INTEGER) +
        CAST(INSTR(element, 'k') > 0 AS INTEGER) +
        CAST(INSTR(element, 'l') > 0 AS INTEGER) +
        CAST(INSTR(element, 'm') > 0 AS INTEGER) +
        CAST(INSTR(element, 'n') > 0 AS INTEGER) +
        CAST(INSTR(element, 'o') > 0 AS INTEGER) +
        CAST(INSTR(element, 'p') > 0 AS INTEGER) +
        CAST(INSTR(element, 'q') > 0 AS INTEGER) +
        CAST(INSTR(element, 'r') > 0 AS INTEGER) +
        CAST(INSTR(element, 's') > 0 AS INTEGER) +
        CAST(INSTR(element, 't') > 0 AS INTEGER) +
        CAST(INSTR(element, 'u') > 0 AS INTEGER) +
        CAST(INSTR(element, 'v') > 0 AS INTEGER) +
        CAST(INSTR(element, 'w') > 0 AS INTEGER) +
        CAST(INSTR(element, 'x') > 0 AS INTEGER) +
        CAST(INSTR(element, 'y') > 0 AS INTEGER) +
        CAST(INSTR(element, 'z') > 0 AS INTEGER) as value
    FROM split
    WHERE element <> ''
);


WITH RECURSIVE split (element, remaining) AS (
SELECT '', (SELECT value FROM raw_input LIMIT 1)
UNION ALL
SELECT
	CASE
		WHEN INSTR(remaining, X'0A' || X'0A') > 0 THEN
            SUBSTR(remaining, 0, INSTR(remaining, X'0A' || X'0A'))
		ELSE
			remaining
	END,

	CASE
		WHEN INSTR(remaining, X'0A' || X'0A') > 0 THEN
			SUBSTR(remaining, INSTR(remaining, X'0A' || X'0A') + 2)
		ELSE
			''
	END
FROM split
WHERE remaining <> ''
),

valid_elements AS (
SELECT LENGTH(element) - LENGTH(REPLACE(element,X'0A', '')) + 1 num_lines,
    LENGTH(element) - LENGTH(REPLACE(element, 'a', '')) num_a,
    LENGTH(element) - LENGTH(REPLACE(element, 'b', '')) num_b,
    LENGTH(element) - LENGTH(REPLACE(element, 'c', '')) num_c,
    LENGTH(element) - LENGTH(REPLACE(element, 'd', '')) num_d,
    LENGTH(element) - LENGTH(REPLACE(element, 'e', '')) num_e,
    LENGTH(element) - LENGTH(REPLACE(element, 'f', '')) num_f,
    LENGTH(element) - LENGTH(REPLACE(element, 'g', '')) num_g,
    LENGTH(element) - LENGTH(REPLACE(element, 'h', '')) num_h,
    LENGTH(element) - LENGTH(REPLACE(element, 'i', '')) num_i,
    LENGTH(element) - LENGTH(REPLACE(element, 'j', '')) num_j,
    LENGTH(element) - LENGTH(REPLACE(element, 'k', '')) num_k,
    LENGTH(element) - LENGTH(REPLACE(element, 'l', '')) num_l,
    LENGTH(element) - LENGTH(REPLACE(element, 'm', '')) num_m,
    LENGTH(element) - LENGTH(REPLACE(element, 'n', '')) num_n,
    LENGTH(element) - LENGTH(REPLACE(element, 'o', '')) num_o,
    LENGTH(element) - LENGTH(REPLACE(element, 'p', '')) num_p,
    LENGTH(element) - LENGTH(REPLACE(element, 'q', '')) num_q,
    LENGTH(element) - LENGTH(REPLACE(element, 'r', '')) num_r,
    LENGTH(element) - LENGTH(REPLACE(element, 's', '')) num_s,
    LENGTH(element) - LENGTH(REPLACE(element, 't', '')) num_t,
    LENGTH(element) - LENGTH(REPLACE(element, 'u', '')) num_u,
    LENGTH(element) - LENGTH(REPLACE(element, 'v', '')) num_v,
    LENGTH(element) - LENGTH(REPLACE(element, 'w', '')) num_w,
    LENGTH(element) - LENGTH(REPLACE(element, 'x', '')) num_x,
    LENGTH(element) - LENGTH(REPLACE(element, 'y', '')) num_y,
    LENGTH(element) - LENGTH(REPLACE(element, 'z', '')) num_z
FROM split
WHERE element <> ''
)

SELECT SUM(value) FROM (
    SELECT
        CAST ((num_lines == num_a AND num_a > 0) AS INTEGER) +
        CAST ((num_lines == num_b AND num_b > 0) AS INTEGER) +
        CAST ((num_lines == num_c AND num_c > 0) AS INTEGER) +
        CAST ((num_lines == num_d AND num_d > 0) AS INTEGER) +
        CAST ((num_lines == num_e AND num_e > 0) AS INTEGER) +
        CAST ((num_lines == num_f AND num_f > 0) AS INTEGER) +
        CAST ((num_lines == num_g AND num_g > 0) AS INTEGER) +
        CAST ((num_lines == num_h AND num_h > 0) AS INTEGER) +
        CAST ((num_lines == num_i AND num_i > 0) AS INTEGER) +
        CAST ((num_lines == num_j AND num_j > 0) AS INTEGER) +
        CAST ((num_lines == num_k AND num_k > 0) AS INTEGER) +
        CAST ((num_lines == num_l AND num_l > 0) AS INTEGER) +
        CAST ((num_lines == num_m AND num_m > 0) AS INTEGER) +
        CAST ((num_lines == num_n AND num_n > 0) AS INTEGER) +
        CAST ((num_lines == num_o AND num_o > 0) AS INTEGER) +
        CAST ((num_lines == num_p AND num_p > 0) AS INTEGER) +
        CAST ((num_lines == num_q AND num_q > 0) AS INTEGER) +
        CAST ((num_lines == num_r AND num_r > 0) AS INTEGER) +
        CAST ((num_lines == num_s AND num_s > 0) AS INTEGER) +
        CAST ((num_lines == num_t AND num_t > 0) AS INTEGER) +
        CAST ((num_lines == num_u AND num_u > 0) AS INTEGER) +
        CAST ((num_lines == num_v AND num_v > 0) AS INTEGER) +
        CAST ((num_lines == num_w AND num_w > 0) AS INTEGER) +
        CAST ((num_lines == num_x AND num_x > 0) AS INTEGER) +
        CAST ((num_lines == num_y AND num_y > 0) AS INTEGER) +
        CAST ((num_lines == num_z AND num_z > 0) AS INTEGER) value
    FROM valid_elements
)
