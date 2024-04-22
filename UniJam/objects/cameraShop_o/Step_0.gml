/*
This code will clamp the camera to within the view:

xTo = clamp(xTo,-room_width+edgeBorder*zoom,2*room_width-edgeBorder*zoom)
yTo = clamp(yTo,-room_height+edgeBorder*zoom,2*room_height-edgeBorder*zoom)
*/

if (follow != noone)
{
	xTo = follow.x+58
	yTo = follow.y-16
}
if aimMoveScale!=-1{
	xTo+=(mouse_x-x)/aimMoveScale
	yTo+=(mouse_y-y)/aimMoveScale
}
if targetMoveAheadScale!=-1 and follow==hero_o{
	xTo+=follow.hsp*targetMoveAheadScale
}

xTo = clamp(xTo,525*zoom/2,room_width-525*zoom/2)
yTo = clamp(yTo,288*zoom/2,room_height-288*zoom/2)
x = clamp(x,525*zoom/2,room_width-525*zoom/2)
y = clamp(y,288*zoom/2,room_height-288*zoom/2)

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
