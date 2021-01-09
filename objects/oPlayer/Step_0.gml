//obj_player - Step
//Set Speed
var x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

x_speed += x_input * acceleration;
y_speed += y_input * acceleration;

//Set Max Speed
var _speed = point_distance(0, 0, x_speed, y_speed);
var _direction = point_direction(0, 0, x_speed, y_speed);
if _speed > max_speed {
	x_speed = lengthdir_x(max_speed, _direction);
	y_speed = lengthdir_y(max_speed, _direction);
}

//Reduce Speed Slowly
if (x_input == 0) x_speed = lerp(x_speed, 0, 0.3);
if (y_input == 0) y_speed = lerp(y_speed, 0, 0.3);

//Tilemap Collision

//Horizontal Collision
var bbox_side = x_speed > 0 ? bbox_right + 1 : bbox_left;
if (grid_place_meeting(bbox_side + x_speed, bbox_top, oLevel.grid_) ||
	grid_place_meeting(bbox_side + x_speed, bbox_bottom, oLevel.grid_))
{
	if (x_speed > 0) x = x - (x % CELL_WIDTH) + CELL_WIDTH - 1 - (bbox_right - x);
	else x = x - (x % CELL_WIDTH) - (bbox_left - x);
	x_speed = 0;
}

x += x_speed;

//Vertical Collision
bbox_side = y_speed > 0 ? bbox_bottom + 1: bbox_top;
if (grid_place_meeting(bbox_left, bbox_side + y_speed, oLevel.grid_) ||
	grid_place_meeting(bbox_right, bbox_side + y_speed, oLevel.grid_))
{
	if (y_speed > 0) y = y - (y % CELL_HEIGHT) + CELL_HEIGHT - 1 - (bbox_bottom - y);
	else y = y - (y % CELL_HEIGHT) - (bbox_top - y);
	y_speed = 0;
}

y += y_speed;