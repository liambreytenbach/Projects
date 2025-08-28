/// @description Insert description here
// You can write your code in this editor


if !(instance_position(x +17, y, obj_water) || instance_position(x +17, y-16, obj_water) || instance_position(x +17, y+16, obj_water) || instance_position(x -17, y, obj_water) || instance_position(x -17, y-16, obj_water) || instance_position(x -17, y+16, obj_water)){
	if (sprite_index == spr_dirt) {
		sprite_index = spr_dirtBreak;
	}
	else if (sprite_index == spr_stone){
		sprite_index = spr_stoneBreak;
	}
	
	image_speed = 1;
}