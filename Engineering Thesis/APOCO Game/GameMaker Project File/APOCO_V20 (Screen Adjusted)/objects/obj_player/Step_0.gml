/// @description Insert description here
// You can write your code in this editor

esc_key = keyboard_check_pressed(vk_escape);


if (global.is_paused || global.tutCompleted) {
	image_speed = 0;
}

else if (!global.is_paused && !global.tutCompleted && global.enter_count > 2) {
	image_speed = 1;

	if (global.controller) {
		right_key = keyboard_check(vk_right);
		left_key = keyboard_check(vk_left);
		up_key = keyboard_check(vk_up);
		down_key = keyboard_check(vk_down);
		jump_key = keyboard_check_pressed(vk_space);
		jump_key_hold = keyboard_check(vk_space);
		attack_key = keyboard_check_pressed(vk_enter);
	}
	
	else {
		right_key = keyboard_check(vk_right);
		left_key = keyboard_check(vk_left);
		up_key = keyboard_check(vk_up);
		down_key = keyboard_check(vk_down);
		jump_key = keyboard_check_pressed(vk_up);
		jump_key_hold = keyboard_check(vk_up);
		attack_key = keyboard_check_pressed(vk_space);
	}
	
	


	isGrounded = place_meeting(x, y+3, obj_wall) || place_meeting(x, y+3, obj_water_outline) ||place_meeting(x, y+3, obj_fallAwaySand) || place_meeting(x, y+3, obj_Moveable_Block) ||place_meeting(x, y+3, obj_endBlock);

	// Horizontal Speed
	x_speed = (right_key - left_key) * move_speed;


	// Jumping
	if isGrounded or global.onVine{
		jumpCount = 0;
		wallJumping = false;
	}

	if jumpCount < 2 and jump_key{
		jumpCount ++;
		y_speed =-jumpHeight;
	}
	// Continous jump
	if isGrounded and jump_key_hold {
		y_speed =-jumpHeight;
		jumpCount = 1;
	}

	// Wall jump
	if ((place_meeting(x + x_speed+3, y, obj_cave_outline) == true || place_meeting(x + x_speed-3, y, obj_cave_outline) == true)) {
	
		// Sliding down wall	
		if (slip_delay < 50 ) {
			y_speed = y_speed/10;
			slip_delay += 1;
			jumpCount = 0;
		}
		
	
		if (jumpCount <=2 && (jump_key || jump_key_hold) && right_key && place_meeting(x + x_speed + 3, y-16, obj_cave_outline) == false) {
			jump_delay = 0;
			slip_delay = 0;
			y_speed =-jumpHeight;
			wallJumping = true;
		}
		else if (jumpCount <=2 && (jump_key || jump_key_hold) && left_key && place_meeting(x + x_speed -3, y-16, obj_cave_outline) == false) {
			jump_delay = 0;
			slip_delay = 0;
			y_speed =-jumpHeight;
			wallJumping = true;
		}
		else {
			wallJumping = false;
		}
		
	}
	if(isGrounded || jump_key) {
		slip_delay = 0;
	}



	// Water
	if global.inWater {
		global.wasInWater = true;
		if waterCount < 4 {
			move_speed = 1;
			grv = 0.25;
			waterCount += 1;
		}
		else {
			if (global.level == 1 || global.level == 0) {
				move_speed = 0.9;
				grv = 0.15;
				y_speed = (down_key - up_key) * move_speed;
			}
			else if (global.level == 2) {
				move_speed = 0.5;
				grv = 0.15;
				y_speed = (down_key - up_key) * move_speed;
			}
			else if (global.level == 3) {
				move_speed = 0.9;
				grv = 0.15;
				y_speed = (down_key - up_key) * move_speed;
				global.lives -= 1;
			}
		}
	}
	else {
		if (global.wasInWater) {
			y_speed =-jumpHeight/1.65;
			global.wasInWater = false;
		}
		else {
	
		}
		grv = 0.2;
		move_speed = 1;
		waterCount = 0;
	}

	// Vines
	if global.onVine {
		grv = 0.2;
	
		y_speed = (down_key - up_key) * move_speed + grv;
	}

	else {
		grv = 0.3;
		y_speed += grv;
	}



	// Collisions
	// Stairs and Walls
	var subpixel = 0.5;
	if (place_meeting(x + x_speed, y, obj_wall) == true){
		if !place_meeting(x+x_speed, y - abs(x_speed) - 1 , obj_wall) {
			while place_meeting(x+x_speed, y, obj_wall) {
				y -= subpixel;
			}
		}
		else {
			x_speed = 0;
		}	
	}
	
	// Fall Away Sand
	if (place_meeting(x + x_speed, y, obj_fallAwaySand) == true){
		x_speed = 0;
	}
	// Moveable Block
	if (place_meeting(x + x_speed , y, obj_Moveable_Block) == true){
		x_speed = 0;
	}

	if (place_meeting(x, y + y_speed, obj_wall) == true || place_meeting(x, y + y_speed, obj_fallAwaySand) == true || place_meeting(x, y + y_speed, obj_Moveable_Block) == true || place_meeting(x, y + y_speed, obj_endBlock) == true){
		y_speed = 0;
	}

	x += x_speed;
	y += y_speed;

	//Setting Sprites
	if keyboard_check(vk_right) > 0 {
		face = RIGHT;
	}
	else if keyboard_check(vk_left) > 0 {
		face = LEFT;
	}
	sprite_index = sprite[face];
	
	// Particles
	if (right_key && isGrounded && x_speed>0) {
		part_particles_create(global.partSystem, x+12, y+32, global.ptBasic, 1);
	}
	else if (left_key && isGrounded && x_speed<0) {
		part_particles_create(global.partSystem, x+20, y+32, global.ptBasic, 1);
	}
	if (y_speed>0 && isGrounded) {
		part_particles_create(global.partSystem, x+12, y+32, global.ptJump, 1);
		part_particles_create(global.partSystem, x+14, y+32, global.ptJump, 1);
		part_particles_create(global.partSystem, x+16, y+32, global.ptJump, 1);
		part_particles_create(global.partSystem, x+18, y+32, global.ptJump, 1);
		part_particles_create(global.partSystem, x+20, y+32, global.ptJump, 1);
	}
	
	// Powerups
	if (jumpHeight == 6) {
		currentDist = x - startDist ;
		if (currentDist > 350) {
			jumpHeight = 5;
		}
	}


	// Death and Respawning
	if global.lives <= 0 {
		respawnLevel();
		instance_destroy();
	
	}
	// Height Check
	if (obj_player.y > 1000) {
		global.lives = 0;
		if (obj_player.x < 1000) {
			obj_game.generateTerrain(global.start_X, global.end_X, 100, 4, 8, 16, 1000, 5);
			obj_game.generateLevelEnd(global.end_X, global.end_X + 800, 228);
		}
	}

	// Off screen Check
	if x < cameraMove.x - 380 {
		global.lives = 0;
	}



	function respawnLevel() {
		
		if (x > global.end_X - 50) {
			instance_create_layer(global.end_X - 50, -100, 1, obj_player);
			instance_destroy(obj_bestX);
			instance_create_layer(x, y, 0, obj_bestX);
			cameraMove.x = 0;
			cameraMove.y = 128;
			global.lives = 4;
			obj_game.generateLevelEnd(global.end_X, global.end_X + 800, 228);
			global.bossHit = false;
		}
		
		else {
			
			if (x > obj_bestX.x) {
				instance_destroy(obj_bestX);
				instance_create_layer(x, y, 0, obj_bestX);
			}
			instance_create_layer(x, y, 0, obj_mockPlayer);
			
			instance_create_layer(global.start_X+100, -100, 1, obj_player);
			cameraMove.x = 0;
			cameraMove.y = 128;
			global.currentScore = 0;
			//global.coins = 0;
			global.lives = 4;
			obj_game.generateLevelEnd(global.end_X, global.end_X + 800, 228);
		
			if (global.level = 0) {
				global.enter_count = 0;
			}
		}
		
	}


	// Continueing Generation	
	if (x > global.end_X + 700){
		if (global.subLevel == 0) {
			global.subLevel = 1;
		}
		else if (global.subLevel == 1) {
			global.subLevel = 2;
		}
		else if (global.subLevel == 2) {
			global.subLevel = 3;
		}
		else if (global.subLevel == 3) {
			global.subLevel = 4;
		}
		if (global.subLevel < 3) {
			global.caveProb += 5;
			global.start_X = global.end_X+800;
			global.end_X = global.end_X + 2800;
			obj_game.generateTerrain(global.start_X, global.end_X, 100, 4, 8, 16, 1000, 5);
			obj_game.generateLevelEnd(global.end_X, global.end_X + 800, 228);
		}
	}
	
	
	if (x > global.end_X && x_speed > 0) {
		// Background
		layer_hspeed("Background", 0.3);
	}
	else if (x > global.end_X && x_speed < 0) {
		// Background
		layer_hspeed("Background", -0.3);
	}
	else  if (x > global.end_X && x_speed == 0){
		// Background
		layer_hspeed("Background", 0);
	}
		
	
	
	


}






// Full Screen
	if esc_key {
		if window_get_fullscreen() {
			window_set_fullscreen(false);
		}
		else {
			window_set_fullscreen(true);
		}
	}