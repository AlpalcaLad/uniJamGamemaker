if deflected{
	other.hp-=2;
	other.hitTime+=5
	other.vsp += vspeed/2
	other.hsp += hspeed/2
	instance_destroy()
}