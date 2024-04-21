existedFor=0
with client_o{
	if existedFor<other.existedFor instance_destroy()
}
w=window_get_width()
h=window_get_height()
time_speed=1
window_set_size(display_get_width(),display_get_height())
window_set_position(0,0)
afterImageFreq=20
afterImageDl=0
time_speed_targ=1
//window_set_cursor(cr_none);
freezeTime=0
freezeGameSpeed=0.1
blockCamera=true

//upgrades
playerHealth=3
playerDamage=1
playerDrawMult=2

endRoom=room
roomChanging=false
fadeObj=noone