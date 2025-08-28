/// @description Insert description here
// You can write your code in this editor


if (global.level == 3 && image_xscale < maxScale) {
	image_xscale +=0.05;
	image_yscale +=0.05;
}

else if (global.level != 3 && image_xscale > minScale) {
	image_xscale -=0.05;
	image_yscale -=0.05;
}