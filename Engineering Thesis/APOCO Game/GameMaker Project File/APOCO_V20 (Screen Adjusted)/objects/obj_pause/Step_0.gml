/// @description Insert description here
// You can write your code in this editor

pause_key = keyboard_check_pressed(ord("P"));
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
enter_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// && global.level != 0
if (pause_key ) {
	global.is_paused = !global.is_paused;
}

// Pause/Resume Background Music
if (global.is_paused) {
    audio_pause_sound(MENU);
} else {
    audio_resume_all();
}

