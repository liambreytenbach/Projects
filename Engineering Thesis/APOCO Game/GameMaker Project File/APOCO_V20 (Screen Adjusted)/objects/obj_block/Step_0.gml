/// @description Insert description here
// You can write your code in this editor

if (obj_player.x - x > 2800) {
	instance_destroy();
}
if (blockLevel != global.subLevel && sprite_index != spr_stoneEnd) {
	instance_destroy();
}