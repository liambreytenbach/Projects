/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

if (global.lives == 0) {
	instance_destroy();
}



x = obj_player.x;
y = obj_player.y;

if (obj_player.attack_key) {
	sprite_index = spr_forceField;
	image_speed = 1;
	finishedAnimating = false;
}


depth = -1;