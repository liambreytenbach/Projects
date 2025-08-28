// Increase Coins
global.coins += 1;

// Coin Explosion
instance_create_layer(x, y, 1, obj_coin_explosion);

instance_destroy();
