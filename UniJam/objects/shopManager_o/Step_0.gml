var c=client_o.w/2
var mousex = (window_mouse_get_x()/window_get_width())*client_o.w
var mousey = (window_mouse_get_y()/window_get_height())*client_o.h
if !client_o.pause and clickAllowed and mouse_check_button(mb_left){
	for (var i=0; i<array_length(client_o.shopButtons); i++){
		if client_o.shopButtons[i][3]!="MAXED" and client_o.money>=client_o.shopButtons[i][3] and rectangle_check(mousex,mousey,c-string_width(client_o.shopButtons[i][0])*2-15,50+100*(i),c+string_width(client_o.shopButtons[i][0])*2+15,100*i+110){
			client_o.money-=client_o.shopButtons[i][3]
			var client=instance_nearest(x,y,client_o)
			variable_instance_set(client,client_o.shopButtons[i][1],client_o.shopButtons[i][2]+variable_instance_get(client,client_o.shopButtons[i][1]))
			client_o.shopButtons[i][3]+=client_o.shopButtons[i][4]
			if client_o.shopButtons[i][3]>=client_o.shopButtons[i][5] client_o.shopButtons[i][3]="MAXED"
		}
		//if rectangle_check(mousex,mousey,c-string_width(shopButtons[i][0])*2-15,50+100*(i),c+string_width(shopButtons[i][0])*2+15,100*i+110){show_debug_message(i)}
	}
	if rectangle_check(mousex,mousey,10,client_o.h-70,string_width("Exit shop")*4+40,client_o.h-10){
		client_o.endRoom = Lobby
		client_o.roomTarget= Lobby
	}
	//
}
if !mouse_check_button(mb_left) {clickAllowed=true}
else {clickAllowed=false}