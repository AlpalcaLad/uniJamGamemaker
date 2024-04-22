time_speed = lerp(time_speed,time_speed_targ,0.25)
if abs(time_speed-time_speed_targ)<0.1 time_speed=time_speed_targ

if freezeTime>0{
	freezeTime--
	time_speed_targ=freezeGameSpeed
} else time_speed_targ=1

if pause{
	time_speed_targ=0.001
}

if !music{
	audio_sound_gain(combatMusic_snd,0,10)
	audio_sound_gain(lobbySound_snd,0,10)
} else {
	audio_sound_gain(combatMusic_snd,1,10)
	audio_sound_gain(lobbySound_snd,1,10)
}

var c=w/2
var mousex = (window_mouse_get_x()/window_get_width())*client_o.w
var mousey = (window_mouse_get_y()/window_get_height())*client_o.h
if pause and clickAllowed and mouse_check_button(mb_left){
	for (var i=0; i<array_length(pauseButtons); i++){
		if rectangle_check(mousex,mousey,c-string_width(pauseButtons[i])*2-15,50+100*(i),c+string_width(pauseButtons[i])*2+15,100*i+110){
			switch i{
				case 0:
					music=1-music
				break;
				case 1:
					endRoom=Lobby
					roomTarget=Lobby
				break;
				case 2:
					game_end()
				break;
			}
		}
		//if rectangle_check(mousex,mousey,c-string_width(shopButtons[i][0])*2-15,50+100*(i),c+string_width(shopButtons[i][0])*2+15,100*i+110){show_debug_message(i)}
	}
}
if !mouse_check_button(mb_left) {clickAllowed=true}
else {clickAllowed=false}

//var lay = layer_get_id("backTiles")

if (endRoom!=room and !instance_exists(transitionEffect_o)){
	/*
	roomChanging=true
	fadeObj=instance_create_layer(x,y,"fade",fade_o)
	fadeObj.image_speed=-3
	fadeObj.image_index=fadeObj.image_number-1
	*/
	var eff = instance_create_layer(x,y,layer,transitionEffect_o).roomTo=roomTarget
}

//w=window_get_width()
//h=window_get_height()