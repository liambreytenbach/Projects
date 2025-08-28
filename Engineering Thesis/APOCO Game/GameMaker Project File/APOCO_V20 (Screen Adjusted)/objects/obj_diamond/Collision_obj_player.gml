// Increase Coins
global.diamonds += 1;

// Coin Explosion
instance_create_layer(x, y, 1, obj_diamond_explosion);

instance_destroy();
