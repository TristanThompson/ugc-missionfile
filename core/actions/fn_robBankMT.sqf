/*
    Sending robbery-request to server 
*/
private["_shop","_robber"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;

if(playersNumber west < 7) exitWith { hint "Das Zeitschloss des Tresors ist derzeit noch aktiv!"};
if(isNull _shop OR isNull _robber) exitWith {};
if(side _robber != civilian) exitWith { hint "Korruptes Schwein verschwinde!" };// We do not want anyone but civilianz to rob the stations.
if(vehicle player != _robber) exitWith { hint "Wie bist du mit dem Auto in die Bank gekommen? Verschwinde!" };
if(currentWeapon _robber in lrl_noWeapons) exitWith {hint "Ohne Waffe nix los. Wenn nix los, gibt's kein Moos."}; //Ausrauben ohne gueltige Waffe
if(_robber distance _shop > 3) exitWith { hint "Wie lange Arme hast du denn? Du bist zu weit weg!" };
if(!([false,"bohrmaschine",1] call life_fnc_handleInv)) exitWith {hint "Du benötigst eine Bohrmaschine in deinem Inventar um den Bankraub zu beginnen!"};

[_shop,_robber,_action] remoteExec ["TON_fnc_robBankMT",2];//now we send the info to the server to be processed further there.