// Increase Coins
obj_player.startDist = x;
obj_player.jumpHeight = 6;
// Coin Explosion
instance_create_layer(x, y, 1, obj_jump_explosion);

instance_destroy();



