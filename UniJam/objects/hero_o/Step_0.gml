scabbard_o.image_index = sword!=noone;

var onGround = place_meeting(x,y+1,solid_o)
var onWall = place_meeting(x+1,y,solid_o) or place_meeting(x-1,y,solid_o)

if playerControl{
	var r = keyboard_check(ord("D"))
	var l = keyboard_check(ord("A"))
	var u = keyboard_check(ord("W"))
} else {
	var r=false;
	var l=false;
	var u=false;	
}

if (playerControl){
	hsp += (r-l)*walkSpd;
	if u jumpBuffer=5
}

if jumpBuffer>-1 jumpBuffer--;
var grvTemp = grv
vsp += grv

if onGround and jumpBuffer>0{
	vsp = -jumpPower
}

var frict = onGround ? frictGround : frictAir
hsp/=frict

if place_meeting(x+hsp,y,solid_o){
	while !place_meeting(x+sign(hsp),y,solid_o){
		x += sign(hsp)
	}
	hsp = 0
}
if place_meeting(x,y+vsp,solid_o){
	while !place_meeting(x,y+sign(vsp),solid_o){
		y += sign(vsp)
	}
	vsp = 0
}
if place_meeting(x+hsp,y+vsp,solid_o){
	while !place_meeting(x+sign(hsp),y+sign(vsp),solid_o){
		x += sign(hsp)
		y += sign(vsp)
	}
	hsp = 0
	vsp = 0
}

x += hsp
y += vsp


//animation
scabbard.x=x
scabbard.y=y
if onGround{
	if abs(hsp)>0.2{
		image_xscale = sign(hsp)
		image_speed=2
		sprite_index = heroWalk_s
		drawAng=blend_angles(drawAng,reformat_angle(-5*image_xscale),5)
	} else {
		sprite_index = heroIdle_s
		drawAng=blend_angles(drawAng,0,5)
	}
} else {
	sprite_index=heroInAir_s
	image_speed=0
	if vsp<0{
		image_index=1
	} else {
		image_index=0
	}
}