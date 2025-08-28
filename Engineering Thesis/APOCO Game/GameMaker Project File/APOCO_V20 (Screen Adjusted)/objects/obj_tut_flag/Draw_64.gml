/// @description Insert description here
// You can write your code in this editor



if (!global.loadingScreen) {
	if (global.tutCompleted) {
		draw_sprite(spr_pauseMenu_backiground, 0, display_get_gui_width()/2, display_get_gui_height()/2);
		draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
		loading_frame += 0.2;
	
		// Drawing Pause Text
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-160, string("TUTORIAL COMPLETED"));
		// Drawing Menu Text
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2+10, string("MENU"));
		// Drawing Restart Text
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2+82, string("RESTART"));
	
		// Draw Selected Option
		draw_sprite(spr_pause_select, 0, display_get_gui_width()/2, display_get_gui_height()/2 + height + 24);
		if (up_key) {
			//audio_play_sound(selectSound, 1, false);
			if height == 82 {
				height = 10;
			}
			else if (height == 10) {
				height = 82;
			}
		}
		if (down_key) {
			//audio_play_sound(selectSound, 1, false);
			if height == 10 {
				height = 82;
			}
			else if (height == 82) {
				height = 10;
			}
		}
	
		// Selecting Options
		if (enter_key) {
			switch(height) {
				case 154 : 
					//global.is_paused = false;
					//audio_play_sound(selectSound, 1, false);
					break;
				case 82 : 
					//audio_play_sound(selectSound, 1, false);
					global.lives = 0;
					global.is_paused = false;
					global.tutCompleted = false;
					break;
				case 10 : 
					//audio_play_sound(selectSound, 1, false);
					global.tutCompleted = true;
					room_goto(Start_Room);
					break;	
			}
		}
	}

	if (enter_key && global.enter_count >= 0) {
		//audio_play_sound(selectSound, 1, false);
		global.enter_count += 1;
	}
	
	
	
	if (global.enter_count == -1 && obj_player.x < 250) {
		//audio_play_sound(selectSound, 1, false);
		draw_sprite(spr_pauseMenu_backiground, 0, display_get_gui_width()/2, display_get_gui_height()/2);
		draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
		loading_frame += 0.2;
	
		// Drawing Tutorial Instructions
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-210, string("WHICH ARE YOU USING?"));
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-165, string("USE THE ARROWS & SELECT WITH ENTER"));
		// Drawing KEYBOARD Text
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2 -273, display_get_gui_height()/2-20, string("KEYBOARD"));
		// Drawing KEYBOARD Text
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2 +273, display_get_gui_height()/2-20, string("CONTROLLER"));
		
		// Draw Controls
		draw_sprite_ext(spr_keyboard, 0, display_get_gui_width()/2 - 273, display_get_gui_height()/2 +100, 4, 4, 0, c_white, 100 );
		draw_sprite_ext(spr_controller, 0, display_get_gui_width()/2 + 273, display_get_gui_height()/2 +100 , 4, 4, 0, c_white, 100 );
	
		
		// Draw Selected Option
		draw_sprite_ext(spr_pause_select, 0, heightX, heightY, 1.2, 1.2, 0, c_white, 100);
		if (right_key) {
			//audio_play_sound(selectSound, 1, false);
			heightX = display_get_gui_width()/2 + 273;
			heightY = display_get_gui_height()/2 +3;
		}
		if (left_key) {
			//audio_play_sound(selectSound, 1, false);
			heightX = display_get_gui_width()/2 - 273;
			heightY = display_get_gui_height()/2+3;
		}
		
		if (enter_key) {
			//audio_play_sound(selectSound, 1, false);
			if (heightX == display_get_gui_width()/2 + 273) {
				global.keyboard = false;
				global.controller = true;
				global.enter_count = 0;
			}
			else if (heightX == display_get_gui_width()/2 - 273){
				global.keyboard = true;
				global.controller = false;
				global.enter_count = 0;
			}
		}
	
	}
	
	


	if (global.enter_count == 0 && obj_player.x < 250) {
		draw_sprite(spr_pauseMenu_backiground, 0, display_get_gui_width()/2, display_get_gui_height()/2);
		draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
		loading_frame += 0.2;
	
		// Drawing Tutorial Instructions
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-210, string("CONTROLS"));
		
		if (global.controller) {
			
			// Drawing Up Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -273, display_get_gui_height()/2-130, string("UP"));
			// Drawing Down Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -275, display_get_gui_height()/2+75, string("DOWN"));
			// Drawing Right Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -146, display_get_gui_height()/2-70, string("RIGHT"));
			// Drawing Left Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -395, display_get_gui_height()/2-70, string("LEFT"));
	
			// Draw Controls
			draw_sprite_ext(spr_joystick, 0, display_get_gui_width()/2 - 275, display_get_gui_height()/2, 5, 5, 0, c_white, 100 );
	
	
			// Drawing Instruction Text
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-150, string("JOYSTICK"));
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-120, string("USE THE JOYSTICK TO MOVE IN WATER"));
			//
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-60, string("UP & DOWN TO MOVE ON VINES. "));
			//
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2, string("RIGHT TO MOVE FORWARDS. "));
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2+60, string("LEFT TO MOVE BACKWARDS. "));
	
			draw_set_font(fnt_gameFont);
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2+140, string("PRESS ENTER TO PROCEED"));
			
		}
		
		else {
			// Drawing Up Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -273, display_get_gui_height()/2-160, string("UP"));
			// Drawing Down Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -275, display_get_gui_height()/2+115, string("DOWN"));
			// Drawing Right Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -116, display_get_gui_height()/2-20, string("RIGHT"));
			// Drawing Left Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -425, display_get_gui_height()/2-20, string("LEFT"));
	
			// Draw Controls
			draw_sprite_ext(spr_arrow_right, 0, display_get_gui_width()/2 + 64-275, display_get_gui_height()/2, 2, 2, 0, c_white, 100 );
			draw_sprite_ext(spr_arrow_left, 0, display_get_gui_width()/2 - 64-275, display_get_gui_height()/2 , 2, 2, 0, c_white, 100 );
			draw_sprite_ext(spr_arrow_up, 0, display_get_gui_width()/2-275, display_get_gui_height()/2 - 64 , 2, 2, 0, c_white, 100 );
			draw_sprite_ext(spr_arrow_down, 0, display_get_gui_width()/2-275, display_get_gui_height()/2 + 64 , 2, 2, 0, c_white, 100 );
	
	
			// Drawing Instruction Text
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-150, string("UP ARROW TO JUMP. "));
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-120, string("SPACE BAR TO ATTACK ENEMIES!"));
			//
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-60, string("UP & DOWN ARROW TO MOVE ON VINES. "));
			//
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2, string("RIGHT ARROW TO MOVE FORWARDS. "));
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2+60, string("LEFT ARROW TO MOVE BACKWARDS. "));
	
			draw_set_font(fnt_gameFont);
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2+140, string("PRESS ENTER TO PROCEED"));
		}
		
	}

	else if (global.enter_count == 1 && obj_player.x < 250) {
		draw_sprite(spr_pauseMenu_backiground, 0, display_get_gui_width()/2, display_get_gui_height()/2);
		draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
		loading_frame += 0.2;
	
		// Drawing Tutorial Instructions
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-210, string("CONTROLS"));
		
		if (global.controller) {
			
			// Drawing Up Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -223, display_get_gui_height()/2-130, string("PAUSE"));
			// Drawing Down Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -255, display_get_gui_height()/2+70, string("JUMP"));
			// Drawing Right Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -130, display_get_gui_height()/2-20, string("ATTACK"));
			// Drawing Left Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -355, display_get_gui_height()/2+70, string("ESC"));
	
			// Draw Controls
			draw_sprite_ext(spr_buttons, 0, display_get_gui_width()/2 - 275, display_get_gui_height()/2, 5, 5, 0, c_white, 100 );
	
	
			// Drawing Instruction Text
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-150, string("BUTTONS"));
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-120, string("ESC TO EXIT FULL SCREEN"));
			//
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-60, string("PAUSE TO STOP THE GAME"));
			//
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2, string("JUMP IS ALSO ENTER "));
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2+60, string("ATTACK ENEMIES WITH WEAPONS"));
	
			draw_set_font(fnt_gameFont);
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2+140, string("PRESS ENTER TO PROCEED"));
		}
		
		
		
		else {
			// Drawing Up Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -273, display_get_gui_height()/2-160, string("UP"));
			// Drawing Down Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -275, display_get_gui_height()/2+115, string("DOWN"));
			// Drawing Right Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -116, display_get_gui_height()/2-20, string("RIGHT"));
			// Drawing Left Text
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2 -425, display_get_gui_height()/2-20, string("LEFT"));
	
			// Draw Controls
			draw_sprite_ext(spr_arrow_right, 0, display_get_gui_width()/2 + 64-275, display_get_gui_height()/2, 2, 2, 0, c_white, 100 );
			draw_sprite_ext(spr_arrow_left, 0, display_get_gui_width()/2 - 64-275, display_get_gui_height()/2 , 2, 2, 0, c_white, 100 );
			draw_sprite_ext(spr_arrow_up, 0, display_get_gui_width()/2-275, display_get_gui_height()/2 - 64 , 2, 2, 0, c_white, 100 );
			draw_sprite_ext(spr_arrow_down, 0, display_get_gui_width()/2-275, display_get_gui_height()/2 + 64 , 2, 2, 0, c_white, 100 );
	
	
			// Drawing Instruction Text
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_set_font(fnt_gameFont_1);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-150, string("YOU CAN NAVIGATE THROUGH MENUS WITH THE "));
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-120, string("ARROW KEYS & SELECT AN OPTION WITH ENTER"));
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2-60, string("PRESS THE LETTER 'P' TO PAUSE"));
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2, string("PRESS 'ESC' TO EXIT FULL SCREEN"));
	
			draw_set_font(fnt_gameFont);
			draw_set_colour(c_white);
			draw_set_halign(fa_left);
			draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2+140, string("PRESS ENTER TO PROCEED"));
		}
	
	}
	
	if (obj_player.x > 280 && obj_player.x < 1570) {
		draw_sprite_ext(spr_pauseMenu_backiground, 0, display_get_gui_width()/2, display_get_gui_height()/2 - display_get_gui_height()/3, 0.3, 0.3, 0, c_white, 100);
	}
	

	if (obj_player.x > 280 && obj_player.x < 330) {
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-20, string("JUMP!"));
	}

	if (obj_player.x > 330 && obj_player.x < 410) {
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-20, string("DOUBLE JUMP!"));
	}

	if (obj_player.x > 410 && obj_player.x < 550) {
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-65, string("GO FOR A SWIM!"));
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-25, string("HOLD THE UP ARROW"));
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3+15, string("TO FLOAT!"));
	}

	if (obj_player.x > 550 && obj_player.x < 750) {
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-20, string("CLIMB UP THE VINE!"));
	}

	if (obj_player.x > 750 && obj_player.x < 1000) {
		if (obj_player.y > 220) {
			if (global.controller) {
				draw_set_font(fnt_gameFont);
				draw_set_colour(c_white);
				draw_set_halign(fa_center);
				draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-65, string("USE THE WALLS!"));
				draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-25, string("JUMP & USE THE"));
				draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3+15, string("LEFT & RIGHT JOYSTICK!"));
				
				draw_sprite_ext(spr_joystick_cave, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-230, 3, 3, 0, c_white, 100);
				loading_frame += 0.05;
			}
			else {
				draw_set_font(fnt_gameFont);
				draw_set_colour(c_white);
				draw_set_halign(fa_center);
				draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-65, string("USE THE WALLS!"));
				draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-25, string("JUMP & USE THE"));
				draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3+15, string("LEFT & RIGHT ARROWS!"));
			
				draw_sprite_ext(spr_keyboard_cave, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-230, 3, 3, 0, c_white, 100);
				loading_frame += 0.05;
			}
		}
		else if (obj_player.x < 950) {
			draw_set_font(fnt_gameFont);
			draw_set_colour(c_white);
			draw_set_halign(fa_center);
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-20, string("GO IN THE CAVE!"));
		}
	}
	if (obj_player.x > 1000 && obj_player.x < 1220) {
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-20, string("PUSH THAT BLOCK!"));
	}
	if (obj_player.x > 1220 && obj_player.x < 1425) {
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-65, string("KILL THE ENEMY USING"));
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-25, string("THE SPACE BAR!"));
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3+15, string("DON'T TOUCH IT!"));
	}
	
	if (obj_player.x > 1425 && obj_player.x < 1570) {
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2- display_get_gui_height()/3-20, string("FINISH THE TUTORIAL!"));
	}
	
	else if (global.enter_count == 2 && obj_player.x < 250) {
		draw_sprite(spr_pauseMenu_backiground, 0, display_get_gui_width()/2, display_get_gui_height()/2);
		draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
		loading_frame += 0.2;
	
		// Drawing Tutorial
		draw_set_font(fnt_gameFont_2);
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-220, string("TUTORIAL"));
		
	
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_white);
		draw_set_halign(fa_left);
		draw_text(display_get_gui_width()/2 + 125, display_get_gui_height()/2+140, string("PRESS ENTER TO PROCEED"));
	
	}
}

	

else {
	// Background
	draw_sprite_ext(spr_level_background_colour, 0, display_get_gui_width()/2, display_get_gui_height()/2, 6, 6, 0, 100, 100);
	//draw_sprite_ext(spr_lava_title, vine2, display_get_gui_width()/2, display_get_gui_height()/2-display_get_gui_height()/8, 6, 6, 0, c_white, 100);
	draw_sprite_ext(spr_lava_title, vine2, display_get_gui_width()/2+display_get_gui_height()/1.9, display_get_gui_height()/2-display_get_gui_height()/4.1, 2, 2, 0, c_white, 100);
	draw_sprite_ext(spr_lava_title, vine1, display_get_gui_width()/2+display_get_gui_height()/1.95, display_get_gui_height()/2-display_get_gui_height()/4.1, 2, 2, 0, c_white, 100);
	draw_sprite_ext(spr_lava_title, vine1, display_get_gui_width()/2+display_get_gui_height()/3.2, display_get_gui_height()/2-display_get_gui_height()/4.1, 2, 2, 0, c_white, 100);
	// TERRAIN
	draw_sprite_ext(spr_jungle_icon, 0, display_get_gui_width()/2-display_get_gui_height()/5, display_get_gui_height()/2-display_get_gui_height()/2.4, 6, 6, -10, c_white, 100);
	draw_sprite_ext(spr_jungle_icon, 0, display_get_gui_width()/2-display_get_gui_height()/2.2, display_get_gui_height()/2-display_get_gui_height()/2.8, 4, 4, 10, c_white, 100);
	draw_sprite_ext(spr_volcano_icon, 0, display_get_gui_width()/2+display_get_gui_height()/1.9, display_get_gui_height()/2-display_get_gui_height()/2.5, 5, 5, -2, c_white, 100);
	draw_sprite_ext(spr_volcano_icon, 0, display_get_gui_width()/2+display_get_gui_height()/2.2, display_get_gui_height()/2-display_get_gui_height()/2.45, 6, 6, 2, c_white, 100);
	//draw_sprite_ext(spr_desert_icon, 0, display_get_gui_width()/2-display_get_gui_height()/1.6, display_get_gui_height()/2-display_get_gui_height()/7.5, 4, 4, 4, c_white, 100);
	// Clouds
	draw_sprite_ext(spr_title_cloud_1, cloud1, display_get_gui_width()/2+display_get_gui_height()/4, display_get_gui_height()/2-display_get_gui_height()/2-display_get_gui_height()/6, 0.4, 0.4, 0, c_white, 100);	
	draw_sprite_ext(spr_title_cloud_1, cloud2, display_get_gui_width()/2+display_get_gui_height()/8, display_get_gui_height()/2-display_get_gui_height()/2, 0.4, 0.4, 0, c_white, 100);
	draw_sprite_ext(spr_vine, vine2, display_get_gui_width()/2-display_get_gui_height()/1.3, display_get_gui_height()/2-display_get_gui_height()/20, 3, 3, 0, c_white, 100);
	draw_sprite_ext(spr_vine, vine3, display_get_gui_width()/2-display_get_gui_height()/2, display_get_gui_height()/2-display_get_gui_height()/10, 3, 3, 0, c_white, 100);
	draw_sprite_ext(spr_title_cloud_1, cloud2, display_get_gui_width()/2-display_get_gui_height()/2-display_get_gui_height()/4, display_get_gui_height()/2-display_get_gui_height()/2.2, 0.4, 0.4, 0, c_white, 100);
	draw_sprite_ext(spr_vine, vine1, display_get_gui_width()/2-display_get_gui_height()/1.6, display_get_gui_height()/2-display_get_gui_height()/3.8, 3, 3, 0, c_white, 100);
	draw_sprite_ext(spr_title_cloud_1, cloud3, display_get_gui_width()/2-display_get_gui_height()/1.8, display_get_gui_height()/2-display_get_gui_height()/2-display_get_gui_height()/7, 0.4, 0.4, 0, c_white, 100);
	draw_sprite_ext(spr_title_cloud_1, cloud1, display_get_gui_width()/2-display_get_gui_height()/4, display_get_gui_height()/2-display_get_gui_height()/8, 0.4, 0.4, 0, c_white, 100);
	
	
	cloud1 += 0.2;
	cloud2 += 0.17;
	cloud3 += 0.22;
	vine1 += 0.08;
	vine2 += 0.06;
	vine3 += 0.07;
	//Title
	draw_sprite_ext(spr_Title, 0, display_get_gui_width()/2, display_get_gui_height()/2-display_get_gui_height()/6, 20, 20, 0, c_white, 100);
	
	if (loading_game_frame < 30) {		
		draw_sprite_ext(spr_loading_game, loading_game_frame, display_get_gui_width()/2, display_get_gui_height()/2+display_get_gui_height()/4+50, 5, 5, 0, c_white, 100);
		loading_game_frame += 0.2;
	}
	else {
		draw_set_font(fnt_gameFont);
		draw_set_colour(c_black);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2+display_get_gui_height()/4+20, string("ENTER TO PLAY"));
		if (enter_key) {
			//audio_play_sound(selectSound, 1, false);
			global.loadingScreen = false;
		}
	}
	
}