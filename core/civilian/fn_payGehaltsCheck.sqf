/*
	File: fn_payGehaltsCheck.sqf
	Author: Bastian "Janl1.DE" Schumacher
    based on: fn_bankLsrlCoinsGive.sqf
      by: Marcel "Variatox" Koch

  Server: lakeside-reallife.de

	Description:
	Zahlt den PayCheck aus
*/

private ["_m0n3y","_n3Wm0n33yl3l","_n3w"];

if(!lrl_coinsCheck) exitWith {hint "Es ist ein Fehler aufgetreten! Melde dich im Bürgerbüro! Code: 0x0173719";};

params["_m0n3y"];

if(isNil _m0n3y) exitWith {hint "Es ist ein Fehler aufgetreten! Melde dich im Bürgerbüro! Code: 0x0921307"; lrl_coinsCheck = false;};
if(_m0n3y < 1) exitWith {hint "Es ist ein Fehler aufgetreten! Melde dich im Bürgerbüro! Code: 0x0134751"; lrl_coinsCheck = false;};

_n3Wm0n33yl3l = _m0n3y;
_n3w = _n3Wm0n33yl3l;

c00l3_b4Nck3h13R = c00l3_b4Nck3h13R + _n3w;
playSound "coins";
hint parseText format ["<t size='1.6' color='#FFD700' align='center'>Gehaltscheck</t><br/><br/><t align='center'><t size='1.25'>Es wurden dir <br/><t color='#62c736'>$%1</t><br/> gutgeschrieben.</t></t>", [_n3w] call life_fnc_numberText];

lrl_coinsCheck = false;
[1] call SOCK_fnc_updatePartial;
