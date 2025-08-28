/// @description Insert description here
// You can write your code in this editor



global.enemyLives -= 1;


if (global.enemyLives < 1) {
	instance_destroy();
	instance_create_layer(x, y, 0, obj_baboonBreak);
}

else {
	injured = true;
	var X = 0;
	while (X < 60) {
		if (!place_meeting(x + x_speed, y + 16, obj_checkPoint_Down)) {
			x += 1;
		}
		X += 1
	}
	move_speed = 0.2;
	sprite_index = spr_baboon_right_injured;
}