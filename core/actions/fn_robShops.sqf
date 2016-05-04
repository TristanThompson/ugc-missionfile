/*
    Sending robbery-request to server 
*/
private["_shop","_robber"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;

if(playersNumber west < 6) exitWith {hint "Die Kasse ist derzeit noch elektronisch verriegelt."}; //Minimum Anzahl an Cops
if(isNull _shop OR isNull _robber) exitWith {}; //Shop ist entweder Null (Map Fehler) oder Räuber ist kein Spieler
if(side _robber != civilian) exitWith {hint "Genau. Mach halt. Nein. Alter! DU HAST EINEN BEAMTENSTATUS!!!!"}; //Genau. Depp. xD
if(vehicle player != _robber) exitWith {hint "Aus dem Auto ausrauben? Da könnte ja jeder kommen!"}; //Mehrfache Beschwerden, dass aus dem KFZ ausgeraubt wird
if(currentWeapon _robber in lrl_noWeapons) exitWith {hint "Mach das du weg kommst du kleiner Schinken..."}; //Ausrauben ohne gueltige Waffe
if(_robber distance _shop > 3) exitWith {};

[_shop,_robber,_action] remoteExec ["TON_fnc_robShops",2];//now we send the info to the server to be processed further there.