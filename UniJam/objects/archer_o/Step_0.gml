var onGround = place_meeting(x,y+1,solid_o)
var onWall = place_meeting(x+1,y,solid_o) or place_meeting(x-1,y,solid_o)

if (false){
	hsp += (r-l)*walkSpd;
	if u jumpBuffer=5
}

if jumpBuffer>-1 jumpBuffer--;
var grvTemp = grv
vsp += grv

target = hero_o
if (y-target.y)<64 and abs((distance_rough(x,y,target)-goalDistance)>goalBuffer+4){
	hsp += walkSpd * sign(target.x-x)
	if !place_meeting(x+edgeAvoidDist*sign(hsp),y+5,solid_o) and !place_meeting(x+edgeAvoidDist*sign(hsp),y+22,solid_o){
		hsp=0
	}
}
if (y-target.y)<64 and abs((distance_rough(x,y,target)-goalDistance)<goalBuffer-4){
	hsp += walkSpd * sign(x-target.x)
	if !place_meeting(x+edgeAvoidDist*sign(hsp),y+5,solid_o) and !place_meeting(x+edgeAvoidDist*sign(hsp),y+22,solid_o){
		hsp=0
	}
}

if onGround and jumpBuffer>0{
	vsp = -jumpPower
}
if jumpBuffer > 0 and flipAllowed and !onGround{
	vsp = -jumpPower*0.75
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
if onGround{
	if abs(hsp)>0.2{
		image_xscale = sign(hsp)
		image_speed=2
		sprite_index = archerWalkLower_s
		drawAng=blend_angles(drawAng,reformat_angle(-5*image_xscale),5)
	} else {
		sprite_index = archerIdleLower_s
			drawAng=blend_angles(drawAng,0,5)
}
} else {
	sprite_index=archerInAirLower_s
	image_speed=0
	if vsp<0{
		image_index=1
	} else {
		image_index=0
	}
}

if attacking==0{
	switch sprite_index{
		case archerWalkLower_s:
			spriteUpper=archerWalkUpper_s
			imageUpper=image_index
		break;
		case archerIdleLower_s:
			spriteUpper=archerIdleUpper_s
			imageUpper=image_index
		break;
		case archerInAirLower_s:
			spriteUpper=archerInAirUpper_s
			imageUpper=image_index
		break;
	}
}