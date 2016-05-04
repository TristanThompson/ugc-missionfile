/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/

_player = _this select 0;
_curWeapon = currentWeapon _player;
//_ammoType = _this select 4;
_projectile = _this select 6;

if (_curWeapon == "arifle_SDAR_F") then {
	reload _player;
};