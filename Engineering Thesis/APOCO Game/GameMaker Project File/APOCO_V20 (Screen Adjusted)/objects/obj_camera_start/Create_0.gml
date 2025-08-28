/// @description Insert description here
// You can write your code in this editor


cameraTarget = obj_level_select;

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

