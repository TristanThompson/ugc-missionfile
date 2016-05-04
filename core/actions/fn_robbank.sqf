/*
    Sending robbery-request to server 
*/

params[
	["_shop",ObjNull,[ObjNull]],
	["_robber",ObjNull,[ObjNull]],
	"_action"
];

if(isNull _shop OR isNull _robber) exitWith {};
if(currentWeapon _robber in lrl_noWeapons) exitWith {hint "Ohne Waffe nix los. Wenn nix los, gibt's kein Moos."}; //Ausrauben ohne gueltige Waffe
if(playersNumber west < 7) exitWith { hint "Das Zeitschloss des Tresors ist derzeit noch aktiv!"};
if(side _robber != civilian) exitWith { hint "Korruptes Schwein verschwinde!" };// We do not want anyone but civilianz to rob the stations.
if(vehicle player != _robber) exitWith { hint "Wie bist du mit dem Auto in die Bank gekommen? Verschwinde!" };
if(_robber distance _shop > 3) exitWith { hint "Wie lange Arme hast du denn? Du bist zu weit weg!" };
if(!([false,"bohrmaschine",1] call life_fnc_handleInv)) exitWith {hint "Du benötigst eine Bohrmaschine in deinem Inventar um den Bankraub zu beginnen!"};

[_shop,_robber,_action] remoteExec ["TON_fnc_robBank",2];