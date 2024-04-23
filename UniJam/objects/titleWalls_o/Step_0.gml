vspeed=-3.5;
if y<0{
	instance_create_layer(x,y+room_height,"walls",titleWalls_o).image_xscale=image_xscale
	instance_destroy()
}
hero_o.canDraw=false