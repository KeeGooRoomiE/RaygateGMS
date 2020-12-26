///isPathObscured(xstart, ystart, xgoal, ygoal)

var xs, ys, xg, yg, xs, ys, xg, yg, alpha, G_S;

G_S = log2(GRID_SIZE); //Calculate this manually to make it a constant
 
xs = (argument[0] >> G_S) + 0.5;
ys = (argument[1] >> G_S) + 0.5;
xg = (argument[2] >> G_S) + 0.5;
yg = (argument[3] >> G_S) + 0.5;

alpha = point_direction(xs, ys, xg, yg);

while(xs != xg || ys != yg)
{
xs += sign(dcos(alpha));
ys -= sign(dsin(alpha));

if(mp_grid_get_cell(AI_MAP, xs, ys) == -1){return true;}
}

return false;
