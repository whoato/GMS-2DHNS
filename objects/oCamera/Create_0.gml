camera		= camera_create();
var vm		= matrix_build_lookat(x, y, -5, x, y, 0, 0, 1, 0);
var pm		= matrix_build_projection_ortho(global.gameWidth, global.gameHeight, 1, 32000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
view_camera[0] = camera;

//Follow
follow = oPlayer;
xTo = x;
yTo = y;

//Screen Shake
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
//buff = 32;