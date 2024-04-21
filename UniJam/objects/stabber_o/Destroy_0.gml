poof_effect()
if instance_exists(wildsManager_o){
	wildsManager_o.wildsScore += floor(25/clamp(sqrt(distance_rough(x,y,hero_o)),1,100))
}