
if (obj_player.x - x > 2800) {
	instance_destroy();
}


if (global.is_paused) {
	image_speed = 0;
}

else if (!global.is_paused) {
	image_speed = 1;
	// Check if the block is on the ground
	isGrounded = place_meeting(x, y + 3, obj_wall) || place_meeting(x, y + 3, obj_fallAwaySand) || place_meeting(x, y + 3, obj_Moveable_Block);

	// Apply gravity
	y_speed += grv;

	// Reset x_speed
	x_speed = 0;

	// Check if the player is pushing the block to the right
	if ((place_meeting(x - 2, y, obj_player) || place_meeting(x - 2, y, obj_Moveable_Block)) && (obj_player.x_speed >= 0 || keyboard_check(vk_right))) {
	    // Initialize a variable to track the movement possibility
	    var can_push = true;
    
	    // Check if all blocks in the line can move to the right
	    var next_x = x;
	    while (place_meeting(next_x + 2, y, obj_Moveable_Block)) {
	        next_x += 2;
	        if (place_meeting(next_x + 2, y, obj_wall) ) {
	            can_push = false; // Stop if there's a wall or another block blocking the way
	            break;
	        }
	    }
    
	    // If all blocks can move, apply movement to all blocks in the line
	    if (can_push) {
			if (obj_player.x_speed == 0) {
				x_speed = 0.1;
			}
			else {
				x_speed = obj_player.x_speed;
			}
	        next_x = x;
	        while (place_meeting(next_x, y, obj_Moveable_Block)) {
	            with (instance_place(next_x, y, obj_Moveable_Block)) {
	                x += x_speed; // Move the block
	            }
	            next_x += 2;
	        }
	    }
	}

	// Check if the player is pushing the block to the left
	if ((place_meeting(x+2, y, obj_player) || place_meeting(x+2, y, obj_Moveable_Block)) && (obj_player.x_speed <= 0 || keyboard_check(vk_left))) {
	    // Initialize a variable to track the movement possibility
	    var can_push = true;
    
	    // Check if all blocks in the line can move to the left
	    var next_x = x;
	    while (place_meeting(next_x - 2, y, obj_Moveable_Block)) {
	        next_x -= 2;
	        if (place_meeting(next_x - 2, y, obj_wall)) {
	            can_push = false; // Stop if there's a wall or another block blocking the way
	            break;
	        }
	    }
    
	    // If all blocks can move, apply movement to all blocks in the line
	    if (can_push) {
	        if (obj_player.x_speed == 0) {
				x_speed = -0.1;
			}
			else {
				x_speed = obj_player.x_speed;
			}
	        next_x = x;
	        while (place_meeting(next_x, y, obj_Moveable_Block)) {
	            with (instance_place(next_x, y, obj_Moveable_Block)) {
	                x += x_speed; // Move the block
	            }
	            next_x -= 2;
	        }
	    }
	}

	// Stop the block from moving if it hits a wall
	if (place_meeting(x + 1, y, obj_wall) || place_meeting(x - 1, y, obj_wall)) {
	    x_speed = 0;
	}

	// Check for vertical collisions (e.g., falling onto walls or other blocks)
	if (place_meeting(x, y + y_speed, obj_wall) || place_meeting(x, y + y_speed, obj_fallAwaySand) || place_meeting(x, y + y_speed, obj_Moveable_Block)) {
	    y_speed = 0;
	}

	if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_Moveable_Block)) {
	
		y_speed = -3;
	
	}

	// Apply movement to this block
	x += x_speed;
	y += y_speed;
}
