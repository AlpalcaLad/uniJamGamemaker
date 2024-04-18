function angle_diff(ang1,ang2){ //in degrees please
	return min(abs(ang2-ang1),abs((min(ang2,ang1)+360)-max(ang2,ang1)))
}