draw_set_font(pixel)
draw_set_color(c_black)
//draw_roundrect(w*(2/3)-3*string_width(drawText)-45,15,w-5*string_width(drawText),15+4*string_height(drawText),false)
draw_roundrect(client_o.w/2-25-string_width(drawText)*2,25,client_o.w/2+25+string_width(drawText)*2,75,false)
draw_set_color(c_white)
draw_text_transformed(client_o.w/2-string_width(drawText)*2,20,drawText,4,4,0)

if waveClearText>0{
	draw_text_transformed(client_o.w/2-2*string_width("Wave Cleared"),client_o.h/2,"Wave Cleared",4,4,0)
}