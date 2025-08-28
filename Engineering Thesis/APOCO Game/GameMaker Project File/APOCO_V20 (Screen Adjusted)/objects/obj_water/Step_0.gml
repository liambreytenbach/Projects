/// @description Insert description here
// You can write your code in this editor

global.inWater = false;

if (obj_player.x - x > 2800) {
	instance_destroy();
}

if (global.is_paused || global.tutCompleted) {
	image_speed = 0;
}

else if (!global.is_paused && !global.tutCompleted) {
	image_speed = 1;
}

