
function wave_spawn(monster){
	var newCreature = spawn_in_area(x,y,monster,48,6)
	if newCreature!=noone{
		with newCreature poof_effect()
		array_push(created,newCreature)
	}
	return newCreature
}