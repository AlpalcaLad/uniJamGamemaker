existedFor=0
if instance_number(client_o)>1 instance_destroy()
else instance_create_layer(x,y,layer,musicManager_o)
w=window_get_width()
h=window_get_height()
time_speed=1
//window_set_size(display_get_width(),display_get_height())
//window_set_position(0,0)
afterImageFreq=20
afterImageDl=0
time_speed_targ=1
//window_set_cursor(cr_none);
freezeTime=0
freezeGameSpeed=0.1
blockCamera=true
pause=false
music=true
clickAllowed=false

//upgrades
playerHealth=3
playerDamage=1
playerDrawMult=0.75
swordSpeedMult=1
deflectedSwordsHome=0

endRoom=room
roomChanging=false
fadeObj=noone
roomTarget=room

money=0
shopButtons = [ //string,variablename,increase,cost,costIncrease,maxCost
	["Extra Heart ","playerHealth",1,5,10,50],
	["+25% damage ","playerDamage",0.25,15,15,60],
	["+50% swap speed ","playerDrawMult",0.5,25,25,75],
	["+25% attack speed ", "swordSpeedMult",0.25,10,10,30],
	["Parried knives track ","deflectedSwordsHome",20,20,999,50],
]

pauseButtons = [
	"Toggle Music",
	"Back to Lobby",
	"Exit Game"
]