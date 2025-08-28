/// @description Insert description here
// You can write your code in this editor

up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
enter_key = keyboard_check_pressed(vk_enter);

// Number of subLevelS per lEVEL TO COMPLETE 
if (global.subLevel >= 3) {
	global.levelComplete = true;
	global.start_X = 0;
	global.end_X = 2000;
}

