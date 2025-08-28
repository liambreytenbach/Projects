/// @description Insert description here
// You can write your code in this editor

if (global.is_paused == false && jumpHeight == 6) {
	// Draw Selected Option
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_sprite_ext(spr_jump, 0, display_get_gui_width()/2 - 48, 3*display_get_gui_height()/4 - 130, 3, 3, 0, c_white, 100);
	draw_sprite_ext(spr_pause_select, 0, display_get_gui_width()/2, 3*display_get_gui_height()/4 + 24, 1.2, 1.2, 0, c_white, 100);
	draw_text(display_get_gui_width()/2, 3*display_get_gui_height()/4, "SUPER JUMP");
}