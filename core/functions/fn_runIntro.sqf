/*
	File: fn_runIntro.sqf
	Author: Marcel "VariatoX" Koch
	Server: lakeside-reallife.de

	Description:
	Intro mit UG-C Logo für den Server
*/

private _pos = position player;

waitUntil {!isNull player};
private _scriptDo =
  [] spawn {
    _ppEffect = ppEffectCreate["colorCorrections", 1501];
    _ppEffect ppEffectEnable true;
    _ppEffect ppEffectAdjust[1, 1, -0.02, [0.2, 0.15, 0.8, 0.7],[1, 1, 1, 1], [0, 0, 0, 1]];
    _ppEffect ppEffectCommit 0;
	
    uiSleep 2.855; //Real time..
	
    _ppEffect ppEffectEnable true;
    _ppEffect ppEffectAdjust[1, 0.8, -0.02, [0, 0, 0, 0], [0.15, 0.2, 0.9, 1],[0, 0, 0, 1]];
    _ppEffect ppEffectCommit 10;
    waitUntil {ppEffectCommitted _ppEffect};
    ppEffectDestroy _ppEffect;
};
showCinemaBorder TRUE;
camUseNVG FALSE; //LOL

playSound "1ntr0";

for "_a" from 0 to 10 do {
  _a cutRsc ["introPicture","PLAIN"];
};

private _intro = "camera" camCreate [(_pos select 0) + 5,(_pos select 1),(_pos select 2) + 1450];
_intro cameraEffect ["internal","back"];
_intro camSetTarget vehicle player;
_intro camSetFOV 1.000;
_intro camCommit 2.25;
waitUntil {camCommitted _intro};
_intro camSetFOV 3.500;
_intro camSetTarget vehicle player;
_intro camSetRelPos [1,-12,20];
_intro camCommit 3;
waitUntil {camCommitted _intro};
_intro camSetFOV 2.25;
_intro camSetTarget vehicle player;
_intro camSetRelPos [1,-3,4];
_intro camCommit 2;
waitUntil {camCommitted _intro};
_intro camSetTarget vehicle player;
_intro camSetRelPos [0.5,-1,2];
_intro camCommit 1;
waitUntil {camCommitted _intro};
_intro camSetFOV 1.35;
_intro camSetTarget vehicle player;
_intro camSetRelPos [0.2,-0.5,1.85];
_intro camCommit 0.7;
waitUntil {camCommitted _intro};
_intro camSetFOV 1; //reset fov
_intro cameraEffect ["terminate","back"];
camDestroy _intro;
waitUntil {scriptDone _scriptDo};