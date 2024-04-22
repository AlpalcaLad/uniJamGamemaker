drawText="Wave: "+string(wave+1) + ", Earnings: "+string(wildsScore)

if !(instance_exists(archer_o) or instance_exists(stabber_o) or instance_exists(mage_o)) and waveClearText<=0{
	wave++;
	waveClearText=waveClearTextMax
}
if waveClearText>0{
	waveClearText--
	if waveClearText==0{
		hero_o.honour+=3
		wildsScore+=3
		with waveSpawner_o{
			wave_spawner()
		}
		with enemy_o if place_meeting(x,y,solid_o) while place_meeting(x,y,solid_o) y--
	}
}
