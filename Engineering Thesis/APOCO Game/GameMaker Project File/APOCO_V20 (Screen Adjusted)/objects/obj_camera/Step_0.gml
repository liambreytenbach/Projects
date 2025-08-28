var CameraX = camera_get_view_x(global.Camera);
var CameraY = camera_get_view_y(global.Camera);

var targetX = cameraTarget.x - CameraWidth/2;
var targetY = cameraTarget.y - CameraHeight/2;

// Clamp
targetX = clamp(targetX, 0, room_width - CameraWidth);
targetY = clamp(targetY, 0, room_height - CameraHeight);

//Smooth Move
cameraX = lerp(CameraX, targetX, CameraSpeed);
cameraY = lerp(CameraY, targetY, CameraSpeed);

// Apply changes
camera_set_view_pos(global.Camera, cameraX, cameraY);


