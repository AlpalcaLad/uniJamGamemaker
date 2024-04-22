var xTo=hero_o.x
var yTo=hero_o.y

hsp = sign(xTo-x)/2
vsp = sign(yTo-y)/2

if abs(y-yTo)<2 vsp=0
if abs(x-xTo)<2 hsp=0
if abs(x-xTo)>128 vsp=0

x += hsp
y += vsp

if attackDl>-1 attackDl--;
if place_meeting(x,y,hero_o) and attackDl<0{
	client_o.freezeTime+=5
	camera_o.screenShake+=10
	hero_o.hitTime+=10
	hero_o.hp--;
	attackDl=attackDlMax
}

if hsp!=0 image_xscale=sign(hsp)