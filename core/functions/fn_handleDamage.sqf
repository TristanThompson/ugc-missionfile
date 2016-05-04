private["_unit","_damage","_source","_projectile"];
_unit = _this select 0;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(alive _unit) then {
		if(_source != _unit) then {
			if(_projectile == "26_taser") then {
			_damage = false;
				if(!life_istazed) then {
					[_unit,_source] spawn life_fnc_tazed;
				};
			};
			
			if(_projectile == "B_556x45_Ball_Tracer_Red" && currentWeapon _source == "arifle_SDAR_F") then {
				_damage = false;
				if(_source distance _unit < 75) then {
					if(!lrl_gummit) then {
						[_unit,_source] spawn life_fnc_gummit;
					};
				};
			};
		};
	};
};

_damage;