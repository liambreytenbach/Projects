/// @description Insert description here
// You can write your code in this editor


if (global.levelComplete) {
	
	
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
		
	
	
    draw_sprite(spr_pauseMenu_backiground, 0, display_get_gui_width()/2, display_get_gui_height()/2);
	draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
	loading_frame += 0.2;
	
	var levelText = "";
	// Drawing END LEVEL Text
	if (global.level == 1) {
		levelText = "JUNGLE ";
	}
	else if (global.level == 2) {
		levelText = "DESERT ";
	}
	if (global.level == 3) {
		levelText = "VOLCANO ";
	}
		
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2-160, string(levelText) + string("LEVEL COMPLETE!"));
	// Drawing Menu Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+82, string("MENU"));
	//// Drawing Restart Text
	//draw_set_colour(c_white);
	//draw_set_halign(fa_center);
	//draw_text(display_get_gui_width()/2, display_get_gui_height()/2+82, string("RESTART"));
	//// Drawing Restart Text
	//draw_set_colour(c_white);
	//draw_set_halign(fa_center);
	//draw_text(display_get_gui_width()/2, display_get_gui_height()/2+154, string("RESUME"));
	
	// Draw Selected Option
	height = 82;
	draw_sprite(spr_pause_select, 0, display_get_gui_width()/2, display_get_gui_height()/2 + height + 24);
	
	
	// Selecting Options
	if (enter_key) {
		switch(height) {
			case 82 : 
				global.lives = 0;
				global.start_X = 0;
				global.end_X = 2000;
				obj_game.generateTerrain(global.start_X, global.end_X, 100, 4, 8, 16, 1000, 5);
				obj_game.generateLevelEnd(global.end_X, global.end_X + 800, 228);
				room_goto(Start_Room);
				break;	
		}
	}
} 




