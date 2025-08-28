
if (global.is_paused) {
	image_speed = 0;
}

else if (!global.is_paused) {
	image_speed = 1;
	global.onVine = false;
}

if (obj_player.x - x > 2800) {
	instance_destroy();
}