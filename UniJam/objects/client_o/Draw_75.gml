if pause{
	draw_set_alpha(0.25)
	draw_set_color(c_ltgrey)
	draw_rectangle(0,0,w,h,false)
	var c=w/2
	draw_set_font(pixel)
	draw_set_alpha(1)
	for (var i=0; i<array_length(pauseButtons); i++){
		var tempText=pauseButtons[i]
		draw_set_color(c_black)
		draw_roundrect(c-string_width(tempText)*2-15,50+100*(i),c+string_width(tempText)*2+15,100*i+110,false)
		draw_set_color(c_white)
		draw_text_transformed(c-string_width(tempText)*2,50+100*(i),tempText,4,4,0)
	}
}