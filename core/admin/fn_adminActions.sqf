#include <macro.h>
/*
	File: fn_adminActions.sqf
	Author: Bastian "Janl1.DE" Schumacher
  Server: lakeside-reallife.de

	Description:
	Verschiedene Actions für Admins

*/

_action = _this select 0;

if(lrl_noAdmin) exitWith {};
  if(__GETC__(life_adminlevel) < 2) exitWith {};

    switch (_action) do {
      case "GETOUT": {player action ["getOut", vehicle player];};
      case "GETIN": {player action ["getInCargo", vehicle cursorTarget];};
    };
