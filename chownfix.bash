
function fix() {

 /bin/chown $1 crontab
	
	}


list="andremos
	bedpress
	bjorni
	brukere.txt
	christbw
	christht
	dennisse
	erlendbm
	fairy
	franks
	geiraaa
	gorank
	haavaba
	henrikes
	hermana
	janeja
	jans
	johnpg
	jorabra
	jorgenvi
	jornj
	jou
	kenr
	knutd
	knutmk
	larsk
	larstr
	magrode
	michaelh
	oddstee
	olecl
	oysteivi
	oyvindha
	oyvindq
	paalmm
	pauls
	pergh
	remil
	root
	roysn
	sigurdk
	stiangi
	stigb
	terjeh
	thomaslu
	tommyeid
	torbjorn
	torsam
	torvaldl
	vidars
	vidarst
	vips
	ws"

for tool in $list
do
	fix $tool
done
