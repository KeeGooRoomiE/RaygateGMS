///ambient_group_destroy(name, destroyObjectsInGroup)
/*
 * Destroys the ambient group.
 *
 * name: The name of the group.
 * destroyObjectsInGroup: If all the follower objects should be destroyed or not.
 *
 * Returns: true if the destruction succeeded, false otherwise.
*/

var _name = argument0, _destroy = argument1;
var _leader = ambient_get_leader(_name);
if(_leader == noone)
    return false;

//If all follower objects should be destroyed
if(_destroy)
{
    //Loop through all followers
    for(var i = 0; i < ds_list_size(_leader.followers); i ++)
    {
        with(ds_list_find_value(_leader.followers, i))
        {
            //Destroy them
            instance_destroy();
        }
    }
}
with(_leader)
    instance_destroy();
return true;
