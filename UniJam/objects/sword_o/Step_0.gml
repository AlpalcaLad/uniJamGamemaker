var allowQuickStrike=false
if target==noone and mouse_check_button(mb_left) and attackDl<0{
	allowQuickStrike=true
}

var mouseDirec=point_direction(hero.x,hero.y,mouse_x,mouse_y)
var maxX=hero.x+abs(lengthdir_x(maxPlayerDist,mouseDirec))
var minX=hero.x-abs(lengthdir_x(maxPlayerDist,mouseDirec))
var maxY=hero.y+abs(lengthdir_y(maxPlayerDist,mouseDirec))
var minY=hero.y-abs(lengthdir_y(maxPlayerDist,mouseDirec))
var mousex = clamp(mouse_x,minX,maxX)
var mousey = clamp(mouse_y,minY,maxY)

if !attacking{
	if freeRoam target = instance_nearest(mousex,mousey,target_o)
	else target = instance_nearest(hero.x,hero.y,target_o)
}
if target != noone and point_distance(mousex,mousey,target.x,target.y)>maxTargetRange and !attacking and freeRoam{
	target=noone;
}
/*else {
	if allowQuickStrike{
			attackDirection = point_direction(0,0,hsp,vsp)
	}
}*/

if spin{
	naturalAngle=reformat_angle(naturalAngle+15)
	if naturalAngle==spinStart spin=false
	/*
	if place_meeting(x,y,stabber_o){
		with instance_place(x,y,stabber_o){
			hsp += sign(x-other.x)
		}
	}
	*/
}
if mouse_check_button(mb_middle) and !spin{ //temp
	spin=true
	spinStart=naturalAngle
}


if mouse_check_button(mb_right) or keyboard_check(ord("F")){
	/*
	canAttack=false
	attackDirection = 180-point_direction(mouse_x,mouse_y,hero.x,hero.y)
	xTo = hero.x + attackFloatDist*dcos(attackDirection);
	yTo = hero.y + attackFloatDist*dsin(attackDirection);
	direction = blend_angles(direction,reformat_angle(point_direction(hero.x,hero.y,mouse_x,mouse_y)+90),angleLerpAm,true);
	image_angle=direction;
	*/
	with instance_create_layer(x,y,layer,returningSword_o){
		direction=other.direction
		image_angle=direction
		floatLerpAm = other.floatLerpAm
		hero=other.hero
		swordNum=1
	}
	instance_destroy()
}

if attackDl>-10 attackDl-=client_o.time_speed

if !mouse_check_button(mb_right){
	if target!=noone and !spin{
		if !attacking{
			if attackDl <= -10 attackDirection = 180-point_direction(mousex,mousey,target.x,target.y)
			xTo = target.x + attackFloatDist*dcos(attackDirection);
			yTo = target.y + attackFloatDist*dsin(attackDirection);
			direction = blend_angles(direction,reformat_angle(point_direction(target.x,target.y,mousex,mousey)-90),angleLerpAm/client_o.time_speed,true);
			image_angle=direction;
			if attackDl<0 canAttack=true;
		}
	} else {
		direction = blend_angles(direction,naturalAngle,angleLerpAm/client_o.time_speed,true);
		image_angle=direction
		xTo = mousex
		yTo = mousey
		canAttack=false;
	}
}

if canAttack and mouse_check_button(mb_left) and target!=noone{
	canAttack=false;
	attackDl=attackDlMax*client_o.swordSpeedMult;
	var newDirection = reformat_angle(180+attackDirection)
	if attackDirection > newDirection{
		attackSpinSpeed = (newDirection-attackDirection+360)/attackTimeMax
	} else {
		attackSpinSpeed = (newDirection-attackDirection)/attackTimeMax
	}
	attacking=true
	audio_sound_gain(swordHit_snd,0.25,0)
	if allowQuickStrike and object_get_parent(target.object_index)==enemy_o{
		target.hsp += hsp/8
		target.vsp += vsp/8
		target.hp-=1*client_o.playerDamage
		audio_sound_gain(swordHit_snd,0.75,0)
	}
	attackTime=attackTimeMax
	hsp = ((target.x + attackFloatDist*dcos(newDirection))-x)/attackTimeMax
	vsp = ((target.y + attackFloatDist*dsin(newDirection))-y)/attackTimeMax
}

if existTime<30 existTime++
if existTime<30 and point_distance(0,0,vsp,hsp)>10{
	with instance_create_layer(x,y,layer,objectMarker_o){
		depth ++;
		sprite_index=other.sprite_index
		image_index=other.image_index
		image_angle=other.image_angle
		decay=0.1
		image_alpha=0.25
	}
}

if attacking and target!=noone{
	/*
	*/
	attackDirection += attackSpinSpeed
	direction = blend_angles(direction,reformat_angle(attackDirection+90),attackTimeMax,true);
	image_angle=direction;
	attackTime--;
	if attackTime<=0 {
		attacking=false
		if object_get_parent(target.object_index)==enemy_o{
			target.hitTime+=5
			target.hp-=2*client_o.playerDamage
		}
		if object_get_parent(target.object_index)!=enemy_o or target.hp>0{
			audio_play_sound(swordHit_snd,1,false,0.5,0,random_range(0.8,1.2))
			for (var i=0; i<50; i++){
				var multiplier = i/bloodCount/attackTimeMax
				var blood = instance_create_layer(target.x-hsp*multiplier,target.y-vsp*multiplier,"particles",blood_o)
				if allowQuickStrike{
					blood.speed /= 4
					blood.vspeed += vsp
					blood.hspeed += hsp
					blood.speed *= 8
					blood.image_speed = 2+random_range(0,1)
					blood.x = target.x
					blood.y = target.y
				} else {
					blood.vspeed += vsp/30
					blood.hspeed += hsp/30
					blood.speed *= 2
					blood.image_speed=2
				}
			}
		} else {
			audio_play_sound(swordAir_snd,1,false,0.75,0,random_range(0.8,1.2))
		}
	}
} else{
	if existTime<15{
		hsp = (xTo-x)/floatLerpAm * (existTime/15);
		vsp = (yTo-y)/floatLerpAm * (existTime/15);
	} else {
		hsp = (xTo-x)/floatLerpAm;
		vsp = (yTo-y)/floatLerpAm;
	}
}

x += hsp*client_o.time_speed;
y += vsp*client_o.time_speed;