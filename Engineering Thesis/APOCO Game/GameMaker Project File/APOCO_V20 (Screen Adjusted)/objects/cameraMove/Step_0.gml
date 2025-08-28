// Invisible object being tracked by camera
if (!global.is_paused && global.enter_count > 2) {
	x += cameraMoveSpeed;

	if (obj_player.x > x  || obj_player.x > global.end_X){
		x = obj_player.x;
		// Background
		layer_hspeed("Background", 0.5);
	}
	else {
		// Background
		layer_hspeed("Background", 0.3);
	}

	if obj_player.y > y {
		y = obj_player.y;
	}
	if obj_player.y < y {
		y = obj_player.y;
	}
	
	if (obj_player.x > global.end_X || (x < global.start_X + 320 && global.subLevel == 0)) {
		// Background
		layer_hspeed("Background", 0);
	}
	
	
}
else {
	// Background
	layer_hspeed("Background", 0);
}

if (global.level == 0) {
	cameraMoveSpeed = 0;
	// Background
	layer_hspeed("Background", 0);
}
else {
	cameraMoveSpeed = 0.5;
}

	

if (obj_player.x > x  || obj_player.x > global.end_X){
	x = obj_player.x;
}
if obj_player.y > y {
	y = obj_player.y;
}
if obj_player.y < y {
	y = obj_player.y;
}
