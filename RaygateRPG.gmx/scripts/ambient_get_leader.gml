///ambient_get_leader(name)
/*
 * Gets the leader object of the group with the given name.
 *
 * name: The name of the group to get the leader from.
 *
 * Returns: The leader of the group, or noone if there is no group with the given name.
*/

//Loop through all leaders
for(var i = 0; i < instance_number(obj_ambient_leader); i ++)
{
    var ist = instance_find(obj_ambient_leader, i);
    if(ist.name = argument0)
        return ist.id;
}
return noone;
