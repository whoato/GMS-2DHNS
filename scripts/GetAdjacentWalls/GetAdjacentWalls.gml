function GetAdjacentWalls(argument0, argument1, argument2, argument3, argument4) {
	var _x = argument0;
	var _y = argument1;
	var _scopeX = argument2;
	var _scopeY = argument3;
	var _w = argument4;

	var startX = _x - _scopeX;
	var startY = _y - _scopeY;
	var endX = _x + _scopeX;
	var endY = _y + _scopeY;

	var iX = startX;
	var iY = startY;

	var wallCounter = 0;

	for (iY = startY; iY <= endY; iY++) {
		for (iX = startX; iX <= endX; iX++) {
			if (!(iX == _x && iY == _y) && IsWall(iX, iY, _w)) {
				wallCounter += 1;
			}
		}
	}

	return wallCounter;


}
