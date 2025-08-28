/// @description Insert description here
// You can write your code in this editor

loading_frame = 0;
loading_game_frame = 0;

//Clouds
cloud1 = 0;
cloud2 = 0;
cloud3 = 0;
vine1 = 0;
vine2 = 0;
vine3 = 0;

height = 10;
global.tutCompleted = false

global.enter_count = -1;

global.loadingScreen = true;

audio_stop_sound(MENU);
audio_play_sound(MENU, 10, true);

global.spear = true;
global.sword = false;
global.launcher = false;
global.forceField = false;

global.coins = 2000;
global.diamonds = 20;

heightX = 1000;
heightY = 3000;

global.keyboard = false;
global.controller = false;

