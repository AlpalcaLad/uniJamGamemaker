drawText="Wave: "+string(wave+1) + ", Earnings: "+string(wildsScore)

if !instance_exists(enemy_o) and waveClearText<=0{
	wave++;
	waveClearText=waveClearTextMax
}
if waveClearText>0{
	waveClearText--
	if waveClearText==0{
		with waveSpawner_o{
			for (var i=0; i<other.wave; i++){
				wave_spawn(archer_o)
			}
			for (var i=0; i<other.wave; i++){
				wave_spawn(stabber_o)
			}
		}
	}
}