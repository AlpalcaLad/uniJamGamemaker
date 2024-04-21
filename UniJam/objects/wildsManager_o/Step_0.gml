drawText="Wave: "+string(wave+1) + ", Earnings: "+string(wildsScore)

if !instance_exists(enemy_o) and waveClearText<=0{
	wave++;
	waveClearText=waveClearTextMax
}
if waveClearText>0{
	waveClearText--
	if waveClearText==0{
		with waveSpawner_o{
			var en;
			for (var i=0; i<round(sqrt(other.wave)); i++){
				en = wave_spawn(archer_o)
				en.hp+=other.wave
				en.walkSpd+=0.01*other.wave
				en.attackDlMax-=other.wave
			}
			for (var i=0; i<round(sqrt(other.wave)); i++){
				en = wave_spawn(stabber_o)
				en.hp+=other.wave
				en.walkSpd+=0.01*other.wave
				en.attackDlMax-=other.wave
			}
		}
	}
}