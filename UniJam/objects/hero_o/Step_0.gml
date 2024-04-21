if (oldTimeSpeed!=client_o.time_speed){
	image_speed/=oldTimeSpeed
	image_speed*=client_o.time_speed
}

scabbard_o.image_angle = drawAng
scabbard_o.image_xscale = image_xscale

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

if !canDraw{
	if instance_exists(sword_o){
		with sword_o{
			with instance_create_layer(x,y,layer,returningSword_o){
				direction=other.direction
				image_angle=direction
				floatLerpAm = other.floatLerpAm
				hero=other.hero
				swordNum=1
			}
			instance_destroy()	
		}
	}
	if instance_exists(swordDefence_o){
		with swordDefence_o{
			with instance_create_layer(x,y,layer,returningSword_o){
				direction=other.direction
				image_angle=direction
				floatLerpAm = other.floatLerpAm
				hero=other.hero
				swordNum=2
			}
			instance_destroy()	
		}
	}
}

if (playerControl){
	hsp += (r-l)*walkSpd;
	if u jumpBuffer=5
}

if jumpBuffer>-1 jumpBuffer--;
var grvTemp = grv*client_o.time_speed
if vsp<vspMax-grvTemp vsp += grvTemp

if onGround and jumpBuffer>0{
	vsp = -jumpPower
	flipAllowed = false
	flipped=false
}
if jumpBuffer<0 and !onGround flipAllowed=true;
if jumpBuffer > 0 and flipAllowed and !onGround and !flipped{
	vsp = -jumpPower*0.75
	flipAllowed = false
	flipping=true
	flipped=true
}
if onGround flipping=false

var frict = onGround ? frictGround : frictAir
hsp/=frict

if place_meeting(x+hsp*client_o.time_speed,y,solid_o){
	while !place_meeting(x+sign(hsp),y,solid_o){
		x += sign(hsp)
	}
	hsp = 0
}
if place_meeting(x,y+vsp*client_o.time_speed,solid_o){
	while !place_meeting(x,y+sign(vsp),solid_o){
		y += sign(vsp)
	}
	if (vsp)>1 audio_play_sound(jump_snd,1,false,0.5*vsp/vspMax,0,random_range(0.8,1.2))
	vsp = 0
}
if place_meeting(x+hsp*client_o.time_speed,y+vsp*client_o.time_speed,solid_o){
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
scabbard.x=x
scabbard.y=y

if flipping{
	drawAng=blend_angles(drawAng,drawAng-40*image_xscale,5/client_o.time_speed);
}

if onGround{
	if abs(hsp)>0.2{
		distanceCovered+=abs(hsp)
		if distanceCovered>footstepDistance{
			distanceCovered-=footstepDistance
			audio_play_sound(grass_snd,1,false,4+random_range(0,1),0,random_range(0.8,1.2))
		}
		image_xscale = sign(hsp)
		image_speed=3
		sprite_index = heroWalkLower_s
		drawAng=blend_angles(drawAng,reformat_angle(-5*image_xscale),5/client_o.time_speed)
	} else {
		sprite_index = heroIdleLower_s
			drawAng=blend_angles(drawAng,0,5/client_o.time_speed)
}
} else {
	sprite_index=heroInAirLower_s
	image_speed=0
	if vsp<0{
		image_index=1
	} else {
		image_index=0
	}
}


if canDraw and drawing==0 and mouse_check_button(mb_left) and sword==noone{
	spriteUpper = heroDraw1Upper_s
	imageUpper=0
	drawing=1
	upperImageSpeed=0.2
	scabbard.image_index=1
	if instance_exists(swordDefence_o) or instance_exists(returningSword_o) scabbard.image_index=3
}
if canDraw and drawing==0 and mouse_check_button(mb_right) and sword==noone{
	spriteUpper = heroDraw2Upper_s
	imageUpper=0
	drawing=2
	upperImageSpeed=0.2
	scabbard.image_index=2
	if instance_exists(sword_o) or instance_exists(returningSword_o) scabbard.image_index=3
}
if drawing==1{
	if imageUpper>6.8 and !instance_exists(sword_o) and upperImageSpeed>0{
		sword = instance_create_layer(x,y,"sword",sword_o)
		sword.hero=self
		sword.direction = 65
		sword.image_angle=sword.direction;
	}
	if upperImageSpeed<0 and imageUpper<0.5{
		drawing=0
		if !instance_exists(returningSword_o) and !instance_exists(swordDefence_o) scabbard.image_index=0
		else scabbard.image_index=2
	}
}
if drawing==2{
	if imageUpper>5.8 and !instance_exists(swordDefence_o) and upperImageSpeed>0{
		sword = instance_create_layer(x,y,"sword",swordDefence_o)
		sword.hero=self
		sword.direction = 65
		sword.image_angle=sword.direction;
	}
	if upperImageSpeed<0 and imageUpper<0.5{
		drawing=0
		if !instance_exists(returningSword_o) and !instance_exists(sword_o) scabbard.image_index=0
		else scabbard.image_index=1
	}
}

if drawing==0{
	switch sprite_index{
		case heroWalkLower_s:
			spriteUpper=heroWalkUpper_s
			imageUpper=image_index
		break;
		case heroIdleLower_s:
			spriteUpper=heroIdleUpper_s
			imageUpper=image_index
		break;
		case heroInAirLower_s:
			spriteUpper=heroInAirUpper_s
			imageUpper=image_index
		break;
	}
} else {
	if drawing==1{
		if !instance_exists(sword_o) imageUpper+=upperImageSpeed*sqrt(client_o.time_speed)*client_o.playerDrawMult
		else drawing=false
		if imageUpper >= sprite_get_number(spriteUpper){
			imageUpper-=sprite_get_number(spriteUpper)
		}
	} 
	if drawing==2{
		if !instance_exists(swordDefence_o) imageUpper+=upperImageSpeed*sqrt(client_o.time_speed)*client_o.playerDrawMult
		else drawing=false
		if imageUpper >= sprite_get_number(spriteUpper){
			imageUpper-=sprite_get_number(spriteUpper)
		}
	}
}
if hitTime>0 {hitTime--; image_blend=c_red}
else {if image_blend==c_red {image_blend=c_white}}

if place_meeting(x,y,solid_o){
	instance_create_layer(x,y,"meta",genDialogueScript_o).functionName=physics_dialogue
	while place_meeting(x,y,solid_o) y--
}

if hp<=0 client_o.endRoom=Lobby