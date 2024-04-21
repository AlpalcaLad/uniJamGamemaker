draw_set_color(c_black)
if image_speed>0{
	draw_rectangle(0,0,w,h-h*fillPerc,false)
} else {
	draw_rectangle(0,h-h*fillPerc,w,h,false)
}
draw_set_color(c_white)