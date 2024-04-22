// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wave_spawner(){
	var en;
	if wildsManager_o.wave==1{
		for (var i=0; i<round(sqrt(wildsManager_o.wave)); i++){
			en = wave_spawn(stabber_o)
			en.hp+=wildsManager_o.wave
			en.walkSpd+=0.01*wildsManager_o.wave
			en.attackDlMax-=wildsManager_o.wave
		}
	}
	else if wildsManager_o.wave<=5{
		for (var i=0; i<round(sqrt(wildsManager_o.wave)-1); i++){
			en = wave_spawn(archer_o)
			en.hp+=wildsManager_o.wave
			en.walkSpd+=0.01*wildsManager_o.wave
			en.attackDlMax-=wildsManager_o.wave
		}
		for (var i=0; i<round(sqrt(wildsManager_o.wave)); i++){
			en = wave_spawn(stabber_o)
			en.hp+=wildsManager_o.wave
			en.walkSpd+=0.01*wildsManager_o.wave
			en.attackDlMax-=wildsManager_o.wave
		}
	}
	if wildsManager_o.wave>5{
		for (var i=0; i<round(sqrt(wildsManager_o.wave))-2; i++){
			en = wave_spawn(betterArcher_o)
			en.hp+=wildsManager_o.wave
			en.walkSpd+=0.01*wildsManager_o.wave
			en.attackDlMax-=wildsManager_o.wave
		}
		for (var i=0; i<round(sqrt(wildsManager_o.wave)-2); i++){
			en = wave_spawn(stabber_o)
			en.hp+=wildsManager_o.wave
			en.walkSpd+=0.01*wildsManager_o.wave
			en.attackDlMax-=wildsManager_o.wave
		}
		for (var i=0; i<round(sqrt(wildsManager_o.wave)-2); i++){
			en = wave_spawn(mage_o)
			en.hp+=wildsManager_o.wave
			en.walkSpd+=0.01*wildsManager_o.wave
			en.attackDlMax-=wildsManager_o.wave
		}
	}
}