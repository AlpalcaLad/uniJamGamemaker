var xSpawn=x
var ySpawn=y
var chainLengthMax = chainLength
steepness=5
bias=-1
chainLength--;
var newTerrain = instance_create_layer(xSpawn,ySpawn,layer,terrainLBorderGenerator_o)
xSpawn=newTerrain.finalCoord[0]+16
ySpawn=newTerrain.finalCoord[1]
while chainLength>0{
	chainLength--
	newTerrain = instance_create_layer(xSpawn,ySpawn,layer,terrainGenerator_o)
	xSpawn=newTerrain.finalCoord[0]+16
	ySpawn=newTerrain.finalCoord[1]
}
newTerrain = instance_create_layer(xSpawn,ySpawn,layer,terrainRBorderGenerator_o)
bias=1
with enemy_o{
	while place_meeting(x,y,solid_o) y--
}
instance_destroy()

/*
for 0..n: i
start at x
end at y
with smooth valley inbetween

start-abs(i-x)
upwardsTendancy

*/