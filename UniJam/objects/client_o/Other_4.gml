if instance_exists(hero_o) hero_o.hp=playerHealth

if existedFor<1 existedFor+=1
/*
else {
	fadeObj=instance_create_layer(x,y,"fade",fade_o)
	fadeObj.image_speed=3
	roomChanging=false
}
*/

if instance_exists(hero_o){
	hero_o.hp=playerHealth
	hero_o.hpLast=hero_o.hp
	if room==TheWilds for (var i=0; i<hero_o.hp; i++){instance_create_layer(x,y,layer,heart_o)}
}

roomChanging=false
endRoom=room

if lastRoom==Shop{
	//669 180
	hero_o.x=669
	hero_o.y=180
}
lastRoom=room