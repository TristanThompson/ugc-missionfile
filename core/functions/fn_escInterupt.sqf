/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;
_id = (getPlayerUID player);

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_timeStamp = time + 10;
		
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	[] call SOCK_fnc_updateRequest; //call our silent sync.
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
		[] call SOCK_fnc_updateRequest; //Doppel hält besser :P
	};
};

_canUseControls = {
	if(playerSide in [independent,east]) exitWith {true};
	if((player getVariable["ace_captives_isHandcuffed",FALSE]) OR (player getVariable["Escorting",FALSE]) OR (player getVariable["transporting",FALSE]) OR (life_istazed) OR (lrl_knockedOut)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton buttonSetAction "[player] remoteExec [""TON_fnc_cleanupRequest"",2]; call SOCK_fnc_updateRequest;";
	_abortButton ctrlSetText "Schlafen";
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	
	_topTitle = (findDisplay 49) displayCtrl 2;
	_topTitle ctrlEnable false;
	_topTitle ctrlSetText "LAKESIDE REALLIFE";
	
	_botButton = (findDisplay 49) displayCtrl 103;
	_botButton ctrlEnable false;
	_botButton ctrlSetText _id;
	
	_fieldTitle = (findDisplay 49) displayCtrl 523;
	_fieldTitle ctrlSetText "UG-C.de";
	
	_respawnButton ctrlSetText " ";
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;

	waitUntil{isNull (findDisplay 49)};
};
