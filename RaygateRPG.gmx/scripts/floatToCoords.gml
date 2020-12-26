///floatToCoords(float)

var pos;
pos[0] = (argument0 & 31) - 16;
pos[1] = ((argument0 >> 5) & 31) - 16;

return pos;
