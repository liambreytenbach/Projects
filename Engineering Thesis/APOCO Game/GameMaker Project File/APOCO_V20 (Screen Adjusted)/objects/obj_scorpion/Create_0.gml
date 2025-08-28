// Variables 
x_speed = 0;
y_speed = 0;

move_speed = 0.2;

grv = 0.3;

gml_pragma("spawn_timer = 5");

spawn_timer = 60*5;  // 10 seconds in frames


// Animations
canAnimate = false;
animation = irandom(2);

venomCount = 0;

global.bossHit = false;
global.enemyLives = 3;

injured = false;