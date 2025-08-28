// Destroy if player dies
//if global.lives <= 0 {
//	instance_destroy();
//}

if (global.is_paused || global.tutCompleted) {
	image_speed = 0;
}

else if (!global.is_paused && !global.tutCompleted) {
	image_speed = 1;
}