/*else {
	if allowQuickStrike{
			attackDirection = point_direction(0,0,hsp,vsp)
	}
}*/

if spin{
	naturalAngle=reformat_angle(naturalAngle+15)
	if naturalAngle==spinStart spin=false
}
if mouse_check_button(mb_middle) and !spin{ //temp
	spin=true
	spinStart=naturalAngle
}



canAttack=false
attackDirection = 180-point_direction(mouse_x,mouse_y,hero.x,hero.y)
xTo = hero.x + attackFloatDist*dcos(attackDirection);
yTo = hero.y + attackFloatDist*dsin(attackDirection);
direction = blend_angles(direction,reformat_angle(point_direction(hero.x,hero.y,mouse_x,mouse_y)+90),angleLerpAm,true);
image_angle=direction;


if attackDl>-10 attackDl--


if mouse_check_button(mb_left) or keyboard_check(ord("F")){
	with instance_create_layer(x,y,layer,returningSword_o){
		direction=other.direction
		image_angle=direction
		floatLerpAm = other.floatLerpAm
		hero=other.hero
		swordNum=2
	}
	instance_destroy()
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


if existTime<15{
	hsp = (xTo-x)/floatLerpAm * (existTime/15);
	vsp = (yTo-y)/floatLerpAm * (existTime/15);
} else {
	hsp = (xTo-x)/floatLerpAm;
	vsp = (yTo-y)/floatLerpAm;
}

x += hsp;
y += vsp;