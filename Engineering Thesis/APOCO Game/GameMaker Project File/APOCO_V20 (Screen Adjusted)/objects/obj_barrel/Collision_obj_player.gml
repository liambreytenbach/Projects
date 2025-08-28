/// @description Insert description here
// You can write your code in this editor


// Decreasing player lives 
if global.lives > 0 && hit == false{
	global.bossHit = true;
	global.lives -= 1;
	obj_player.y_speed = -6;
	hit = true;
	var barrelBreak = instance_create_layer(obj_player.x, obj_player.y, 0, obj_barrelBreak);
	instance_destroy();
}