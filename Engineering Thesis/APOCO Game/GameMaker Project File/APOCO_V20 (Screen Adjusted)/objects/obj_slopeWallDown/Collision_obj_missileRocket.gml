/// @description Insert description here
// You can write your code in this editor

if !(instance_position(x +17, y, obj_water) || instance_position(x +17, y-16, obj_water) || instance_position(x +17, y+16, obj_water) || instance_position(x -17, y, obj_water) || instance_position(x -17, y-16, obj_water) || instance_position(x -17, y+16, obj_water)){
	instance_destroy();
}