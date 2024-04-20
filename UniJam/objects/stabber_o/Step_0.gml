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
if (attacking or attackDl<0) goalDistance=goalDistanceClose
else goalDistance=goalDistanceFar
var dist = point_distance(x,y,target.x,target.y)
if dist<viewMaxRange and ( abs(dist-goalDistance) > goalBuffer ){
	hsp += walkSpd * sign(dist-goalDistance) * sign(target.x-x)
	if !place_meeting(x+edgeAvoidDist*sign(hsp),y+5,solid_o) and !place_meeting(x+edgeAvoidDist*sign(hsp),y+22,solid_o){
		hsp=0
	}
} else {
	if dist<goalDistance{
		if attackDl<0{
			attacking=true
			attackDl = attackDlMax
			spriteUpper=stabberStabUpper_s
			upperImageSpeed=0.15
			attacked=false
			image_xscale = sign(target.x-x)
		}
	}	
}
attackDl-=client_o.time_speed

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

x += hsp*client_o.time_speed
y += vsp*client_o.time_speed


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

if !attacking{
	switch sprite_index{
		case archerWalkLower_s:
			spriteUpper=stabberWalkUpper_s
			imageUpper=image_index
		break;
		case archerIdleLower_s:
			spriteUpper=stabberIdleUpper_s
			imageUpper=image_index
		break;
		case archerInAirLower_s:
			spriteUpper=stabberInAirUpper_s
			imageUpper=image_index
		break;
	}
} else {
	imageUpper+=upperImageSpeed*sqrt(client_o.time_speed)
	if !attacked and imageUpper>5 and imageUpper<9 and target.hitTime<=0{
		target.hitTime += 5
		if target.object_index==hero_o{
			client_o.freezeTime+=5
			camera_o.screenShake+=10
			attacked=true
			audio_play_sound(swordHit_snd,1,false,0.25,0,random_range(0.8,1.2))
		}
	}
	if imageUpper>sprite_get_number(spriteUpper)-1{
		attacking=false
		upperImageSpeed=0
		spriteUpper = stabberIdleUpper_s
		attackDl = attackDlMax
	}
}
if hitTime>0 {hitTime--; image_blend=c_red}
else {
	if image_blend==c_red {
		image_blend=c_white; 
		if hp<0 instance_destroy()
	}
}