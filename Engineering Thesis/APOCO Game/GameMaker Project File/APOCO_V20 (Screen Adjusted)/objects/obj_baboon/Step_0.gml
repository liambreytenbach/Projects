
if (global.is_paused) {
	image_speed = 0;
}

else if (!global.is_paused) {
	
	image_speed = 1;
	
	if (animation < 5) {
		
		spawn_timer = 60*2.6;
		barrelCount = 0;
		
		image_speed = 1;
		// Horizontal movement
		x_speed = move_speed;

		// Gravity
		if (!place_meeting(x, y + 1, obj_wall)) {
		    y_speed += grv;
		} else {
		    y_speed = 0; 
		}

		// Check for walls or edges to turn around
		if (place_meeting(x + x_speed, y-2, obj_Moveable_Block) || !place_meeting(x + x_speed, y + 16, obj_wall) || place_meeting(x + x_speed, y + 16, obj_checkPoint_Down)) {
		    move_speed *= -1; // Reverse direction
		}

		// Jumping
		if (place_meeting(x + x_speed, y-2, obj_wall)) {
			y_speed = -1;
		}
	

		// Sprites
		if (x_speed >= 0.1 && !injured) {
			sprite_index = spr_baboon_right_walk;
		}
		if x_speed < -0.1 {
			sprite_index = spr_baboon_left_walk;
		}

		// Apply movement
		x += x_speed;
		y += y_speed;
	}
	
	else if (animation == 5) {
		sprite_index = spr_baboon_left_all;
		// Apply movement
		x += 0;
		y += 0;
		
		if (spawn_timer == 0) {
			var barrel = instance_create_layer(x, y, 0, obj_barrel);
			
			
			if (barrelCount == 0) {
				spawn_timer = 60*0.8;
			}
			else if (barrelCount == 1) {
				spawn_timer = 60*1.9;
			}
			barrelCount += 1;
				
		}
		
		spawn_timer -= 1;
		
	}
	else {
		sprite_index = spr_baboon_left_attack;
	}
	
}
