///setMovement()

ds_list_clear(baseMove);

//Horz-vert movement

if(movement == 0)
{
ds_list_add(baseMove, coordsToFloat(-1, 0));
ds_list_add(baseMove, coordsToFloat(1, 0));
ds_list_add(baseMove, coordsToFloat(0, -1));
ds_list_add(baseMove, coordsToFloat(0, 1));

allowObstacleJump = false;
}

//Diagonal movement

if(movement == 1)
{
ds_list_add(baseMove, coordsToFloat(-1, -1));
ds_list_add(baseMove, coordsToFloat(1, 1));
ds_list_add(baseMove, coordsToFloat(1, -1));
ds_list_add(baseMove, coordsToFloat(-1, 1));

allowObstacleJump = false;
}

//Knight movement (Chess piece)

if(movement == 2)
{
ds_list_add(baseMove, coordsToFloat(-2, -1));
ds_list_add(baseMove, coordsToFloat(-2, 1));
ds_list_add(baseMove, coordsToFloat(2, -1));
ds_list_add(baseMove, coordsToFloat(2, 1));

ds_list_add(baseMove, coordsToFloat(-1, -2));
ds_list_add(baseMove, coordsToFloat(-1, 2));
ds_list_add(baseMove, coordsToFloat(1, -2));
ds_list_add(baseMove, coordsToFloat(1, 2));

allowObstacleJump = true;
}

//Rook movement (Chess piece)

if(movement == 3)
{
for(s=0;s<4;s++)
 {
 ds_list_add(baseMove, coordsToFloat(-s, 0));
 ds_list_add(baseMove, coordsToFloat(s, 0));
 ds_list_add(baseMove, coordsToFloat(0, -s));
 ds_list_add(baseMove, coordsToFloat(0, s));
 }

allowObstacleJump = true;
}

doPath = true;
