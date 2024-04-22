poof_effect()
if instance_exists(wildsManager_o){
	var scoreAdd = kill_score()
	wildsManager_o.wildsScore += clamp(floor(scoreAdd/2),0,10)
	hero_o.honour+= 2 - (5-scoreAdd)
	if hero_o.honour<0{
		hero_o.honour=0
		instance_create_layer(x,y,layer,ghost_o)
	}
}