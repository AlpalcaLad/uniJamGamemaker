fireDl--
if fireDl<0 fired=true
if !fired{
	x=hero_o.x+xOff
	y=hero_o.y+yOff
	direction = blend_angles(direction,point_direction(x,y,hero_o.x,hero_o.y),5)
	image_angle=direction
	if abs(x-camera_o.x)>1024 instance_destroy()
	if abs(y-camera_o.y)>1024 instance_destroy()
	instance_create_layer(x,y,layer,magicDust_o)
} else {
	image_angle=direction
	if abs(x-camera_o.x)>1024 instance_destroy()
	if abs(y-camera_o.y)>1024 instance_destroy()
	speed = 2*client_o.time_speed
	instance_create_layer(x,y,layer,magicDust_o)
}