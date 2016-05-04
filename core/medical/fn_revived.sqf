/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[life_corpse] remoteExec ["life_fnc_corpse",0];
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if(c00l3_b4Nck3h13R > (call life_revive_fee)) then {
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R - (call life_revive_fee);
} else {
	c00l3_b4Nck3h13R = 0;
};

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
switch(playerSide) do {
	case independent: {[[player,0,"textures\medic_uniform.jpg"] remoteExec ["life_fnc_setTexture",-2];};
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[life_corpse] remoteExec ["life_fnc_corpse",-2];
deleteVehicle life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

player setDamage 0.8;

[] call life_fnc_hudUpdate; //Request update of hud.