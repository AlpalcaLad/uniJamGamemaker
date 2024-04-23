
if place_meeting(x,y,hero_o){
	if keyboard_check(vk_space) and !instance_exists(genDialogueScript_o) and indic.image_index < 4{
		var dia = instance_create_layer(x,y,"meta",genDialogueScript_o)
		dia.functionName=spider_dialogue
		dia.madeBy=id
		if spoken and client_o.deaths==0 genDialogueScript_o.currentIndex=5
		if client_o.deaths>0 genDialogueScript_o.currentIndex=16
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
	if distance_rough(x,y,hero_o)>96 {
		with genDialogueScript_o{
			if madeBy==other.id instance_destroy()
		}
	}
}
