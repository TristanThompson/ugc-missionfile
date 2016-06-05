/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
#include <macro.h>

private _player = player;
private _ctrl = _this select 0;
private _code = _this select 1;
private _shift = _this select 2;
private _ctrlKey = _this select 3;
private _alt = _this select 4;
private _speed = speed cursorTarget;
private _handled = false;
private _veh = vehicle player;
private _cursorT = cursorTarget;

private _copPlayer = if(playerSide == west) then {true} else {false};
//_medPlayer = if(playerSide == independent) then {true} else {false};
//_ipdPlayer = if(playerSide == east) then {true} else {false};

private _coplevel = if(__GETC__(life_donator) >= 2) then {true} else {false};	// Donator Level abhängig! 2-3 = State, 4-5 = FBI

private _interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0}; //46 war 219
private _mapKey = actionKeys "ShowMap" select 0;

private _interruptionKeys = [17,30,31,32]; //A,S,W,D

//Dachtaste ' ^° ' und Tactical View und Commander Modus deaktivieren!
if((_code in (actionKeys "SelectAll") || _code in (actionKeys "ForceCommandingMode") || _code in (actionKeys "TacticalView"))) then {
	_handled = true;
};


//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "SitDown") || _code in (actionKeys "Gear") || _code in (actionKeys "Throw") || _code in (actionKeys "salute") || _code in (actionKeys "ReloadMagazine"))
&& {(player getVariable ["ace_captives_isHandcuffed",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if((!life_action_inUse) && (!delay_pickaxe)) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{
	//Oe Taste
	case 39:
	{
		if (isNull(findDisplay 20000)) then {
			switch (playerSide) do {
				case west: {
					[] spawn life_fnc_placeablesMenu;
					_handled = true;
				};

				case independent: {
					[] spawn life_fnc_placeablesMenu;
					_handled = true;
				};

				case east: {
					_adaclevel = call life_adaclevel;
					if(_adaclevel < 9) then {
						[] spawn life_fnc_placeablesMenu;
						_handled = true;
					};
				};
			};
		};
		_handled = true;
	};

	//Space key for Jumping
	case 57:
	{
		if(life_barrier_active) then {
			[] spawn life_fnc_placeablesPlaceComplete;
		};
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[player,false] remoteExec ["life_fnc_jumpFnc",0];
			_handled = true;
		};
	};

	//Map Key
	case _mapKey:
	{
		switch (playerSide) do
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMapMarker;}};
			case east: {if(!visibleMap) then {[] spawn life_fnc_adacMarker;}};
		};
	};

	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey) then {
			if(currentWeapon player != "") then {
				life_curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchcamera cameraView;
			};
			_handled = true;
		};

		if(!_shift && _ctrlKey) then {
			if(!isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
				if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
					player selectWeapon life_curWep_h;
				};
			};
			_handled = true;
		};

		if(_shift && _alt && !_ctrlKey) then {
			if(!dialog) then {
				[] call life_fnc_openHandy
			};
			_handled = true;
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if((!life_action_inUse) && (!delay_pickaxe)) then {
			[] spawn
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
				_handled = true;
			};
		};
	};

	//C Key
    case 15:
    {
		if((vehicle player == player) && !_alt && !_ctrlKey && playerside == civilian && !life_action_inUse && !lrl_knockedOut && !life_knockout && !life_istazed && !delay_pickaxe) then {
			if(!dialog) then {
				[] call life_fnc_Farmmenu;
				_handled = true;
			};
		};
    };

	//Niederschlagen
	case 34:
	{
		if(_shift) then {
			if(currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) then {
				[_cursorT] spawn life_fnc_knockoutAction;
				_handled = true;
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			} else {
				if((_cursorT isKindOf "Car" OR _cursorT isKindOf "Air" OR _cursorT isKindOf "Ship" OR _cursorT isKindOf "A3L_Tahoe_Base" OR _cursorT isKindOf "Motorcycle" OR _cursorT isKindOf "House_F") && player distance _cursorT < 5 && vehicle player == player && alive _cursorT) then {
					if(!life_istazed && !life_knockout && !lrl_knockedOut && !(player getVariable "ace_captives_isHandcuffed")) then {
						if((count (player nearObjects["Man",4]) <= 1)) then {
							if(_cursorT in life_vehicles OR {!(_cursorT getVariable ["locked",true])}) then {
								[_cursorT] call life_fnc_openInventory;
							};
						} else {
							hint "Du kannst nicht auf den Kofferraum zugreifen, während eine Person bei dir im Umkreis (7 Meter) ist!";
						};
					};
				};
			};
			_handled = true;
		};
	};

	//L Key?
	case 38:{
		if(!_alt && !_ctrlKey && _veh == player) exitWith {	_handled = true; [] call life_fnc_radar;};

		if(_veh != player)then{
			if(_shift && !_ctrlKey && side player == west)exitWith{
				true;	// direct returns because its an exitWith
				if((driver _veh) == player)then{
					if!(isNil{_veh getVariable "xcar"})then{
						[_veh] spawn life_fnc_EinsatzLicht;
					}else{
						if(life_inv_blaulicht != 0 )then{
							[false,"blaulicht",1] call life_fnc_handleInv;
							_veh setVariable["xcar",["BL_car",false,nil],true];
						};
					};
				};
			};
			if(_ctrlKey && !_shift && side player == west)exitWith{
				true;
				if((driver _veh) == player)then{
					if!(isNil {_veh getVariable "xcar"})then{
						private["_xcar"];
						_xcar =_veh getVariable "xcar";
						if!(isNil{_xcar select 2})then{
							if(_xcar select 0 == "BL_car") then {
								[true,"blaulicht",1] call life_fnc_handleInv;
								_veh setVariable["xcar",nil,true];
							}else{
								_veh setVariable["xcar",[_xcar select 0,false,nil],true];
							};
							{
								if(typeOf _x == "UGC_Einsatzlicht_Blau")then{
									detach _x;
									deleteVehicle _x;
								};
							} forEach attachedObjects _veh;
						};
					};
				};
			};
		};
	};

	// ENDE
	case 207: {
		if(_ctrlKey && !_shift) then {
			if((call(life_adminlevel) == 3) && (playerSide in [civilian,west])) then {
				if(vehicle player != player && !life_umbrellus_active && ((driver vehicle player) == player)) then {
					[] spawn {
					life_umbrellus_active = true;
						sleep 14;
						systemChat "Sirene kann deaktiviert werden.";
					life_umbrellus_active = false;
					};
					_veh = vehicle player;
					if(isNil {_veh getVariable "umbrellus"}) then {_veh setVariable["umbrellus",false,true];};

					if((_veh getVariable "umbrellus")) then {
						titleText ["= Admin-Sirene 1 AUS =","PLAIN"];
						_veh setVariable["umbrellus",false,true];
					} else {
						titleText ["= Admin-Sirene 1 AN =","PLAIN"];
						_veh setVariable["umbrellus",true,true];
						[_veh] remoteExec ["life_fnc_umbrellus",-2];
					};
				};
			};
			_handled = true;
		};

		if(_ctrlKey && _shift) then {
			if((call(life_adminlevel) == 3) && (playerSide in [civilian,west])) then {
				if(vehicle player != player && !life_umbrellus2_active && ((driver vehicle player) == player)) then {
					[] spawn {
					life_umbrellus2_active = true;
						sleep 14;
						systemChat "Sirene kann deaktiviert werden.";
					life_umbrellus2_active = false;
					};
					_veh = vehicle player;
					if(isNil {_veh getVariable "umbrellus2"}) then {_veh setVariable["umbrellus2",false,true];};

					if((_veh getVariable "umbrellus2")) then {
						titleText ["= Admin-Sirene 2 AUS =","PLAIN"];
						_veh setVariable["umbrellus2",false,true];
					} else {
						titleText ["= Admin-Sirene 2 AN =","PLAIN"];
						_veh setVariable["umbrellus2",true,true];
						[_veh] remoteExec ["life_fnc_umbrellus2",-2];
					};
				};
			};
			_handled = true;
		};
	};

	// F
	case 33: {
		if(_copPlayer && _ctrlKey) then {				// ***** Polizei Sirene (FBI UND STATEPOLICE) *******
			if(license_cop_fbi OR license_cop_swat) then {
				if(vehicle player != player && !life_siren_active &&((driver vehicle player) == player)) then {
					[] spawn {
						life_siren_active = true;
						sleep 6.547;
						life_siren_active = false;
					};
						_veh = vehicle player;
						if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};

						if((_veh getVariable "siren")) then {
							titleText ["= Wail-Sirene AUS =","PLAIN"];
							_veh setVariable["siren",false,true];
						} else {
							titleText ["= Wail-Sirene AN =","PLAIN"];
							_veh setVariable["siren",true,true];
							[_veh] remoteExec ["life_fnc_copSiren",-2];
						};
				};
			} else {
				if(vehicle player != player && !lrl_copSiren_alter &&((driver vehicle player) == player)) then {
					[] spawn {
						lrl_copSiren_alter = true;
						sleep 5.5;
						lrl_copSiren_alter = false;
					};
						_veh = vehicle player;
						if(isNil {_veh getVariable "alternsiren"}) then {_veh setVariable["alternsiren",false,true];};

						if((_veh getVariable "alternsiren")) then {
							titleText ["= Alternative AUS =","PLAIN"];
							_veh setVariable["alternsiren",false,true];
						} else {
							titleText ["= Alternative AN =","PLAIN"];
							_veh setVariable["alternsiren",true,true];
							[_veh] remoteExec ["life_fnc_copSirenAlter",-2];
						};
				};
			};
			_handled = true;
		};
	};

	// R Key
	case 19: {
		if( _copPlayer) then {
			if(vehicle player != player && !lrl_yelpSiren_active && ((driver vehicle player) == player)) then {
				[] spawn {
					lrl_yelpSiren_active = true;
					sleep 0.325;
					lrl_yelpSiren_active = false;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "copyelp"}) then {
					_veh setVariable["copyelp",false,true];
				};

				if((_veh getVariable "copyelp")) then {
					_veh setVariable["copyelp",false,true];
					titleText ["= Yelp-Sirene AUS =","PLAIN"];
				} else {
					_veh setVariable["copyelp",true,true];
					titleText ["= Yelp-Sirene AN =","PLAIN"];
					[_veh] remoteExec ["life_fnc_copYelp",-2];
				};
				_handled = true;
			};
		};
	};

	//Z - Spieler Menü
	case 21: {
		if(!_alt && !_ctrlKey && !dialog && !life_istazed) then {
			[] call life_fnc_p_openMenu;
		};
	};
	
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = _cursorT;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh <= 6) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[_veh,0] remoteExec ["life_fnc_lockVehicle",_veh];
						};
						systemChat localize "STR_MISC_VehUnlock";
						[[player,"CarUnlocked"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[_veh,2] remoteExec ["life_fnc_lockVehicle",_veh];
						};
						systemChat localize "STR_MISC_VehLock";
						[[player,"CarLocked"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
					};
				};
			};
			_handled = true;
		};
	};

	case 24: {
		if(vehicle player != player) then {
			if(!life_action_inUse) then {
				[] call life_fnc_openGate;
			};
		};
	};

	case 79:
	{
		if(_shift) then {
			if(vehicle player == player) then {
				if (!(player getVariable "ace_captives_isHandcuffed") && !(player getVariable "isblinded")) then {
						player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
				};
			} else {
				if(_copPlayer && !lrl_copSiren_vehPlease_active) then {
					lrl_copSiren_vehPlease_active = true;
					_veh = vehicle player;
					[_veh] remoteExec ["life_fnc_copSirenVehPlease",-2];

					[] spawn {
						sleep 20;
						lrl_copSiren_vehPlease_active = false;
					};
				};
			};
		_handled = true;
		};
	};

	//Numpad 5
	case 76:
	{
		if(_shift) then {_handled = true;};
		if (_shift && !(player getVariable "ace_captives_isHandcuffed") && (vehicle player == player) && !(player getVariable "isblinded") && !life_knockout && !life_istazed && !lrl_knockedOut) then
		{
			[player,"cl3_dubstepdance"] remoteExec ["life_fnc_animSync",0];
		};
	};

	//Numpad 6
	case 77:
	{
		if(_shift) then {_handled = true;};
		if (_shift && !(player getVariable "ace_captives_isHandcuffed") && (vehicle player == player) && !(player getVariable "isblinded") && !life_knockout && !life_istazed && !lrl_knockedOut) then
		{
			[player,"cl3_dubsteppop"] remoteExec ["life_fnc_animSync",0];
		};
	};

	case 80:
	{
		if(_shift) then {
			if(vehicle player == player) then {
				if (!(player getVariable "ace_captives_isHandcuffed") && !(player getVariable "isblinded") && !life_knockout && !life_istazed && !lrl_knockedOut) then {
					player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
				};
			} else {
				if(_copPlayer && !lrl_copSiren_vehNormal_active) then {
					lrl_copSiren_vehNormal_active = true;
					_veh = vehicle player;
					[_veh] remoteExec ["life_fnc_copSirenVehNormal",-2];

					[] spawn {
						sleep 20;
						lrl_copSiren_vehNormal_active = false;
					};
				};
			};
			_handled = true;
		};
	};

	case 81:
	{
		if(_shift) then {
			if(vehicle player == player) then {
				if (!(player getVariable "ace_captives_isHandcuffed") && !(player getVariable "isblinded") && !life_knockout && !life_istazed && !lrl_knockedOut) then {
					player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
				};
			} else {
				if(_copPlayer && !lrl_copSiren_vehAggro_active) then {
					lrl_copSiren_vehAggro_active = true;
					_veh = vehicle player;
					[_veh] remoteExec ["life_fnc_copSirenVehAggro",-2];

					[] spawn {
						sleep 20;
						lrl_copSiren_vehAggro_active = false;
					};
				};
			};
			_handled = true;
		};
	};

	case 75:
	{
		if(_shift) then {_handled = true;};
		if (_shift && !(player getVariable "ace_captives_isHandcuffed") && (vehicle player == player) && !(player getVariable "isblinded") && !life_knockout && !life_istazed && !lrl_knockedOut) then
		{
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};

	case 62:
	{
		if (_alt) then
		{
			diag_log format ["SERVER_INFO | %1 (%2) verwendete ALT+F4",_player getVariable["realname",name _player],getPlayerUID _player];
			[0,format["%1 verwendet ALT+F4",_player getVariable["realname",name _player]]] remoteExec ["life_fnc_broadcast",-2];
			[] spawn life_fnc_commandSpam;

			if(player getVariable "ace_captives_isHandcuffed") then {
				[1,format[":: SERVER INFO :: %1 verwendet ALT+F4 während er gefesselt ist - !COMBAT_LOG! (Screenshot machen und dem Support melden)",_player getVariable["realname",name _player]]]remoteExec ["life_fnc_broadcast",-2];
			};
			[] call SOCK_fnc_updateRequest;
		};
	};

	case 15:	// ALT + TAB
	{
		if (_alt) then
		{
			[] call SOCK_fnc_updateRequest;
		};
	};

	case 211:
	{
		if((typeOf cursorTarget) in ["RoadCone_F","RoadCone_L_F","RoadBarrier_F","RoadBarrier_small_F","PlasticBarrier_03_orange_F","Land_CncBarrier_stripes_F","Land_PortableLight_single_F","Land_PortableLight_double_F"] && playerSide in ["west", "independent","east"]) then
		{
			deleteVehicle cursorTarget;
			hint "Du hast das Objekt entfernt!";
		};

		if (_alt && _ctrlKey) then
		{
			diag_log format ["SERVER INFO: %1 verwendet CTRL + ALT + DEL",_player getVariable["realname",name _player]];
			[0,format["SERVER INFO: %1 verwendet CTRL + ALT + DEL",_player getVariable["realname",name _player]]] remoteExec ["life_fnc_broadcast",-2];
			[] spawn life_fnc_commandSpam;
			[] call SOCK_fnc_updateRequest;
		};
	};

	case 1:
    {
		if( _ctrlKey )  then {
			diag_log format ["SERVER INFO: %1 verwendet CTRL + ESC",_player getVariable["realname",name _player]];
			[] call SOCK_fnc_updateRequest;
		};
	};
};

_handled;
