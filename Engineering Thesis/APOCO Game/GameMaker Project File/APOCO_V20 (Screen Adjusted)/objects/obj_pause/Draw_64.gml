/// @description Insert description here
// You can write your code in this editor


if (global.is_paused) {
    draw_sprite(spr_pauseMenu_backiground, 0, display_get_gui_width()/2, display_get_gui_height()/2);
	draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
	loading_frame += 0.2;
	
	// Drawing Pause Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2-160, string("PAUSED"));
	// Drawing Menu Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+10, string("MENU"));
	// Drawing Restart Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+82, string("RESTART"));
	// Drawing Restart Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+154, string("RESUME"));
	
	// Draw Selected Option
	draw_sprite(spr_pause_select, 0, display_get_gui_width()/2, display_get_gui_height()/2 + height + 24);
	if (up_key) {
		audio_play_sound(selectSound, 1, false);
		if height > 10 {
			height -= 72;
		}
		else {
			height = 154;
		}
	}
	if (down_key) {
		audio_play_sound(selectSound, 1, false);
		if height < 154 {
			height += 72;
		}
		else {
			height = 10;
		}
	}
	
	// Selecting Options
	if (enter_key) {
		//audio_play_sound(selectSound, 1, false);
		switch(height) {
			case 154 : 
				global.is_paused = false;
				break;
			case 82 : 
				global.lives = 0;
				global.is_paused = false;
				room_goto(Room1);
				break;
			case 10 : 
				room_goto(Start_Room);
				break;	
		}
	}
} 




