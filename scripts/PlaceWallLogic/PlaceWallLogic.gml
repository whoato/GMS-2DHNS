function PlaceWallLogic(argument0, argument1) {
	var _x = argument0;
	var _y = argument1;

	var numWalls = GetAdjacentWalls(_x, _y, 1, 1, VOID);
	//var numFloors = GetAdjacentWalls(_x, _y, 1, 1, FLOOR);

	if (oLevel.grid_[# _x, _y] == VOID) {
		if (numWalls >= 4) return VOID;
		if (numWalls <= 3) return FLOOR;
	}
	else {
		if (numWalls >= 6) return VOID;	
	}
	return FLOOR;


}
