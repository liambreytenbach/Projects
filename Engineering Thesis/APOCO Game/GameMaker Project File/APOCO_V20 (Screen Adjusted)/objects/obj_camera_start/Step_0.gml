cameraTarget = obj_level_select;

var CameraX = camera_get_view_x(global.Camera);
var CameraY = camera_get_view_y(global.Camera);

var targetX = cameraTarget.x - CameraWidth/4;
var targetY = cameraTarget.y - CameraHeight/4;

// Clamp
targetX = clamp(targetX, 0, room_width - CameraWidth/2);
targetY = clamp(targetY-50, 0, room_height - CameraHeight/2);

//Smooth Move
cameraX = lerp(CameraX, targetX, CameraSpeed/2);
cameraY = lerp(CameraY, targetY, CameraSpeed/2);

// Apply changes
camera_set_view_pos(global.Camera, cameraX, cameraY);


