	
if (!global.is_paused) {	
	
	// Drawing Game Score, Coins and Lives

	var gameScore = "";
	// Rounding players x coordinate down for game score

	global.score = round(obj_player.x/100 * 20) / 10 - 3.1;


	// Holder variables for aestetics
	scoreString = "";
	scoreDecimal = "";

	// Checks if player has moved backwards
	if global.score > global.currentScore {
		gameScore = global.score;
		global.currentScore = global.score;
	}
	else {
		gameScore = global.currentScore;
	}

	// Rounding game scores for front zeros e.g) 005.10 M
	if gameScore < 10 {
		scoreString = "00";
	}
	else if gameScore < 100 {
		scoreString = "0";
	}
	else if gameScore < 1000 {
		scoreString = "";
	}
	if gameScore % 1 == 0 {
		scoreDecimal = ".00";
	}
	else {
		scoreDecimal = "";
	}

	// Drawing background for score
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_sprite_ext(spr_scoreBackground, 0, 45, 45, 1.1, 1.1, 0, c_white, 100);
	// Drawing score
	draw_text(50, 50, scoreString + string(gameScore) + scoreDecimal);
	draw_text(145, 50, "M");

	// Drawing background for coins
	draw_sprite(spr_coinBackground, 0, 45, 115);
	// Drawing coin score
	draw_set_colour(c_yellow);
	draw_text(50, 120, " $ " + string(global.coins));


	// Drawing background for lives
	//draw_sprite(spr_coinBackground, 0, 45, 185);
	//// Drawing coin score
	//draw_set_colour(c_red);
	//draw_text(100, 190, string(global.lives));
	//draw_sprite_ext(spr_lives, 1, 55, 196, 2, 2, 0, c_white, 100);
	
	// Drawing background for diamonds
	draw_sprite(spr_coinBackground, 0, 45, 191);
	// Drawing coin score
	draw_set_colour(c_aqua);
	draw_text(98, 196, string(global.diamonds));
	//draw_sprite(spr_diamond, 1, 55, 266);
	draw_sprite_ext(spr_diamond, 1, 52, 200, 0.7, 0.7, 0, c_white, 100);
	
	if (global.level != 0) {
		// Drawing background for level progress
		draw_sprite_ext(spr_healthBar, global.lives, display_get_gui_width()/2, display_get_gui_height()/9, 3, 3, 0, c_white, 100);
	
		// Drawing background for health bar
		draw_sprite_ext(spr_levelProgress, global.subLevel, display_get_gui_width()/2, display_get_gui_height()/15, 1.5, 1.5, 0, c_white, 100);
		
		// Drawing background for boss health
		if (global.enemyLives >= 1 && obj_player.x > global.end_X - 100) {
			draw_sprite_ext(spr_enemyHealthBar, global.enemyLives, display_get_gui_width()/2, display_get_gui_height()/6, 2.5, 2.5, 0, c_white, 100);
		}
	}

	// Generating new Terrain
	if (obj_player.x > global.end_X + 699) {
		draw_sprite(spr_generating_terrain, 0, display_get_gui_width()/2, display_get_gui_height()/2);
		draw_sprite(spr_loading, 0, display_get_gui_width()/2, display_get_gui_height()/2-64);
		// Drawing Text
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2, string("GENERATING TERRAIN"));	
	}
	if obj_player.x - global.start_X < -70 {
		draw_sprite(spr_generating_terrain, 0, display_get_gui_width()/2, display_get_gui_height()/2);
		draw_sprite(spr_loading, loading_frame, display_get_gui_width()/2, display_get_gui_height()/2-64);
		loading_frame += 0.2;
		// Drawing Text
		draw_set_colour(c_white);
		draw_set_halign(fa_center);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/2, string("COMPLETE"));
	}
}







