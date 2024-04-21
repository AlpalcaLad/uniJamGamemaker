x=floor(x/16)*16
y=floor(y/16)*16
randomise()
var tile_layer=layer_get_id("floorTiles")
var tilemap_id=layer_tilemap_get_id(tile_layer)
var decor_layer=layer_get_id("decorTiles")
var decor_id=layer_tilemap_get_id(decor_layer)
var building_layer=layer_get_id("wallTiles")
var building_id=layer_tilemap_get_id(building_layer)

//tilemapInfo
surfaceTileIndex=3
underneathTileIndex=1

if instance_exists(chainIslandGenerator1_o){steepness=floor(chainIslandGenerator1_o.steepness)}

var xInit=x
var real_island_size=irandom_range(island_width/2,island_width)-3
var surface_points=[]
var last_y=16*floor(y/16)
var newY
var depthOfPoint = 45
for (var i=0; i<real_island_size-1; i++){
	var direc = 1
	newY=clamp(last_y - tile_size*steepness,16*floor(y/16)-3*steepness*tile_size,16*floor(y/16))
	last_y=newY
	array_push(surface_points,[x,newY,depthOfPoint])
	x += tile_size
}
for (var i=0; i<12; i++){
	array_push(surface_points,[x,last_y,depthOfPoint])
	x += tile_size
}
array_push(surface_points,[x,16*floor(y/16),depthOfPoint])
last_y=surface_points[0][1]
var surface_point_num=array_length(surface_points)
var island_center = random_range(surface_point_num/4, surface_point_num*3/4)
var new_y
var max_y=last_y
for (var i=0; i<surface_point_num; i++){
	new_y=surface_points[i][1]
	depthOfPoint=surface_points[i][2]
	for (var j=0; j<depthOfPoint; j++){
		tilemap_set_at_pixel(tilemap_id,underneathTileIndex,surface_points[i][0],new_y+tile_size*j)
		instance_create_layer(surface_points[i][0]+tile_size/2,new_y+tile_size*j+tile_size/2,"walls",solidWall_o)
	}
	tilemap_set_at_pixel(tilemap_id,surfaceTileIndex,surface_points[i][0],new_y)
	instance_create_layer(surface_points[i][0]+tile_size/2,new_y+tile_size/2,"walls",solidWall_o)
	last_y=new_y
	if max_y<last_y max_y=last_y
}

finalCoord=surface_points[array_length(surface_points)-1]