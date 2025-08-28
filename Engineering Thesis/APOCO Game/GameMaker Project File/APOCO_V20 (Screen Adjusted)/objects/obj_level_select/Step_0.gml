/// @description Insert description here
// You can write your code in this editor

if obj_mainMenu.levelMenu == true {
	right_key = keyboard_check_pressed(vk_right);
	left_key = keyboard_check_pressed(vk_left);
	enter_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
	esc_key = keyboard_check_pressed(vk_escape);


	if right_key {
		//audio_play_sound(selectSound, 1, false);
		if x = obj_backHome.x {	
			x = obj_jungle_background.x;
			y = obj_jungle_background.y;
			global.level = 1;
		}
		else if x = obj_jungle_background.x {	
			x = obj_desert_background.x;
			y = obj_desert_background.y;
			global.level = 2;
		}
		else if x = obj_desert_background.x {	
			x = obj_volcano_background.x;
			y = obj_volcano_background.y;
			global.level = 3;
		}
	}
	if left_key {
		//audio_play_sound(selectSound, 1, false);
		if x = obj_jungle_background.x {
			x = obj_backHome.x;
			y = obj_backHome.y;
			global.level = 0;
		}
		else if x = obj_desert_background.x {
			x = obj_jungle_background.x;
			y = obj_jungle_background.y;
			global.level = 1;
		}
		else if x = obj_volcano_background.x {
			x = obj_desert_background.x;
			y = obj_desert_background.y;
			global.level = 2;
		}
	}

	if (enter_key) {
		//audio_play_sound(selectSound, 1, false);
	
		if x = obj_backHome.x {
			obj_mainMenu.levelMenu = false;
			obj_mainMenu.mainMenu = true;
			obj_mainMenu.canEnter = false;
			obj_mainMenu.heightX = display_get_gui_width()/2;
			obj_mainMenu.heightY = display_get_gui_height()/2 + 32;
		}
	
		if x = obj_jungle_background.x {		
			room_goto(Room1);
			global.lives = 0;
		}
		if x = obj_desert_background.x {
			room_goto(Room1);
			global.lives = 0;
		}
		if x = obj_volcano_background.x {
			room_goto(Room1);
			global.lives = 0;
		}
	
	}
	//if (obj_mainMenu.back_key) {
	//	obj_mainMenu.levelMenu = false;
	//	obj_mainMenu.mainMenu = true;
	//	obj_mainMenu.canEnter = false;
	//}
}