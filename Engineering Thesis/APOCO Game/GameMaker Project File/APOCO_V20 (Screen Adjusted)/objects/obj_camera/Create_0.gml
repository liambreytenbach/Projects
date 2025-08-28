/// @description Insert description here
// You can write your code in this editor

#macro CameraWidth 640
#macro CameraHeight 320
#macro CameraScale 3
#macro CameraSpeed 0.1

cameraTarget = cameraMove;
global.Camera = camera_create_view(0, 0, CameraWidth, CameraHeight);

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, global.Camera);

//Viewport
window_set_size(CameraWidth * CameraScale, CameraHeight * CameraScale);
surface_resize(application_surface, CameraWidth * CameraScale, CameraHeight * CameraScale);
var windowWidth = CameraWidth * CameraScale;
var windowHeight = CameraHeight * CameraScale;
window_set_position(display_get_width()/2 - windowWidth, display_get_height()/2 - windowHeight);

