

		// Gravity
		if (!place_meeting(x, y + 1, obj_wall)) {
		    y_speed += grv;
		} else {
		    y_speed = 0; 
		}
		
		y += y_speed;

		