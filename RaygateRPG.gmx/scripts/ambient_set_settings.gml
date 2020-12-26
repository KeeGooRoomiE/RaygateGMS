///ambient_set_settings(leader, maximumRadius, randomMovePercentage, minimumSpeed, maximumSpeed)
/*
 * Sets the settings for the leader of the ambient group.
 *
 * leader:               The leader of the ambient group.
 * maximumRadius:        The maximum radius of which the followers can be.
 * randomMovePercentage: The percentage of which the followers will move. Lower percentage
 *                       gives less movement.
 * minimumSpeed:         The minimum speed the followers can have.
 * maximumSpeed:         The maximum speed the followers can have.
 *
 * Returns: None
*/
if(!instance_exists(argument0))
    return false;
argument0.maximumRadius = argument1;
argument0.randomMovePercentage = argument2;
argument0.minimumSpeed = argument3;
argument0.maximumSpeed = argument4;
