// Decreasing player lives 
if global.lives > 0 {
	global.bossHit = true;
	global.lives = 0;
}

//instance_destroy();