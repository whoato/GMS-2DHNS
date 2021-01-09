// 진행상황을 나타내기 위해 pers 사용

pers = 0;
randomise();

//shadowSurface = noone;

// Get the tile layer map id
var mainid = layer_get_id("mainTiles");
maintile = layer_tilemap_get_id(mainid);

// Initialize Grid
width_ = room_width / CELL_WIDTH;
height_ = room_height / CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);
ds_grid_set_region(grid_, 0, 0, width_, height_, VOID);

// Create Pathfinding grid
//grid_path = mp_grid_create(0, 0, width_, height_, CELL_WIDTH, CELL_HEIGHT);

pers = 10;
// R. L. G.
var wallProb = 60;
{
	var mid = int64(height_ / 2);
	for (var row = 2; row < height_ - 2; row++) {
		for (var column = 2; column < width_ - 2; column++) {
			if (row == mid) {
				grid_[# column, row] = FLOOR;
			}
			else {
				if (irandom(100) < wallProb)
					grid_[# column, row] = VOID;
				else
					grid_[# column, row] = FLOOR;
			}
		}
	}
	instance_create_layer(mid * CELL_WIDTH, mid * CELL_HEIGHT, "Instances", oPlayer);
}

pers = 30;
//cellular automata
repeat(10) {
	for (var column = 2, row = 2; row <= height_ - 2; row++) {
		for (column = 2; column <= width_ - 2; column++) {
			grid_[# column, row] = PlaceWallLogic(column, row);
		}
	}
}

pers = 60;
//find wall
for (var yy = 2; yy < height_ - 2; yy++) {
	for (var xx = 2; xx < width_ - 2; xx++) {
		if (grid_[# xx, yy] == VOID && GetAdjacentWalls(xx, yy, 1, 1, FLOOR)) {
			grid_[# xx, yy] = WALL;
		}
	}
}

pers = 80;
for (var yy = 0; yy < height_; yy++) {
	for (var xx = 0; xx < width_; xx++) {
		if (grid_[# xx, yy] == FLOOR) {
			tilemap_set(maintile, 1, xx, yy);
		}
		else if (grid_[# xx, yy] == WALL) {
			tilemap_set(maintile, 2, xx, yy);
		}
		else if (grid_[# xx, yy] == VOID) {
			tilemap_set(maintile, 3, xx, yy);
		}
	}
}

pers = 100;
//// Remove Single VOID tile
//for (var yy = 1; yy < height_ - 1; yy++) {
//	for (var xx = 1; xx < width_ - 1; xx++) {
//		if (grid_[# xx, yy] != FLOOR && grid_[# xx, yy] != WALL) {
//			var tileIndex =	NORTH * (grid_[# xx, yy - 1] == VOID)
//							+ WEST * (grid_[# xx - 1, yy] == VOID)
//							+ EAST * (grid_[# xx + 1, yy] == VOID)
//							+ SOUTH * (grid_[# xx, yy + 1] == VOID) + 1;
//			if (tileIndex == 1) {
//				grid_[# xx, yy] = FLOOR;
//			}
//		}
//		//else if (grid_[# xx, yy] == WALL) {
//		//	var conn = (grid_[# xx, yy - 1] == FLOOR)
//		//				+ (grid_[# xx, yy + 1] == FLOOR)
//		//				+ (grid_[# xx - 1, yy] == FLOOR)
//		//				+ (grid_[# xx + 1, yy] == FLOOR);
//		//	if (conn < 2) {
//		//		grid_[# xx, yy] = VOID;	
//		//	}
//		//}
//	}
//}

//// Draw tiles
//for (var yy = 1; yy < height_ - 1; yy++) {
//	for (var xx = 1; xx < width_ - 1; xx++) {
//		if (grid_[# xx, yy] != FLOOR) {
//			var tileIndex =	NORTH * (grid_[# xx, yy - 1] == VOID)
//							+ WEST * (grid_[# xx - 1, yy] == VOID)
//							+ EAST * (grid_[# xx + 1, yy] == VOID)
//							+ SOUTH * (grid_[# xx, yy + 1] == VOID);
//			tilemap_set(maintile, tileIndex, xx, yy);
//			if (tileIndex < 15) { //instance_create_layer(xx * 32 + 16, yy * 32 + 16, "Instances", objWall);
//				instance_create_layer(xx * CELL_WIDTH, yy * CELL_HEIGHT, "Instances", objWall16);
//				instance_create_layer(xx * CELL_WIDTH + CELL_WIDTH / 2, yy * CELL_HEIGHT + CELL_HEIGHT / 2, "Instances", objWall16);
//				instance_create_layer(xx * CELL_WIDTH + CELL_WIDTH / 2, yy * CELL_HEIGHT, "Instances", objWall16);
//				instance_create_layer(xx * CELL_WIDTH, yy * CELL_HEIGHT + CELL_HEIGHT / 2, "Instances", objWall16);
//			}
//			mp_grid_add_cell(grid_path, xx, yy);
//		} else {
//			//instance_create_layer(xx * 32 + 16, yy * 32 + 16, "Instances", objWall);
//			tilemap_set(maintile, 16, xx, yy);
//		}
//	}
//}

//delete useless walltiles


//mp_grid_add_instances(grid_path, objEnemy, true);
_monster_time = room_speed * 30;
_monster_count = 100;
_monster_left = 0;