
var tempKnifeDist=knifeDist
angle+=angleDelta
if angle%angleMod==0{
	
	var targCoord=[hero_o.x+knifeDist*dcos(angle), hero_o.y-knifeDist*dsin(angle)]
	/*
	if instance_place(targCoord[0],targCoord[1],solid_o){
		while instance_place(targCoord[0],targCoord[1],solid_o) and tempKnifeDist>24{
			tempKnifeDist--;
			var targCoord=[hero_o.x+tempKnifeDist*dcos(angle), hero_o.y-tempKnifeDist*dsin(angle)]
		}
	}
	*/
	instance_create_layer(targCoord[0],targCoord[1],layer,thrownCircleKnife_o)
}
if angle>=angleStop{
	instance_destroy()
}