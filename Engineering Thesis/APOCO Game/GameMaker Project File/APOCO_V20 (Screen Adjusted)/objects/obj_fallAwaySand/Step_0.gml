/// @description Insert description here
// You can write your code in this editor

//y_speed += fallSpeed;

if (obj_player.x - x > 2800) {
	instance_destroy();
}

if (global.is_paused) {
	image_speed = 0;
}

else if (!global.is_paused) {
	image_speed = 1;
	if place_meeting(x, y-3, obj_player) {
		mustFall = true;
	}

	if (mustFall) {
		if (initialTime > waitTime) {
			test += 1;
			y_speed += fallSpeed;
		}
		else {
			initialTime += 1;
		}
		sprite_index = spr_fallAwaySand_break;
		has_changed = true;
		if(test >= 30) {
			instance_destroy();
		}
	
	}

	y += y_speed;
}