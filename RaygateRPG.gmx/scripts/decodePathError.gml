///decodePathError(error_code)

switch(argument0)
{
case -1: return "Goal is equal to starting point!"; break;
case -2: 
case -3: return "Goal is on collision!"; break;
case -4: return "Ran out of attempts!"; break;
case -5: return "Goal is unreachable!"; break;
case -6: return "No movement possible towards goal!"; break;

default: return "Unknown error code!"; break;
}
