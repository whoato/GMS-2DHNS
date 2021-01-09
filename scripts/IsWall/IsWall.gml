function IsWall(argument0, argument1, argument2) {
	var _x = argument0;
	var _y = argument1;
	var _w = argument2;

	var grid = oLevel.grid_[# _x, _y];

	if (_w == VOID) {
		if ( _x < 0 || _y < 0) return true;
		else if ( _x > oLevel.width_ || _y > oLevel.height_) return true;
	}
	else {
		if ( _x < 0 || _y < 0) return false;
		else if ( _x > oLevel.width_ || _y > oLevel.height_) return false;
	}
	if (grid == _w) return true;
	else if (grid != _w) return false;
	return false;


}
