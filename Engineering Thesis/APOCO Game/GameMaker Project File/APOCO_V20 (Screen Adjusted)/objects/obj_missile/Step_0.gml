/// @description Insert description here
// You can write your code in this editor

if (global.lives == 0) {
	instance_destroy();
}

x = obj_player.x;
y = obj_player.y;

if (obj_player.attack_key && obj_player.face == RIGHT) {
	sprite_index = spr_missileRightShoot;
	image_angle = 25;
	var r = instance_create_layer(x, y, 0, obj_missileRocket);
	r.sprite_index = spr_missileRocketRight;
	finishedAnimating = false;
}
else if (obj_player.attack_key && obj_player.face == LEFT ) {
	sprite_index = spr_missileLeftShoot;
	image_angle = -25;
	var r = instance_create_layer(x, y, 0, obj_missileRocket);
	r.sprite_index = spr_missileRocketLeft;
	finishedAnimating = false;
}

if (obj_player.x_speed > 0 && finishedAnimating || (obj_player.face == RIGHT && finishedAnimating)) {
	sprite_index = spr_missileRight;
	image_angle = 25;
}
else if (obj_player.x_speed < 0 && finishedAnimating || (obj_player.face == LEFT && finishedAnimating)) {
	sprite_index = spr_missileLeft;
	image_angle = -25;
}


if (global.is_paused || global.tutCompleted) {
	image_speed = 0;
}

else if (!global.is_paused && !global.tutCompleted) {
	image_speed = 1;
}