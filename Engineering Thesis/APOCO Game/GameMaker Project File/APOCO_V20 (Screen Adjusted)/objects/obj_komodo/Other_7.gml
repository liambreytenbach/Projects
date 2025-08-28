/// @description Insert description here
// You can write your code in this editor

//if(animation < 10){
	animation += 1;
//}

if (animation > 3) {
	animation = 0;
}

if (x - obj_player.x < 64 && random(10) > 5) {
	x -= 10;
	sprite_index = spr_komodo_left_attack;
	animation = 10;
}

if (sprite_index == spr_komodo_right_injured) {
	injured = false;
	animation = 1;
}