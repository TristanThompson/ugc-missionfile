/*
	File: fn_commandSpam.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de
	
	Description:
	Prüft nach, wie oft eine bestimmte Aktion ausgeführt wurde und
	bestraft den entsprechenden Spieler (=CALLER) dafür.
*/

lrl_spamcounter = lrl_spamcounter + 1;

if(lrl_spamcounter >= 5) exitWith {
	disableUserInput true;
	["A3LCheatSpam",true,false] call BIS_fnc_endMission;
	sleep 35;
	disableUserInput false;
	lrl_spamcounter = 0;
};

hint parseText format ["<t size='2' color='#ff0000'>Warnung</t><br/><br/><t size='1.1' align='center'>= Du scheinst einige Features zu schnell/zu oft auszuführen! =</t><br/><br/><br/><t size='1.2'>Warn-Level:</t><br/><t size='1.15'> %1/5</t><br/>",lrl_spamcounter];

[] spawn {
	while {(lrl_spamcounter > 0)} do {
		sleep 5;
		lrl_spamcounter = lrl_spamcounter - 1;
	}
};