fnc_arrestmenu = {
	createdialog "a3l_jail_menu";
	private["_unit","_id"];
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	personyouwanjail = _unit;
	if(isNull _unit) exitWith {};
	if(isNil "_unit") exitwith {}; 
	if(!(_unit isKindOf "Man")) exitWith {}; 
	if(!isPlayer _unit) exitWith {};
	if((_unit getVariable "life_is_arrested")) exitWith {hint "Die Person ist bereits im Gefängnis...";};
	if(!(_unit getVariable "ace_captives_isHandcuffed")) exitWith {hint "Die Person trägt keine Handschellen";}; 
	if(side _unit != civilian) exitWith {hint "Du kannst nur Zivilisten einsperren!"}; 

	_display = findDisplay 5546;
	_nameofperson = _display displayCtrl 2200;
	_nametext = format ["%1",name _unit];
	_nameofperson ctrlSetText _nametext;
};

fnc_arrestbutton = {
	_display = findDisplay 5546;
	_nameofperson = _display displayCtrl 2200;
	_timeinminute = _display displayCtrl 2201;
	_reasonofjail = _display displayCtrl 2202;
	_playername = ctrlText _nameofperson;
	_jailtime = ctrlText _timeinminute;
	_reason = ctrlText _reasonofjail;
	if(isNull personyouwanjail) exitWith {};

	detach personyouwanjail;
[personyouwanjail,false,_jailtime,_reason] remoteExec ["fnc_sendtojail",personyouwanjail];
[personyouwanjail,player,false] remoteExec ["life_fnc_wantedBounty",2];
};

fnc_sendtojail = {
	private["_bad","_unit"];
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	hint format["%1", _unit];
	if(isNull _unit) exitWith {};
	if(_unit != player) exitWith {};
	if(life_is_arrested) exitWith {};
	_bad = [_this,1,false,[false]] call BIS_fnc_param;
	life_arrestMinutes = _this select 2;
	life_arrestReason = _this select 3;

	A3L_Fnc_OldUniform = Uniform player;
	player addUniform "A3L_Prisoner_Outfit";

	[1] call life_fnc_removeLicenses;

	if(_bad) then
	{
		waitUntil {alive player};
		sleep 1;
	};
	if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
	if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
	if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
	if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
	if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
	if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
	if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
[player,_bad,life_arrestMinutes,life_arrestReason] remoteExec ["svr_sendtojail",2];
	[5] call SOCK_fnc_updatePartial;
	[2] call SOCK_fnc_updatePartial;
};

fnc_jailsetup = {
	_minutes = parseNumber life_arrestMinutes;
	_hours = floor (_minutes/60);
	_minutes = _minutes % 60;
	player setVariable["ace_captives_isHandcuffed",false,true];
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
	life_is_arrested = true;
	player setVariable["life_is_arrested",true,true];
	
	[] call life_fnc_readyForJail;

	_jaillocations = [
	[9298.50,9565.42,0.00143909],
	[9298.40,9569.03,0.00143909],
	[9298.19,9572.59,0.00143909],
	[9298.35,9576.25,0.00143909],
	[9298.40,9579.67,0.00143909],
	[9298.39,9583.29,0.00143909],
	[9298.39,9586.87,0.00143909],
	[9298.60,9590.34,0.00143909],
	[9280.60,9579.23,0.00143909],
	[9280.46,9564.89,0.00143909],
	[9280.53,9575.58,0.00143909],
	[9280.47,9579.21,0.00143909],
	[9280.60,9582.60,0.00143909],
	[9280.53,9586.38,0.00143909],
	[9280.53,9586.38,0.00143909],
	[9280.77,9589.97,0.00143909]
	];
	_randomer = floor random (count _jaillocations);
	_jailpos = _jaillocations select _randomer;

	player setPos _jailpos;
	if((player distance (getMarkerPos "jail_marker")) > 40) then
	{
		player setPos (getMarkerPos "jail_marker");
	};

	("A3LJAILTIME" call BIS_fnc_rscLayer) cutRsc ["a3l_jail_timer","PLAIN"]; //show
	[] spawn
	{
		while {(player distance (getMarkerPos "jail_marker")) < 80} do
		{
			sleep 120;
			if ((player distance (getMarkerPos "jail_marker")) < 80) then {
			("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
			("A3LJAILTIME" call BIS_fnc_rscLayer) cutRsc ["a3l_jail_timer","PLAIN"]; //show
			_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#B20000' align='center' size='1.8'>%1</t>",life_arrestReason];
			((uiNamespace getVariable "a3ljailtimer") displayCtrl 1101) ctrlSetStructuredText _sexytext;
			};
		};
	};
	_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#B20000' align='center' size='1.8'>%1</t>",life_arrestReason];
	((uiNamespace getVariable "a3ljailtimer") displayCtrl 1101) ctrlSetStructuredText _sexytext;
	
	[0,_minutes,_hours,0] spawn fnc_jailtimer;
};

fnc_jailtimer = {
	sleep 1;
	_release = 0;
	_second = _this select 0;
	_minute = _this select 1;
	_hour = _this select 2;
	_dtbsave = _this select 3;
	if (_second > 0) then {
		_second = _second - 1;
	} else { if (_minute > 0) then {
		_minute = _minute - 1;
		_second = 60;
	} else { if (_hour > 0) then {
		_hour = _hour - 1;
		_minute = 59;
		_second = 60;
	} else {};};};
	seconds = _second;
	minute = _minute;
	hour = _hour;

	_hrtext = "";
	_hourtext = "";
	_mntext = "";
	_minutetext = "";
	_sectext = "";
	_secondtext = "seconds";

	if (_hour == 0) then {_hrtext = "";} else {
	if (_hour == 1) then {_hourtext = "hour"} else {_hourtext = "hours"};
		_hrtext = parseText format["%1 %2, ",_hour,_hourtext];
	};
	if ((_hour == 0) && (_minute == 0)) then { _mntext = ""; } else {
	if (_minute == 1) then {_minutetext = "minute"} else {_minutetext = "minutes"};
		_mntext = parseText format["%1 %2 and ",_minute,_minutetext];
	};

	_dtbsave = _dtbsave + 1;
	if (_dtbsave == 300) then {[_hour,_minute,player] remoteExec ["svr_jailtodb",2]; _dtbsave = 0; };
	_sectext = parseText format["%1 %2",_second,_secondtext];

	_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#B20000' align='center' size='1.8'>%1%2%3</t>",_hrtext,_mntext,_sectext];
	((uiNamespace getVariable "a3ljailtimer") displayCtrl 1100) ctrlSetStructuredText _sexytext;

	if (((_hour < 1) && (_minute < 1)&& (_second < 1)) OR ((player distance (getMarkerPos "jail_marker")) > 215)) then {
		if ((_hour < 1) && (_minute < 1)&& (_second < 1)) then {
			_release = 1;
			[_release] call fnc_releaseprison;
		} else {
			_release = 2;
			[_release] call fnc_releaseprison;
		};
	} else { [_second,_minute,_hour,_dtbsave] spawn fnc_jailtimer;  };
};

fnc_releaseprison = {
	_release = _this select 0;
	life_is_arrested = false;
	player setVariable["life_is_arrested",false,true];
[player] remoteExec ["svr_releaseprison",2];
	if (_release == 1) then {
		
		if (isNil "A3L_Fnc_OldUniform") then 
		{
			player addUniform "A3LShirt";
		} else
		{
			player addUniform A3L_Fnc_OldUniform;
		};
		
[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
		player setPos (getMarkerPos "jail_release");
		("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
		hint ["Du hast deine Haftzeit abgesessen. Achte in der Zukunft auf das Gesetz!"];
	} else {
		hint ["Du bist aus dem Gefängnis ausgebrochen!"];
		("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; //remove
	};
	[5] call SOCK_fnc_updatePartial;
	[2] call SOCK_fnc_updatePartial;
};
