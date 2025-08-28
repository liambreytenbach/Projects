// Increase Coins
if (global.lives < 4) {
	global.lives += 1;
	// Coin Explosion
	instance_create_layer(x, y, 1, obj_life_explosion);

	instance_destroy();
}


