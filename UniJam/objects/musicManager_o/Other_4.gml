if room==TheWilds{
	audio_stop_all()
	audio_play_sound(combatMusic_snd,1,true,0.25)
	audio_sound_gain(combatMusic_snd,1,20)
}
if room==Lobby{
	audio_stop_sound(combatMusic_snd)
	if !audio_is_playing(lobbySound_snd){
		audio_play_sound(lobbySound_snd,1,true,0.75)
		audio_sound_gain(lobbySound_snd,1,20)
	}
}
roomFor=0