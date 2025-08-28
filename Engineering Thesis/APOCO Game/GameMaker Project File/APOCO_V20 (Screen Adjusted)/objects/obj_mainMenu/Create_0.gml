/// @description Insert description here
// You can write your code in this editor

loading_frame = 0;

heightX = display_get_gui_width()/4;
heightY = display_get_gui_height()/2;


levelMenu = false;
mainMenu = true;
creditsMenu = false;
playerMenu = false;
skinsMenu = false;
weaponsMenu = false;

enter_key = false;
canEnter = false;

backDist = 0;
heightDist = 44;

skin2Purchased = false;
skin3Purchased = false;
skin4Purchased = false;
purchaseRequest = false;
skinSelected = 0;
price = 0;
s = "";
sp = "";
purchase2Good = false;
purchase3Good = false;
purchase4Good = false;  


weapon2Purchased = false;
weapon3Purchased = false;
weapon4Purchased = false;
weaponSelected = 0;
purchase2GoodW = false;
purchase3GoodW = false;
purchase4GoodW = false; 


audio_stop_sound(MENU);
audio_play_sound(MENU, 10, true);