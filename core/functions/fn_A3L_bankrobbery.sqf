// Give money, check variable 5 minutes or w/e
private ["_timer"];
if (bank animationPhase "vault_door" < 0.3) exitwith {["Der Tresor ist nicht einmal offen du Bug-User. Wurde einem Admin mitgeteilt.",30,"red"] call A3L_Fnc_Msg;}; 
if (animationState player == "AinvPknlMstpSnonWnonDnon_medic_1") exitwith {["Du packst bereits Geld ein",30,"red"] call A3L_Fnc_Msg;};
if (count (attachedobjects player) > 0) exitwith {["Du trägst bereits einen Koffer",30,"red"] call A3L_Fnc_Msg;}; 
if ((_this select 3) getVariable "robbed") exitwith {["Dieser Haufen wurde kürzlich ausgeraubt.",30,"red"] call A3L_Fnc_Msg;};
_timer = 60 + (floor(random 60));
["Packe Geld ein... das dauert einige Zeit!",30,"blue"] call A3L_Fnc_Msg;
(_this select 3) setVariable ["robbed",true,true];

[_timer,(_this select 3)] spawn {
_timer = _this select 0;
_stash = _this select 1;
while {_timer > 0} do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["life_fnc_animSync",0];
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["ace_captives_isHandcuffed",false])) exitWith {};
	
	_timer = _timer - 0.1;
	if (_timer < 1) exitwith {
		private ["_veh","_id"];
		["Du hast das Geld zusammengepackt. Schnell damit zum Geldwäscher!",30,"green"] call A3L_Fnc_Msg;
		
		_veh = "Land_Suitcase_F" createvehicle (getpos player);
		{_veh disableCollisionWith _x} foreach playableUnits;
		_veh setVariable ["pickup",false,true];
		_veh attachto [player, [0.035,-.055,-0.22], "RightHandMiddle1"];
		_veh setdir (getdir player + 180);
		_veh setpos (getpos _veh);
		_id = player addAction ["Koffer Ablegen", {detach (_this select 3)},_veh];
		
		[_veh,_id] spawn {
			_veh = _this select 0;
			_id = _this select 1;
			_suitcaseDeleted = false;
			while {(_veh IN (attachedObjects player)) OR (_suitcaseDeleted)} do {
				if ((!(vehicle player == player)) && (!(_suitcaseDeleted))) then 
				{
					player removeAction _id;
					detach _veh;
					deleteVehicle _veh;
					_suitcaseDeleted = true;
				};
				
				if ((_suitcaseDeleted) && (vehicle player == player)) then {
					_veh = "Land_Suitcase_F" createvehicle (getpos player);
					_veh setVariable ["pickup",false,true];
					_veh attachto [player, [0.035,-.055,-0.22], "RightHandMiddle1"];
					_veh setdir (getdir player + 180);
					_veh setpos (getpos _veh);
					_id = player addAction ["Drop suitcase", {detach (_this select 3)},_veh];
					_suitcaseDeleted = false;
				};
				
				if((life_istazed) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
				if((life_interrupted) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
				if (!(alive player)) exitwith {detach _veh;};
				if((player getVariable["ace_captives_isHandcuffed",false]) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
				sleep 0.1;
			};
			
			detach _veh;
			_veh setVariable ["pickup",true,true];
			player removeAction _id;
		};
		
	};
	
	sleep 0.1;
};
};
