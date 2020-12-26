///ambient_get_leader_object(id)
/*
 * Gets the leader object of the group that the given object is part of.
 *
 * id: The object id to get the group leader of.
 *
 * Returns: The leader object, or noone if the object is not part of any ambient group.
*/

//Loop through all leaders
for(var i = 0; i < obj_ambient_leader; i ++)
{
    var ist = instance_find(obj_ambient_leader, i);
    for(var j = 0; j < ds_list_size(ist.followers); i ++)
    {
        if(ist.followers[| j] == argument0)
            return ist;
    }
}
return noone;
