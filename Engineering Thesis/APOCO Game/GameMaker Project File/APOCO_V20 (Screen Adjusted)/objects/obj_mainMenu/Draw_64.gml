/// @description Insert description here
// You can write your code in this editor

if (mainMenu == true) {
	
	levelMenu = false;
	mainMenu = mainMenu;
	creditsMenu = false;
	playerMenu = false;
	
	// Background
	draw_sprite_ext(spr_mainMenu_background, 0, display_get_gui_width()/2, display_get_gui_height()/2, 4, 4, 0, 100, 100);
	
	draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/4, display_get_gui_height()/2, 25, 25, 0, 0, 100);
	draw_sprite_ext(spr_menu_select, 0, 3*display_get_gui_width()/4, display_get_gui_height()/2, 25, 25, 0, 0, 100);
	draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
	loading_frame += 0.2;

	
	// Drawing Game Name
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2-160, string("APOCO"));
	// Drawing Credits Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+10, string("CREDITS"));
	// Drawing Levels Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/4, display_get_gui_height()/2-24, string("LEVELS"));
	// Drawing Player Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()*(3/4), display_get_gui_height()/2-24, string("PLAYER"));
	
	
	// Draw Selected Option
	draw_sprite(spr_pause_select, 0, heightX, heightY);
	if (right_key) {
		//audio_play_sound(selectSound, 1, false);
		if heightX == display_get_gui_width()/2 {
			heightX = display_get_gui_width()*(3/4);
			heightY = display_get_gui_height()/2;
		}
		else if heightX == display_get_gui_width()*(3/4){
			heightX = display_get_gui_width()/4;
			heightY = display_get_gui_height()/2;
		}
		else {
			heightX = display_get_gui_width()/2;
			heightY = display_get_gui_height()/2 + 32;
		}
	}
	if (left_key) {
		//audio_play_sound(selectSound, 1, false);
		if heightX == display_get_gui_width()/2 {
			heightX = display_get_gui_width()/4;
			heightY = display_get_gui_height()/2;
		}
		else if heightX == display_get_gui_width()/4{
			heightX = display_get_gui_width()*(3/4);
			heightY = display_get_gui_height()/2;
		}
		else {
			heightX = display_get_gui_width()/2;
			heightY = display_get_gui_height()/2 + 32;
		}
	}
	
	// Selecting Options
	if (enter_key) {
		//audio_play_sound(selectSound, 1, false);
		if heightX == display_get_gui_width()/2 {
			// Credits
			backDist = 3000;
			creditsMenu = true;
		}
		else if heightX == display_get_gui_width()/4 {
			// Level Menu
			levelMenu = true;
					
		}
		else {
			// Player Menu
			backDist = display_get_gui_width()/4;
			heightDist = -1000;
			playerMenu = true;
		}
	}
}

if (levelMenu == true) {
	
	levelMenu = levelMenu;
	mainMenu = false;
	creditsMenu = false;
	playerMenu = false;
	
	
	
}

if (creditsMenu == true) {
	
	levelMenu = false;
	mainMenu = false;
	creditsMenu = creditsMenu;
	playerMenu = false;
	
	// Background
	draw_sprite_ext(spr_mainMenu_background, 0, display_get_gui_width()/2, display_get_gui_height()/2, 4, 4, 0, 100, 100);
	
	draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/2, display_get_gui_height()/2, 25, 25, 0, 0, 100);
	draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
	loading_frame += 0.2;

	// Drawing Game Name
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2-160, string("APOCO"));
	
	// Drawing Credit Name
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2, string("LIAM BREYTENBACH"));
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+40, string("EEE4022S"));
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+120, string("FINAL YEAR PROJECT"));
	
	// Drawing Back Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/4, display_get_gui_height()/2-100, string("BACK"));
	
	// Draw Selected Option
	draw_sprite(spr_pause_select, 0, display_get_gui_width()/4, display_get_gui_height()/2 - backDist);
	
	if left_key {
		//audio_play_sound(selectSound, 1, false);
		backDist = 78;
	}
	
	if (enter_key && backDist < 200) {
		//audio_play_sound(selectSound, 1, false);
		backDist = 2000;
		mainMenu = true;
	}
	
}


if (playerMenu == true) {
	
	levelMenu = false;
	mainMenu = false;
	creditsMenu = false;
	playerMenu = playerMenu;
	
	// Background
	draw_sprite_ext(spr_mainMenu_background, 0, display_get_gui_width()/2, display_get_gui_height()/2, 4, 4, 0, 100, 100);
	
	draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/2, display_get_gui_height()/2, 25, 25, 0, 0, 100);
	draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
	loading_frame += 0.2;

	// Drawing Game Name
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2-160, string("APOCO"));
	
	// Drawing Credit Name
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+20, string("SKINS"));
	draw_text(display_get_gui_width()/2, display_get_gui_height()/2+100, string("WEAPONS"));
	
	// Drawing Back Text
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width()/4, display_get_gui_height()/2-100, string("BACK"));
	
	// Draw Selected Option
	draw_sprite(spr_pause_select, 0, display_get_gui_width()/2-backDist, display_get_gui_height()/2 + heightDist);
	
	if left_key {
		//audio_play_sound(selectSound, 1, false);
		backDist = display_get_gui_width()/4;
		heightDist = -78;
	}
	else if right_key {
		//audio_play_sound(selectSound, 1, false);
		backDist = 0;
		heightDist = 20+24;
	}
	else if up_key {
		//audio_play_sound(selectSound, 1, false);
		backDist = 0;
		heightDist = 20+24;
	}
	else if down_key {
		//audio_play_sound(selectSound, 1, false);
		backDist = 0;
		heightDist = 100+24;
	}
	
	if (enter_key) {
		//audio_play_sound(selectSound, 1, false);
		if (heightDist == -78) {
			backDist = 0;
			heightDist = 44;
			heightX = display_get_gui_width()/4;
			heightY = display_get_gui_height()/2;
			mainMenu = true;
		}
		else if (heightDist == 44) {
			skinSelect();
			heightY = display_get_gui_height()/2-60;
			heightDist = 1000;
		}
		else if (heightDist == 124) {
			weaponSelect();
			heightY = display_get_gui_height()/2-60;
			heightDist = 1000;
		}
	}
	
}
if (skinsMenu == true) {
	skinSelect();
}
if (weaponsMenu == true) {
	weaponSelect();
}

function skinSelect() {
	
		
	if (purchaseRequest == false) {
		levelMenu = false;
		mainMenu = false;
		creditsMenu = false;
		playerMenu = false;
		skinsMenu = true;
		weaponsMenu = false;
	
	
		// Background
		draw_sprite_ext(spr_mainMenu_background, 0, display_get_gui_width()/2, display_get_gui_height()/2, 4, 4, 0, 100, 100);
	
		draw_sprite_ext(spr_wallet, 0, display_get_gui_width()/2 - 128, 8*display_get_gui_height()/10, 2, 2, 0, c_white, 100);
		var c = "$" + string(global.coins);
		var d = "   " + string(global.diamonds);
		draw_set_colour(c_yellow);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, 8*display_get_gui_height()/10 - 32, c);
		draw_set_colour(c_aqua);
		draw_text(display_get_gui_width()/2, 8*display_get_gui_height()/10 + 32, d);
		draw_sprite_ext(spr_diamond, 0, display_get_gui_width()/2-48, 8*display_get_gui_height()/10+26, 0.8, 0.8, 0, c_white, 100);
		
		draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/4, display_get_gui_height()/2, 25, 25, 0, 0, 100);
		draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/2, display_get_gui_height()/2, 25, 25, 0, 0, 100);
		draw_sprite_ext(spr_menu_select, 0, 3*display_get_gui_width()/4, display_get_gui_height()/2, 25, 25, 0, 0, 100);
		draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/10+96);
		loading_frame += 0.2;

	
		// Drawing Game Name
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10, string("APOCO"));
		// Drawing Credits Text
		draw_set_colour(c_yellow);
		draw_set_halign(fa_center);
		if (purchase3Good) {
			draw_set_colour(c_white);
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2-164, string("PURCHASED"));
		}
		else {
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2-164, string("$100"));
		}
		draw_set_colour(c_white);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-84, string("CAPE"));
		draw_sprite_ext(spr_skin2_right, 0, display_get_gui_width()/4-64, display_get_gui_height()/2, 2, 2, 0, c_white, 100);
		// Drawing Levels Text
		draw_set_colour(c_yellow);
		draw_set_halign(fa_center);
		if (purchase2Good) {
			draw_set_colour(c_white);
			draw_text(display_get_gui_width()/4, display_get_gui_height()/2-164, string("PURCHASED"));
		}
		else {
			draw_text(display_get_gui_width()/4, display_get_gui_height()/2-164, string("$50"));
		}
		draw_set_colour(c_white);
		draw_text(display_get_gui_width()/4, display_get_gui_height()/2-84, string("DEEP BLUE"));
		draw_sprite_ext(spr_skin3_right, 0, display_get_gui_width()/2-64, display_get_gui_height()/2, 2, 2, 0, c_white, 100);
		// Drawing Player Text
		draw_set_colour(c_aqua);
		draw_set_halign(fa_center);
		if (purchase4Good) {
			draw_set_colour(c_white);
			draw_text(3*display_get_gui_width()/4, display_get_gui_height()/2-164, string("PURCHASED"));
		}
		else {
			draw_sprite_ext(spr_diamond, 0, 3*display_get_gui_width()/4-48, display_get_gui_height()/2-174, 0.9, 0.9, 0, c_white, 100);
			draw_text(3*display_get_gui_width()/4, display_get_gui_height()/2-164, string("    5"));
		}
		draw_set_colour(c_white);
		draw_text(display_get_gui_width()*(3/4), display_get_gui_height()/2-84, string("SPRINGBOK"));
		draw_sprite_ext(spr_skin4_right, 0, 3*display_get_gui_width()/4-64, display_get_gui_height()/2, 2, 2, 0, c_white, 100);
	
		// Drawing Back Text
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/4, display_get_gui_height()/6, string("BACK"));
	
	
		// Draw Selected Option
		draw_sprite(spr_pause_select, 0, heightX, heightY);
		if (right_key) {
			//audio_play_sound(selectSound, 1, false);
			if heightX == display_get_gui_width()/2 {
				heightX = display_get_gui_width()*(3/4);
				heightY = display_get_gui_height()/2-60;
			}
			else if heightX == display_get_gui_width()*(3/4){
				heightX = display_get_gui_width()/4;
				heightY = display_get_gui_height()/2-60;
			}
			else {
				heightX = display_get_gui_width()/2;
				heightY = display_get_gui_height()/2-60;
			}
		}
		if (left_key) {
			//audio_play_sound(selectSound, 1, false);
			if heightX == display_get_gui_width()/2 {
				heightX = display_get_gui_width()/4;
				heightY = display_get_gui_height()/2-60;
			}
			else if heightX == display_get_gui_width()/4{
				heightX = display_get_gui_width()*(3/4);
				heightY = display_get_gui_height()/2-60;
			}
			else {
				heightX = display_get_gui_width()/2;
				heightY = display_get_gui_height()/2-60;
			}
		}
		if (up_key) {
			//audio_play_sound(selectSound, 1, false);
		
			heightX = display_get_gui_width()/4;
			heightY = display_get_gui_height()/6+24;
		
		}
		if (down_key) {
			//audio_play_sound(selectSound, 1, false);
		
			heightX = display_get_gui_width()/4;
			heightY = display_get_gui_height()/2-60;
		
		}
		
		
		if (purchase2Good) {
			draw_sprite_ext(spr_selected, 0, display_get_gui_width()/4+164, display_get_gui_height()/2-164, 4, 4, 0, c_white, 100);
		}
		if (purchase3Good) {
			draw_sprite_ext(spr_selected, 0, display_get_gui_width()/2+164, display_get_gui_height()/2-164, 4, 4, 0, c_white, 100);
		}
		if (purchase4Good) {
			draw_sprite_ext(spr_selected, 0, 3*display_get_gui_width()/4+164, display_get_gui_height()/2-164, 4, 4, 0, c_white, 100);
		}
			
	
		// Selecting Options
		if (enter_key) {
			//audio_play_sound(selectSound, 1, false);
			if (heightY == display_get_gui_height()/6+24) {
				heightDist = display_get_gui_height()/2-6000;
				heightX = display_get_gui_width()/2-1000;
				heightY = display_get_gui_height()/2-6000;
				skinsMenu = false;
				playerMenu = true;
			}
			else if heightX == display_get_gui_width()/4 {
				// DEEP BLUE
				skinSelected = 2;
				heightX = display_get_gui_width()/2-64;
				price = 50;
				purchaseRequest = true;
			}
			else if heightX == display_get_gui_width()/2 {
				// CAPE
				skinSelected = 3;
				heightX = display_get_gui_width()/2-64;
				price = 100;
				purchaseRequest = true;
					
			}
			else {
				// SPRINGBOK
				skinSelected = 4;
				heightX = display_get_gui_width()/2-64;
				price = 5;
				purchaseRequest = true;
			}
		}
	}
	
	else if (purchaseRequest) {
		// Background
		draw_sprite_ext(spr_mainMenu_background, 0, display_get_gui_width()/2, display_get_gui_height()/2, 4, 4, 0, 100, 100);
		draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/2, display_get_gui_height()/2, 35, 35, 0, 0, 100);
		
		draw_set_halign(fa_center);
		draw_set_colour(c_white);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-164, string("ARE YOU SURE?"));
		draw_text(display_get_gui_width()/2-64, display_get_gui_height()/2-84, string("NO"));
		draw_text(display_get_gui_width()/2+64, display_get_gui_height()/2-84, string("YES"));
		
		if (skinSelected == 2) {
			s = spr_skin2_right;
			price = 50;
			sp = "$" + string(price);
			draw_set_colour(c_yellow);
		}
		else if (skinSelected == 3) {
			s = spr_skin3_right;
			price = 100;
			sp = "$" + string(price);
			draw_set_colour(c_yellow);
		}
		else if (skinSelected == 4) {
			s = spr_skin4_right;
			draw_sprite_ext(spr_diamond, 0, display_get_gui_width()/2-60, display_get_gui_height()/2 + 176, 0.8, 0.8, 0, c_white, 100);
			price = 5;
			sp = " " + string(price);
			draw_set_colour(c_aqua);
		}
		
		draw_sprite_ext(s, 0, display_get_gui_width()/2-70, display_get_gui_height()/2, 2.5, 2.5, 0, c_white, 100);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2+184, string(sp));
		
		
		// Draw Selected Option
	draw_sprite(spr_pause_select, 0, heightX, heightY);
	if (right_key) {
		//audio_play_sound(selectSound, 1, false);
		heightX = display_get_gui_width()/2+64;
	}
	if (left_key) {
		//audio_play_sound(selectSound, 1, false);
		heightX = display_get_gui_width()/2-64;
	}
		
		if (enter_key) {
			//audio_play_sound(selectSound, 1, false);
			if heightX == display_get_gui_width()/2-64 {		
				heightX = display_get_gui_width()/4;
				purchaseRequest = false;
			}
			else if heightX == display_get_gui_width()/2+64 {
				if (global.coins >= price) {
					// DEEP BLUE
					heightX = display_get_gui_width()/4;
					global.skin = skinSelected;
					if (skinSelected == 2) {
						purchase2Good = true;
						purchase3Good = false;
						purchase4Good = false;
						global.coins -= price;
					}
					else if (skinSelected == 3) {
						purchase3Good = true;
						purchase2Good = false;
						purchase4Good = false;
						global.coins -= price;
					}
					else if (skinSelected == 4 && global.diamonds >= price) {
						purchase4Good = true;
						purchase2Good = false;
						purchase3Good = false;
						global.diamonds -= price;
					}
					purchaseRequest = false;
				}
				else {
					heightX = display_get_gui_width()/4;
					purchaseRequest = false;
				}
						
			}
		}
	}
	
}


function weaponSelect() {
	
	if (purchaseRequest == false) {
		levelMenu = false;
		mainMenu = false;
		creditsMenu = false;
		playerMenu = false;
		skinsMenu = false;
		weaponsMenu = true;
	
	
		// Background
		draw_sprite_ext(spr_mainMenu_background, 0, display_get_gui_width()/2, display_get_gui_height()/2, 4, 4, 0, 100, 100);
	
		draw_sprite_ext(spr_wallet, 0, display_get_gui_width()/2 - 128, 8*display_get_gui_height()/10, 2, 2, 0, c_white, 100);
		var c = "$" + string(global.coins);
		var d = "   " + string(global.diamonds);
		draw_set_colour(c_yellow);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, 8*display_get_gui_height()/10 - 32, c);
		draw_set_colour(c_aqua);
		draw_text(display_get_gui_width()/2, 8*display_get_gui_height()/10 + 32, d);
		draw_sprite_ext(spr_diamond, 0, display_get_gui_width()/2-48, 8*display_get_gui_height()/10+26, 0.8, 0.8, 0, c_white, 100);
		
		draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/4, display_get_gui_height()/2, 25, 25, 0, 0, 100);
		draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/2, display_get_gui_height()/2, 25, 25, 0, 0, 100);
		draw_sprite_ext(spr_menu_select, 0, 3*display_get_gui_width()/4, display_get_gui_height()/2, 25, 25, 0, 0, 100);
		draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/10+96);
		loading_frame += 0.2;

	
		// Drawing Game Name
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10, string("APOCO"));
		// Drawing Credits Text
		draw_set_colour(c_yellow);
		draw_set_halign(fa_center);
		if (purchase3GoodW) {
			draw_set_colour(c_white);
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2-164, string("PURCHASED"));
		}
		else {
			draw_text(display_get_gui_width()/2, display_get_gui_height()/2-164, string("$300"));
		}
		draw_set_colour(c_white);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-84, string("SWORD"));
		draw_sprite_ext(spr_swordRight, 0, display_get_gui_width()/2-96, display_get_gui_height()/2, 3, 3, 0, c_white, 100);
		// Drawing Levels Text
		draw_set_colour(c_yellow);
		draw_set_halign(fa_center);
		if (purchase2GoodW) {
			draw_set_colour(c_white);
			draw_text(display_get_gui_width()/4, display_get_gui_height()/2-164, string("PURCHASED"));
		}
		else {
			draw_text(display_get_gui_width()/4, display_get_gui_height()/2-164, string("$600"));
		}
		draw_set_colour(c_white);
		draw_text(display_get_gui_width()/4, display_get_gui_height()/2-84, string("FORCE FIELD"));
		draw_sprite_ext(spr_forceField, 3, display_get_gui_width()/4-32, display_get_gui_height()/2+24, 2, 2, 0, c_white, 100);
		// Drawing Player Text
		draw_set_colour(c_aqua);
		draw_set_halign(fa_center);
		if (purchase4GoodW) {
			draw_set_colour(c_white);
			draw_text(3*display_get_gui_width()/4, display_get_gui_height()/2-164, string("PURCHASED"));
		}
		else {
			draw_sprite_ext(spr_diamond, 0, 3*display_get_gui_width()/4-48, display_get_gui_height()/2-174, 0.9, 0.9, 0, c_white, 100);
			draw_text(3*display_get_gui_width()/4-16, display_get_gui_height()/2-164, string("           10"));
		}
		draw_set_colour(c_white);
		draw_text(display_get_gui_width()*(3/4), display_get_gui_height()/2-84, string("LAUNCHER"));
		draw_sprite_ext(spr_missileRight, 0, 3*display_get_gui_width()/4-70, display_get_gui_height()/2-64, 5, 5, 0, c_white, 100);
	
		// Drawing Back Text
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/4, display_get_gui_height()/6, string("BACK"));
	
	
		// Draw Selected Option
		draw_sprite_ext(spr_pause_select, 0, heightX, heightY, 1.1, 1.1, 0, c_white, 100);
		if (right_key) {
			//audio_play_sound(selectSound, 1, false);
			if heightX == display_get_gui_width()/2 {
				heightX = display_get_gui_width()*(3/4);
				heightY = display_get_gui_height()/2-60;
			}
			else if heightX == display_get_gui_width()*(3/4){
				heightX = display_get_gui_width()/4;
				heightY = display_get_gui_height()/2-60;
			}
			else {
				heightX = display_get_gui_width()/2;
				heightY = display_get_gui_height()/2-60;
			}
		}
		if (left_key) {
			//audio_play_sound(selectSound, 1, false);
			if heightX == display_get_gui_width()/2 {
				heightX = display_get_gui_width()/4;
				heightY = display_get_gui_height()/2-60;
			}
			else if heightX == display_get_gui_width()/4{
				heightX = display_get_gui_width()*(3/4);
				heightY = display_get_gui_height()/2-60;
			}
			else {
				heightX = display_get_gui_width()/2;
				heightY = display_get_gui_height()/2-60;
			}
		}
		if (up_key) {
			//audio_play_sound(selectSound, 1, false);
		
			heightX = display_get_gui_width()/4;
			heightY = display_get_gui_height()/6+24;
		
		}
		if (down_key) {
			//audio_play_sound(selectSound, 1, false);
		
			heightX = display_get_gui_width()/4;
			heightY = display_get_gui_height()/2-60;
		
		}
		
		
		if (purchase2GoodW) {
			draw_sprite_ext(spr_selected, 0, display_get_gui_width()/4+164, display_get_gui_height()/2-164, 4, 4, 0, c_white, 100);
		}
		if (purchase3GoodW) {
			draw_sprite_ext(spr_selected, 0, display_get_gui_width()/2+164, display_get_gui_height()/2-164, 4, 4, 0, c_white, 100);
		}
		if (purchase4GoodW) {
			draw_sprite_ext(spr_selected, 0, 3*display_get_gui_width()/4+164, display_get_gui_height()/2-164, 4, 4, 0, c_white, 100);
		}
			
	
		// Selecting Options
		if (enter_key) {
			//audio_play_sound(selectSound, 1, false);
			if (heightY == display_get_gui_height()/6+24) {
				heightDist = display_get_gui_height()/2-6000;
				heightX = display_get_gui_width()/2-1000;
				heightY = display_get_gui_height()/2-6000;
				weaponsMenu = false;
				playerMenu = true;
			}
			else if heightX == display_get_gui_width()/4 {
				// SPEAR
				weaponSelected = 2;
				heightX = display_get_gui_width()/2-64;
				price = 80;
				purchaseRequest = true;
			}
			else if heightX == display_get_gui_width()/2 {
				// SWORD
				weaponSelected = 3;
				heightX = display_get_gui_width()/2-64;
				price = 300;
				purchaseRequest = true;
					
			}
			else {
				// LAUNCHER
				weaponSelected = 4;
				heightX = display_get_gui_width()/2-64;
				price = 5;
				purchaseRequest = true;
			}
		}
	}
	
	else if (purchaseRequest) {
		// Background
		draw_sprite_ext(spr_mainMenu_background, 0, display_get_gui_width()/2, display_get_gui_height()/2, 4, 4, 0, 100, 100);
		draw_sprite_ext(spr_menu_select, 0, display_get_gui_width()/2, display_get_gui_height()/2, 35, 35, 0, 0, 100);
		
		draw_set_halign(fa_center);
		draw_set_colour(c_white);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2-164, string("ARE YOU SURE?"));
		draw_text(display_get_gui_width()/2-64, display_get_gui_height()/2-84, string("NO"));
		draw_text(display_get_gui_width()/2+64, display_get_gui_height()/2-84, string("YES"));
		
		if (weaponSelected == 2) {
			s = spr_forceField;
			price = 600;
			sp = "$" + string(price);
			draw_set_colour(c_yellow);
			draw_sprite_ext(s, 3, display_get_gui_width()/2-32, display_get_gui_height()/2+24, 2.2, 2.2, 0, c_white, 100);
		}
		else if (weaponSelected == 3) {
			s = spr_swordRight;
			price = 300;
			sp = "$" + string(price);
			draw_set_colour(c_yellow);
			draw_sprite_ext(s, 0, display_get_gui_width()/2-112, display_get_gui_height()/2, 3.5, 3.5, 0, c_white, 100);
		}
		else if (weaponSelected == 4) {
			s = spr_missileRight;
			draw_sprite_ext(spr_diamond, 0, display_get_gui_width()/2-60, display_get_gui_height()/2 + 176, 0.8, 0.8, 0, c_white, 100);
			price = 10;
			sp = " " + string(price);
			draw_set_colour(c_aqua);
			draw_sprite_ext(s, 0, display_get_gui_width()/2-70, display_get_gui_height()/2-64, 5, 5, 0, c_white, 100);
		}
		
		//draw_sprite_ext(s, 0, display_get_gui_width()/2-70, display_get_gui_height()/2, 2.5, 2.5, 0, c_white, 100);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2+184, string(sp));
		
		
		// Draw Selected Option
	draw_sprite(spr_pause_select, 0, heightX, heightY);
	if (right_key) {
		//audio_play_sound(selectSound, 1, false);
		heightX = display_get_gui_width()/2+64;
	}
	if (left_key) {
		//audio_play_sound(selectSound, 1, false);
		heightX = display_get_gui_width()/2-64;
	}
		
		if (enter_key) {
			//audio_play_sound(selectSound, 1, false);
			if heightX == display_get_gui_width()/2-64 {		
				heightX = display_get_gui_width()/4;
				purchaseRequest = false;
			}
			else if heightX == display_get_gui_width()/2+64 {
				if (global.coins >= price) {
					// SPEAR
					heightX = display_get_gui_width()/4;
					if (weaponSelected == 2) {
						purchase2GoodW = true;
						purchase3GoodW = false;
						purchase4GoodW = false;
						global.coins -= price;
						global.forceField = true;
						global.spear = false;
						global.sword = false;
						global.launcher = false;
					}
					else if (weaponSelected == 3) {
						purchase3GoodW = true;
						purchase2GoodW = false;
						purchase4GoodW = false;
						global.coins -= price;
						global.spear = false;
						global.forceField = false;
						global.sword = true;
						global.launcher = false;
					}
					else if (weaponSelected == 4 && global.diamonds >= price) {
						purchase4GoodW = true;
						purchase2GoodW = false;
						purchase3GoodW = false;
						global.diamonds -= price;
						global.spear = false;
						global.forceField = false;
						global.sword = false;
						global.launcher = true;
					}
					purchaseRequest = false;
				}
				else {
					heightX = display_get_gui_width()/4;
					purchaseRequest = false;
				}
						
			}
		}
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