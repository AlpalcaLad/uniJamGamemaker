if deflected and client_o.deflectedSwordsHome>0 and instance_exists(enemy_o){
	var en = instance_nearest(x,y,enemy_o)
	direction = blend_angles(direction,point_direction(x,y,en.x,en.y),client_o.deflectedSwordsHome)
	instance_create_layer(x,y,layer,magicDust_o)
}

image_angle=direction
if abs(x-camera_o.x)>1024 instance_destroy()
if abs(y-camera_o.y)>1024 instance_destroy()
speed = 3*client_o.time_speed