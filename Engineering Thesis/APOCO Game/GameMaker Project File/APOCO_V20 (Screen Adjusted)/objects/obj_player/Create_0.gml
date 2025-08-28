// Create Level 

x_speed = 0;
y_speed = 0;

// Horizontal Movement
move_speed = 1;

//Vertical Movement
grv = 0.2;
jumpHeight = 5;
vertical_speed = 0;
jumpCount = 0;
maxJumps = 2;
wallJumping = false;
jump_delay = 0;
slip_delay = 0;
waterCount = 0;
wasInWater = false;
global.wasInWater = false;
global.onVine = false;
global.inWater = false;

// PowerUps
currentDist = 0;
startDist = 0;

//Sprites
if (global.skin == 1) {
	sprite[RIGHT] = spr_new_player_right;
	sprite[LEFT] = spr_new_player_left;
}
else if (global.skin == 2) {
	sprite[RIGHT] = spr_skin2_right;
	sprite[LEFT] = spr_skin2_left;
}
else if (global.skin == 3) {
	sprite[RIGHT] = spr_skin3_right;
	sprite[LEFT] = spr_skin3_left;
}
else if (global.skin == 4) {
	sprite[RIGHT] = spr_skin4_right;
	sprite[LEFT] = spr_skin4_left;
}

face = LEFT;

image_xscale = 0.5;
image_yscale = 0.5;

// Full Screen
window_set_fullscreen(true);

// Particles System Player Run
var _p = part_type_create();
part_type_shape(_p, pt_shape_ring);
part_type_life(_p, 20, 40);
part_type_size(_p, 0.01, 0.08, 0, 0);
part_type_alpha2(_p, 0.5, 0);
part_type_color2(_p, c_white, c_dkgray);	
global.ptBasic = _p;

// Particles System Player Run
var _pj = part_type_create();
part_type_shape(_pj, pt_shape_ring);
part_type_life(_pj, 20, 40);
part_type_size(_pj, 0.05, 0.1, 0, 0);
part_type_alpha2(_pj, 0.5, 0);
part_type_color2(_pj, c_white, c_dkgray);	
global.ptJump = _pj;

global.partSystem = part_system_create();
part_system_depth(global.partSystem, -100);

sprite_index = spr_new_player_right;





if (global.spear) {
	var spear = instance_create_layer(x, y, 0, obj_spear);
	spear.depth = 100;
}
else if (global.sword){
	var sword = instance_create_layer(x, y, 0, obj_sword);
	sword.depth = 100;
}
else if (global.launcher){
	var missile = instance_create_layer(x, y, 0, obj_missile);
	missile.depth = 100;
}
else if (global.forceField){
	var forceField = instance_create_layer(x, y, 0, obj_forceField);
	forceField.depth = 1;
}






