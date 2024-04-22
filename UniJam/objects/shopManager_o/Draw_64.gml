var c=client_o.w/2
draw_set_font(pixel)
for (var i=0; i<array_length(client_o.shopButtons); i++){
	var tempText=client_o.shopButtons[i][0] + string(client_o.shopButtons[i][3]) + "$ " + "(" + string(variable_instance_get(client_o,client_o.shopButtons[i][1])) + ")"
	if client_o.shopButtons[i][3]=="MAXED" tempText="Sold out."
	draw_set_color(c_black)
	draw_roundrect(c-string_width(tempText)*2-15,50+100*(i),c+string_width(tempText)*2+15,100*i+110,false)
	draw_set_color(c_white)
	if client_o.shopButtons[i][3]=="MAXED" or client_o.shopButtons[i][3]>client_o.money draw_set_color(c_grey)
	draw_text_transformed(c-string_width(tempText)*2,50+100*(i),tempText,4,4,0)
}

var tempText="Exit shop"
draw_set_color(c_black)
draw_roundrect(10,client_o.h-70,string_width(tempText)*4+40,client_o.h-10,false)
draw_set_color(c_white)
draw_text_transformed(25,client_o.h-70,tempText,4,4,0)

draw_set_color(c_white)
draw_text_transformed(20,0,"$"+string(client_o.money),6,6,0)
draw_set_color(c_white)