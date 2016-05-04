/*
    File: fn_seizeWeapon.sqf
    Author: Skalicon
    
    Description:

*/

_clear = nearestObjects [player,["weaponholder"],3];
_destroyed = 0;
for "_i" from 0 to count _clear - 1 
do
{
    _destroyed = _destroyed + 1;
    deleteVehicle (_clear select _i);
    sleep 0.1;
};

titleText[format["%1 Objekte wurden entfernt.", _destroyed],"PLAIN"];
[51, player, format["%1 Objekte wurden entfernt.", _destroyed]] remoteExec ["STS_fnc_logIt",2];