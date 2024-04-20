var poofNum = 20
var spriteWidth = bbox_right-bbox_left
var spriteHeight = bbox_bottom-bbox_top
for (var i=0; i<poofNum; i++){
	instance_create_layer(x+random_range(-spriteWidth/2,spriteWidth/2), random_range(bbox_bottom-spriteHeight,bbox_bottom),layer,poof_o).image_speed=1
}