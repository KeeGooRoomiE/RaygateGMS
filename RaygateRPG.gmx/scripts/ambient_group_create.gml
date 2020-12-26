///ambient_group_create(x, y, name)
/*
 * Creates a new ambient AI group with the given name.
 *
 * x:    The x position of the leader.
 * y:    The y position of the leader.
 * name: The name of the group. Used to distinct in what group objects are.
 *
 * Returns: true if the group was able to be created, false otherwise.
*/

var _x = argument0, _y = argument1, _name = string(argument2);
if(ambient_group_exists(_name))
{
    //Show error if the group already exists.
    show_error("Error when creating ambient group with name " + _name + ", a group with that name already exists.", false);
    return false;
}
var ist = instance_create(_x, _y, obj_ambient_leader);
ist.name = _name;
return true;
