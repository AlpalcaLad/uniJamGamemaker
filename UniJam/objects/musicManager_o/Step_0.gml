if roomFor>= 60 and instance_exists(transitionEffect_o) and room!=Shop{
	if room==Lobby audio_sound_gain(lobbySound_snd,0,20)
	if room==TheWilds audio_sound_gain(combatMusic_snd,0,20)
}
if roomFor<60 roomFor++