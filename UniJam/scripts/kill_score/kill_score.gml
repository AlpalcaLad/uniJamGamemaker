
function kill_score(){
	var scoreReturn = 5
	if abs(x-hero_o.x)>32 scoreReturn-=1;
	if abs(x-hero_o.x)>64 scoreReturn-=2;
	if abs(x-hero_o.x)>96 scoreReturn-=2;
	
	if abs(y-hero_o.y)>40 scoreReturn-=3;
	if abs(y-hero_o.y)>64 scoreReturn-=4;
	
	return scoreReturn
}