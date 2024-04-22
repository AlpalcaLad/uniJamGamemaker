direction = point_direction(other.x,other.y,hero_o.x,hero_o.y)+180
x += hspeed*2
y += vspeed*2
deflected = true
audio_play_sound(swordHit_snd,1,false,0.3,0,random_range(0.8,1.2))