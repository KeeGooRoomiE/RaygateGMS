///setupPathfinding(WORLD_SIZE, TILE_SIZE <Power of 2>)

globalvar WORLD_SIZE, GRID_SIZE, AI_MAP, PATHFIND_GRID, PATHFIND_QUEUE;

WORLD_SIZE = argument0;
GRID_SIZE = argument1;

AI_MAP = mp_grid_create(0, 0, WORLD_SIZE / GRID_SIZE, WORLD_SIZE / GRID_SIZE, GRID_SIZE, GRID_SIZE);
PATHFIND_GRID = ds_grid_create(WORLD_SIZE / GRID_SIZE, WORLD_SIZE / GRID_SIZE);
PATHFIND_QUEUE = ds_priority_create();
