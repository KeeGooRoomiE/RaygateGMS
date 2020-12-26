///convertToPath(deltaQueue <list>, path)
//--Generates a GM built-in path from a delta queue

gml_pragma("forceinline");

var l = argument0;
var xx, yy;
xx = floor(x / GRID_SIZE) * GRID_SIZE + sprite_get_xoffset(sprite_index);
yy = floor(y / GRID_SIZE) * GRID_SIZE + sprite_get_yoffset(sprite_index);

path_end();
path_clear_points(argument1);
path_set_closed(argument1, false);

for(i=0;i<=ds_list_size(l);i++)
{
path_add_point(argument1, xx, yy, 1);

var I = floatToCoords(l[| i]);
xx += I[0] * GRID_SIZE;
yy += I[1] * GRID_SIZE;
}
