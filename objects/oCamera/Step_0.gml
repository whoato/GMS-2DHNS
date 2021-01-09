//Update position
x = xTo;
y = yTo;

//To use follow obj
//+= (xTo - x) / 1;
//+= (yTo - y) / 1;

if (follow != noone) {
	xTo = follow.x
	yTo = follow.y
	if (abs(mouse_x - xTo)) {
		xTo = follow.x + (mouse_x - xTo) / 4;
	}
	if (abs(mouse_y - yTo)) {
		yTo = follow.y + (mouse_y - yTo) / 4;	
	}
	
	//Screen shake
	xTo += random_range(-shake_remain, shake_remain);
	yTo += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));
}

//Update camera view
camera_set_view_mat(camera, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));