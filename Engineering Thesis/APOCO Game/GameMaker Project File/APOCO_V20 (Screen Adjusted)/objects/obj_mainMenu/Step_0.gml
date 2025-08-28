/// @description Insert description here
// You can write your code in this editor

right_key = keyboard_check_pressed(vk_right);
left_key = keyboard_check_pressed(vk_left);
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

esc_key = keyboard_check_pressed(vk_escape);
enter_up_key = keyboard_check_released(vk_enter) || keyboard_check_pressed(vk_space);
//back_key = keyboard_check_pressed(vk_space);


if enter_up_key {
	canEnter = true;
}

if canEnter {
	enter_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
}