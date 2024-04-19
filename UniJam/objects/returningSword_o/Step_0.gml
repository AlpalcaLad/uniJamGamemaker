xTo = hero.x 
yTo = hero.y

x += (xTo-x)/floatLerpAm;
y += (yTo-y)/floatLerpAm;

if distance_rough(x,y,hero)<2+2*point_distance(0,0,hero.hsp,hero.vsp) and hero.spriteUpper!=heroDraw2Upper_s and hero.spriteUpper!=heroDraw1Upper_s{
	if swordNum==1{
		with hero{
			spriteUpper = heroDraw1Upper_s
			imageUpper=sprite_get_number(heroDraw1Upper_s)
			drawing=1
			upperImageSpeed=-0.25
		}
	} else {
		with hero{
			spriteUpper = heroDraw2Upper_s
			imageUpper=sprite_get_number(heroDraw2Upper_s)
			drawing=2
			upperImageSpeed=-0.25
		}
	}
	instance_destroy()
}