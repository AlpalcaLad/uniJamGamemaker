direction = point_direction(other.x,other.y,target.x,target.y)+180
other.x -= hspeed
other.y -= vspeed
x += hspeed*2
y += vspeed*2
deflected = true
other.spin=true
other.spinStart=other.naturalAngle
audio_play_sound(swordHit_snd,1,false,0.6,0,random_range(0.8,1.2))