/*
	File: fn_monitorColorizeEffect.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de

	Description:
	Einige Effekte die bei bestimmten Aktionen ausgeführt werden.
	uiSleep auf Grund der niedgrigen CPS & FPS (uiSleep = Real time ; sleep = diag tick-time)

	PARAMS:
	0 = Effect Type (Integer)

*/

_type = param [0, 0, [0]];

switch (_type) do {
	
	//Schwarzer Bildschirm
	case 0: {
		"colorCorrections" ppEffectEnable true;			
		"colorCorrections" ppEffectAdjust [1, 1,-0.002,[0.0, 0.0, 0.0, 0.0],[1, 1, 1, 0.011],[0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 0.45;
		uiSleep 8;
		"colorCorrections" ppEffectAdjust [1, 1, -0.002,[0.0, 0.0, 0.0, 0.0],[1, 1, 1, 1],[0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 3.25;
		uiSleep 2;
	};
};