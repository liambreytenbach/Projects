/// @description Insert description here
// You can write your code in this editor

if (obj_mainMenu.levelMenu == true) {
	// Drawing Back Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);

	var L = "";
	

	if (global.level == 0) {
		L = string("BACK");
	}

	else if (global.level == 1) {
		L = string("JUNGLE");
	}

	else if (global.level == 2) {
		L = string("DESERT");
	}
	else if (global.level == 3) {
		L = string("VOLCANO");
	}

	// Draw Selected Option
	draw_sprite(spr_pause_select, 0, display_get_gui_width()/2, 3*display_get_gui_height()/4 + 24);
	draw_text(display_get_gui_width()/2, 3*display_get_gui_height()/4, L);
}