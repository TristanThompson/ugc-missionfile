/*
	File: fn_questionDealer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Questions the drug dealer and sets the sellers wanted.
*/

private["_names"];
private _cost = lrl_dealerCost;
private _chance = lrl_dealerChance;
private _sellers = (_this select 0) getVariable["sellers",[]];

_abfrage = [format["Möchtest du den Dealer mit %1 %2 bestechen?","$",_cost],"Dealer Befragen","Ja","Nein"] call BIS_fnc_guiMessage;

life_action_inUse = true;
if(_abfrage) then {

	if(v4r14t0X_isTc00L < _cost) exitWith {hint localize "STR_Dealer_NoMoneyWtf"; life_action_inUse = false;};
	v4r14t0X_isTc00L = v4r14t0X_isTc00L - _cost;

	hint localize "STR_Dealer_WaitMsg";
	sleep 1; [0] call SOCK_fnc_updatePartial;
	sleep 4.5;

	if(count _sellers == 0) exitWith {hint localize "STR_Dealer_NobodySold"; life_action_inUse = false;};
	if(player distance (_this select 0) > 9) exitWith {hint "Dann hau eben ab! Von mir bekommste sicherlich nichts mehr gesagt."; life_action_inUse = false; (_this select 0) setVariable["sellers",[],true];};
	if(!alive player) exitWith {life_action_inUse = false; (_this select 0) setVariable["sellers",[],true];};
	if(round(random 100) <= _chance) then {
		_names = "";
		{
			if(_x select 2 > 150000) then {
				_val = round((_x select 2) / 16);
			};

			[_x select 0,_x select 1,"483",_val] remoteExec ["life_fnc_wantedAdd",2];
			_names = _names + format["%1<br/>",_x select 1];
		} foreach _sellers;

		hint parseText format[(localize "STR_Dealer_SomeoneSold")+ "<br/><br/>%1",_names];
	} else {
		hint localize "STR_Dealer_NobodySold";
	};

	(_this select 0) setVariable["sellers",[],true];

} else {
	hint localize "STR_Dealer_NoMoney";
};
life_action_inUse = false;
