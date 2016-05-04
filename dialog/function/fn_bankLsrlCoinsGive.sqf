/*
	File: fn_bankLsrlCoinsGive.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de
	
	Description:
	Wandelt die verfügbaren Coins in Geld um und schreibt dem Benutzer das Geld zu.
*/

private ["_coins","_money","_lsrl_coins"];

if(!lrl_coinsCheck) exitWith {hint localize "STR_LSRLC_CoinCheater"}; //Vorher keine Coins geprüft?

params["_points"];

if(isNil "_points") exitWith {hint localize "STR_LSRLC_NoCoinsFound"; lrl_coinsCheck = false;}; //Keine Tickets gefunden
if(_points < 1) exitWith {hint localize "STR_LSRLC_NoCoinsFound"; lrl_coinsCheck = false;}; //Punkte Wert ist 0 (?)
if(!alive player) then {hint localize "STR_LSRLC_DeadAfterChecked"; lrl_coinsCheck = false;};

_lsrl_coins = _points;
_money = _lsrl_coins;

c00l3_b4Nck3h13R = c00l3_b4Nck3h13R + _money;

playSound "coins";
hint parseText format ["<t size='1.6' color='#FFD700' align='center'>LSRL Coins-System</t><br/><br/><t align='center'><t size='1.25'>Es wurden dir <br/><t color='#62c736'>$%1</t><br/> gutgeschrieben.</t></t>", [_money] call life_fnc_numberText];
lrl_coinsCheck = false; //Prozedur beendet.
[0,format["Finanzieller Aufschwung - Bürger tauschen ihre LSRL-Coin-Reserven gegen Finanzmittel."]] remoteExec ["life_fnc_broadcast",0]; 

[1] call SOCK_fnc_updatePartial;
