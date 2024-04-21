islandType=choose_weight(["roof",4,"noroof",8,"doubleroof",6])

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

var xInit=x
var real_island_size=irandom_range(island_width/2,island_width)
var surface_points=[]
var last_y=16*floor(y/16)
var newY
var depthOfPoint
for (var i=0; i<real_island_size; i++){
	var direc = irandom_range(0,1)*2-1
	newY=last_y + 16*floor(random_range(0,heightVariation1)/heightVariation2)*direc*(i<real_island_size-2)
	depthOfPoint=10
	last_y=newY
	array_push(surface_points,[x,newY,depthOfPoint])
	x += tile_size
}
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
	if irandom(enemyChance)==1{
		var en=instance_create_layer(
			surface_points[i][0],
			new_y-32,
			"enemies",
			choose_weight([archer_o,4,stabber_o,4])
		)
	}
	tilemap_set_at_pixel(tilemap_id,surfaceTileIndex,surface_points[i][0],new_y)
	instance_create_layer(surface_points[i][0]+tile_size/2,new_y+tile_size/2,"walls",solidWall_o)
	if (forceSpawnerGen and (instance_number(object_index)%2==0)) and surface_points[i][0]<room_width and i==round((surface_point_num-1)/2){
		instance_create_layer(surface_points[i][0]+tile_size/2,min(new_y,last_y)-tile_size/2,"enemies",waveSpawner_o)
	}
	last_y=new_y
	if max_y<last_y max_y=last_y
}

finalCoord=surface_points[array_length(surface_points)-1]

if islandType=="roof"{
	var roofheight=5
	var hasSpawner=(irandom_range(0,10)>5)
	for (var i=1; i<surface_point_num-1; i++){
		instance_create_layer(surface_points[i][0]+tile_size/2,max_y-tile_size*roofheight+tile_size/2,"walls",solidWall_o)
		tilemap_set_at_pixel(building_id,3,surface_points[i][0],max_y-tile_size*roofheight)
		if i>1 and i<surface_point_num-2{
			for (var j=1; j<((surface_points[i][1])-(max_y-roofheight*tile_size))/16; j++){
				if tilemap_get_at_pixel(building_id,surface_points[i][0],max_y-tile_size*roofheight+j*tile_size)==0{
					tilemap_set_at_pixel(building_id,11,surface_points[i][0],max_y-tile_size*roofheight+j*tile_size)
				}
			}
		}
	}
}
if islandType=="doubleroof"{
	var roofheight=5
	var secondroofheight=8
	for (var i=1; i<surface_point_num-1; i++){
		instance_create_layer(surface_points[i][0]+tile_size/2,max_y-tile_size*roofheight+tile_size/2,"walls",solidWall_o)
		tilemap_set_at_pixel(building_id,3,surface_points[i][0],max_y-tile_size*roofheight)
		
		if i>1 and i<surface_point_num-2{
			for (var j=1; j<((surface_points[i][1])-(max_y-roofheight*tile_size))/16; j++){
				if tilemap_get_at_pixel(building_id,surface_points[i][0],max_y-tile_size*roofheight+j*tile_size)==0{
					tilemap_set_at_pixel(building_id,11,surface_points[i][0],max_y-tile_size*roofheight+j*tile_size)
				}
			}
			
			instance_create_layer(surface_points[i][0]+tile_size/2,max_y-tile_size*secondroofheight+tile_size/2,"walls",solidWall_o)
			tilemap_set_at_pixel(building_id,3,surface_points[i][0],max_y-tile_size*secondroofheight)
			if i>2 and i<surface_point_num-3{
				for (var j=1; j< secondroofheight-roofheight; j++){
					if tilemap_get_at_pixel(building_id,surface_points[i][0],max_y-tile_size*secondroofheight+j*tile_size)==0{
						tilemap_set_at_pixel(building_id,11,surface_points[i][0],max_y-tile_size*secondroofheight+j*tile_size)
					}
				}
			}
		}
	}
}
