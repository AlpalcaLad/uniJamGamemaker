if createDl>-1 createDl--
if active and createDl<0 and array_length(created)<maxEnemies and point_distance(x,y,hero_o.x,hero_o.y)<500{
	createDl=spawnDelay
	wave_spawn(monster)
}
/* needs reimplementation
if position_meeting(x,y-16,hero_o) and active{
	active=false
	sprite_index=monsterSpawnerDestroyed_s
	hero_o.cutscene=false
	hero_o.hsp=0
	hero_o.vsp=0
	hero_o.sprite_index=heroDestroySpawnerTop_s
	camera_o.follow=self
	camera_o.targetZoom=0.4
}
*/
if sprite_index==monsterSpawnerDestroyed_s and image_speed!=0{
	var dust=instance_create_layer(irandom_range(bbox_left,bbox_right),bbox_bottom,"particles",dust_o)
	dust.hspeed=random_range(-0.4,0.4)
	dust.vspeed=random_range(-0.3,-0.1)
}