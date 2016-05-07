//if(!(playerSide in [civilian,west])) exitWith {};
if(player getVariable "ace_captives_isHandcuffed") exitWith {};

_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _target) exitWith {};
if(!(_target isKindof "Man")) exitWith {};
if(!isPlayer _target) exitWith {};
if(!alive _target) exitWith {};
if(speed _target > 15) exitWith {};
if(player distance _target > 4) exitWith {};
if((animationState _target) == "Cl3_anim_Knockout1In") exitWith {};
if((animationState _target) == "static_dead") exitWith {};
if(currentWeapon player == "") exitWith {};
if(life_knockout) exitWith {};
if(lrl_knockedOut) exitWith {};
if(life_istazed) exitWith {};

life_knockout = true;

if((currentWeapon player == primaryWeapon player)) then {
	[player,"CL3_anim_WeaponHit"] remoteExec ["life_fnc_animSync",0];
	uiSleep 0.9;
} else {
	private _knockouts = ["CL3_anim_Punch1","CL3_anim_Punch2","CL3_anim_Punch3","CL3_anim_Punch4"] call BIS_fnc_selectRandom;
	[[player,_knockouts],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
};
if(player distance _target > 3) exitWith {};
playSound3D [KF_CHICKEN + "sounds\knockout.ogg",_target,false,getPosASL _target,1.35,1,30];

[_target,profileName] remoteExec ["life_fnc_knockedOut",_target];

sleep 6;
life_knockout = false;
