if !deflected and other.hitTime<=0{
	client_o.freezeTime+=5
	camera_o.screenShake+=10
	other.hitTime+=5
	instance_destroy()
}