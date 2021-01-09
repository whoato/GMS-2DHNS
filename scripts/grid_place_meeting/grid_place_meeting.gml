/// @desc grid_place_meeting(x,y,grid)
/// @arg x
/// @arg y
/// @arg grid
function grid_place_meeting(argument0, argument1, argument2) {
	var _x = argument0;
	var _y = argument1;
	var _grid = argument2;

	return _grid[# _x div CELL_WIDTH, _y div CELL_HEIGHT] == VOID


}
