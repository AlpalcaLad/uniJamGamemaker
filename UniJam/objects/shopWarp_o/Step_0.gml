
if place_meeting(x,y,hero_o){
	if (keyboard_check(ord("E")) or keyboard_check(vk_enter)) and indic.image_index < 4{
		client_o.endRoom = Shop
		client_o.roomTarget= Shop
	}
	if drawAble and indic.image_index > 4{
		indic.image_speed = -2;
		indic.image_index = indic.image_number-1
		drawAble = false
	}
}
else{
	if indic.image_index < 4 indic.image_speed = 2
	drawAble = true
}