fillPerc+=0.075*fillDirec
/*
if fillDirec>0 and fillDirec>1.2{
	room_goto(roomTo)
	instance_destroy()
}

if fillDirec<0 and fillDirec<-0.2{
	instance_destroy()
}
*/

if fillPerc<-1 instance_destroy()

if fillPerc>2 {
	//show_debug_message(room_get_name(client_o.roomTarget))
	room_goto(client_o.roomTarget)
}