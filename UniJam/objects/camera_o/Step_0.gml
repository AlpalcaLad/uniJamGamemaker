/*
This code will clamp the camera to within the view:

xTo = clamp(xTo,-room_width+edgeBorder*zoom,2*room_width-edgeBorder*zoom)
yTo = clamp(yTo,-room_height+edgeBorder*zoom,2*room_height-edgeBorder*zoom)
*/
if !freeZoom zoom = max(zoom,0.15)
if abs(targetZoom-zoom)>0.02 zoom += (targetZoom-zoom)/5

if (follow != noone)
{
	xTo = follow.x
	yTo = follow.y
}
if aimMoveScale!=-1{
	xTo+=(mouse_x-x)/aimMoveScale
	yTo+=(mouse_y-y)/aimMoveScale
}
if targetMoveAheadScale!=-1 and follow==hero_o{
	xTo+=follow.hsp*targetMoveAheadScale
}

if screenShake>0{
	screenShake-=client_o.time_speed
	if screenShake==screenShakeMax{
		screenShakeOffset1=random.randrange(-3,3)
        screenShakeOffset2=random.randrange(-3,3)
	}
	x += client_o.time_speed*(screenShakeIntensity*screenShake)*cos((screenShake+screenShakeOffset1)/screenShakeMult)
	y += client_o.time_speed*(screenShakeIntensity*screenShake)*sin((screenShake+screenShakeOffset1)/screenShakeMult)
	//xTo+=cos(screenShake*random_range(0,5))*random_range(0,5)*screenShake
	//yTo+=sin(screenShake*random_range(0,5))*random_range(0,5)*screenShake
}

xTo = clamp(xTo,525*zoom/2,room_width-525*zoom/2)
yTo = clamp(yTo,288*zoom/2,room_height-288*zoom/2)
x = clamp(x,525*zoom/2,room_width-525*zoom/2)
y = clamp(y,288*zoom/2,room_height-288*zoom/2)

with cameraBlock_o{
	if xDir==1{
		if other.xTo>x other.xTo=x
	}
	if xDir==-1{
		if other.xTo<x other.xTo=x
	}
	if yDir==1{
		if other.yTo>y other.yTo=y
	}
	if yDir==-1{
		if other.yTo<y other.yTo=y
	}
}

hsp = (xTo - x )/25
vsp = (yTo - y )/25

//moving the camera
x += (hsp)
y += (vsp)

//update camera perspective
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)
var pm = matrix_build_projection_ortho(525 *zoom,288*zoom,1,10000)
camera_set_view_mat(camera,vm)
camera_set_proj_mat(camera,pm)
