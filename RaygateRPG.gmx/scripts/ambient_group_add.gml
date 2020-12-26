///ambient_group_add(name, id1, [id2], [id3], ...)
/*
 * Adds the given object to the given ambient AI group, if it exists.
 *
 * name: The name of the group.
 * id1:  The id to add.
 * [id] (optional): The id to add, used if you want to add multiple followers at the same 
 *                  time.
 * 
 * Returns: true if the adding succeeded, false otherwise.
*/

var _name = argument[0];
var _leader = ambient_get_leader(_name);

if(_leader == noone)
    return false;

//Add followers to the leader's list.
for(var i = 1; i < argument_count; i ++)
{
    ds_list_add(_leader.followers, argument[i]);
    argument[i].ambientTargetX = -1;
    argument[i].ambientTargetY = -1;
}
return true;
