// Decreasing player lives 
if global.lives > 0 && hit == false{
	global.lives -= 1;
	obj_player.y_speed = -6;
	hit = true;
	if (global.level == 1) {
		sprite_index = spr_spikes_jungle_destroyed;
	}
	else if (global.level == 2) {
		sprite_index = spr_spikes_desert_destroyed;
	}
	else if (global.level == 3) {
		sprite_index = spr_spikes_lava_destroyed;
	}
}
else {
	
}

//instance_destroy();
