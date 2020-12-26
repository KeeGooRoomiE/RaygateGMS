///findPath(delta_queue <list>, xstart, ystart, xgoal, ygoal, allow_obstacle_jump)

var G_S = log2(GRID_SIZE); //Calculate this manually to make it a constant
var path = argument0;
var xs = (argument1 >> G_S) << G_S;
var ys = (argument2 >> G_S) << G_S;
var xg = (argument3 >> G_S) << G_S;
var yg = (argument4 >> G_S) << G_S;
var _jump = argument5;

if(xs == xg && ys == yg){return -1;}
if(mp_grid_get_cell(AI_MAP, xg >> G_S, yg >> G_S) == -1){return -2;}

var l = PATHFIND_GRID;
ds_grid_clear(l, INFINITY);
ds_list_clear(path);

var queue = PATHFIND_QUEUE;
ds_priority_clear(queue);
ds_priority_add(queue, packArray(xg, yg, 1), 0);

//--Mark cells
var xx, yy, x_, y_;
var d = 1;
var done = false;

ds_grid_set(l, xg >> G_S, yg >> G_S, 0);

//--Setup grid
var a, I, d_, pdist;
while(ds_priority_size(queue) > 0 && !done && d < 1600) //(d < 1600) is a check to limit search; You may toy around with the value, or leave it out
{
a = ds_priority_delete_min(queue);
xx = a[0];
yy = a[1];
d_ = a[2];

for(s=0;s<ds_list_size(baseMove);s++)
 {
 I = floatToCoords(baseMove[| s]);
  
 x_ = (xx >> G_S) + I[0];
 y_ = (yy >> G_S) + I[1];
 
 if(x_ < 0 || y_ < 0 || x_ >= (WORLD_SIZE >> G_S) || y_ >= (WORLD_SIZE >> G_S)){continue;}
 if(!_jump && abs(I[0]) > 1 && abs(I[1]) <= 1 && isPathObscured(xx, yy, xx + (I[0] << G_S), yy)){continue;}
 if(!_jump && abs(I[1]) > 1 && abs(I[0]) <= 1 && isPathObscured(xx, yy, xx, yy + (I[1] << G_S))){continue;}
 if(!_jump && abs(I[0]) > 1 && abs(I[1]) > 1 && isPathObscured(xx, yy, xx + (I[0] << G_S), yy + (I[1] << G_S))){continue;}
 
 if(l[# x_, y_] == INFINITY)
  {
  if(mp_grid_get_cell(AI_MAP, x_, y_) == -1){ds_grid_set(l, x_, y_, INFINITY - 1);}
  else
   {
   ds_grid_set(l, x_, y_, d_);
   
   pdist = sqr(x_ - (xs >> G_S)) + sqr(y_ - (ys >> G_S));
   ds_priority_add(queue, packArray(xx + (I[0] << G_S), yy + (I[1] << G_S), d_ + 1), pdist);
   }
  }
 }
if(xx == xs && yy == ys){done = true;}else{d++;}
}

if(l[# xg >> G_S, yg >> G_S] >= INFINITY - 1){return -3;}
if(d >= 1600){return -4;}
if(ds_priority_size(queue) <= 0 && !done){return -5;}

//--Find path
xx = xs;
yy = ys;
d = 1600;

var m, g, dx, dy, s, I, mdist;
dx = 0;
dy = 0;

m = INFINITY;

while((xx != xg || yy != yg) && d > 0)
{
mdist = INFINITY;

for(s=0;s<ds_list_size(baseMove);s++)
 {
 I = floatToCoords(baseMove[| s]);
 x_ = (xx >> G_S) + I[0];
 y_ = (yy >> G_S) + I[1];
 
 if(x_ < 0 || y_ < 0 || x_ >= (WORLD_SIZE >> G_S) || y_ >= (WORLD_SIZE >> G_S)){continue;}
 if(!_jump && abs(I[0]) > 1 && abs(I[1]) <= 1 && isPathObscured(xx, yy, xx + (I[0] << G_S), yy)){continue;}
 if(!_jump && abs(I[1]) > 1 && abs(I[0]) <= 1 && isPathObscured(xx, yy, xx, yy + (I[1] << G_S))){continue;}
 if(!_jump && abs(I[0]) > 1 && abs(I[1]) > 1 && isPathObscured(xx, yy, xx + (I[0] << G_S), yy + (I[1] << G_S))){continue;}
 
 g = ds_grid_get(l, x_, y_);
 
 pdist = sqr(x_ - (xg >> G_S)) + sqr(y_ - (yg >> G_S));
 if(g < m || (g <= m && pdist < mdist)){m = g; mdist = pdist; dx = I[0]; dy = I[1];}
 }

if(dx == 0 && dy == 0){return -6;}

xx += (dx << G_S);
yy += (dy << G_S);

ds_list_add(path, coordsToFloat(dx, dy));

dx = 0;
dy = 0;
d--;
}

return true;
