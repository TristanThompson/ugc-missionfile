/*
Filename : fn_EinsatzLicht.sqf
Author : Ragebone
Description : Handhabt alles was mit den Einsatzlichtern zutun hat.
*/
if(isServer)exitWith{};
private["_type","_veh","_state"];
_veh = _this select 0;
if(_veh == player) exitWith {hint "Klar, schraub dir das Blaulicht auf'n Kopf xD"};

if(!alive _veh) exitWith {};
if(isNull _veh) exitWith {}; 

_xcar =_veh getVariable"xcar";
_type = _xcar select 0;
_state = _xcar select 1;

if(_state) then {
	_veh setVariable["xcar",[_type,false,_xcar select 2],TRUE];
} else {
	switch(_type)do {

		case "geheim_car":{
			if(isNil{_xcar select 2})then{
				_light = "UGC_Einsatzlicht_Blau" createVehicle getPosATL player;
				switch(typeOf _veh)do{
					
				//DRPG
					case "DRPG_08Suburban_Black": {_light attachto [_veh,[-0.45,0.4,1.55]];};
					case "DRPG_08Suburban_White": {_light attachto [_veh,[-0.45,0.4,1.55]];};
					case "DRPG_08Suburban_blue": {_light attachto [_veh,[-0.45,0.4,1.55]];};
					
					case "DRPG_09Tahoe_Black": {_light attachto [_veh,[-0.5,0.15,1.9]];};
					case "DRPG_09Tahoe_White": {_light attachto [_veh,[-0.5,0.15,1.9]];};
					case "DRPG_09Tahoe_blue": {_light attachto [_veh,[-0.5,0.15,1.9]];};
					
					case "DRPG_11RS3_Black": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
					case "DRPG_11RS3_White": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
					case "DRPG_11RS3_blue": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
					
					case "DRPG_12M5_Black": {_light attachto [_veh,[-0.37,0.05,0.23]];};
					case "DRPG_12M5_Blue": {_light attachto [_veh,[-0.37,0.05,0.23]];};
					case "DRPG_12M5_Red": {_light attachto [_veh,[-0.37,0.05,0.23]];};
					
					case "DRPG_06Victoria_Black": {_light attachto [_veh,[-0.49,0.1,1.525]];};
					case "DRPG_06Victoria_White": {_light attachto [_veh,[-0.49,0.1,1.525]];};
					case "DRPG_06Victoria_blue": {_light attachto [_veh,[-0.49,0.1,1.525]];};
					
					case "DRPG_14Explorer_Black": {_light attachto [_veh,[-0.5,0.1,0.106]];};
					case "DRPG_14Explorer_White": {_light attachto [_veh,[-0.5,0.1,0.106]];};
					case "DRPG_14Explorer_blue": {_light attachto [_veh,[-0.5,0.1,0.106]];};
					
					case "DRPG_15Charger_Black": {_light attachto [_veh,[-0.4,0.17,0.21]];};
					case "DRPG_15Charger_White": {_light attachto [_veh,[-0.4,0.17,0.21]];};
					
					case "DRPG_12Charger_Black": {_light attachto [_veh,[-0.4,0.3,0.18]];};
					case "DRPG_12Charger_White": {_light attachto [_veh,[-0.4,0.3,0.18]];};
					
				//MrShounka
					case "Mrshounka_rs4_civ_noir": {_light attachto [_veh,[-0.5,0.1,1.38]];};
					case "Mrshounka_rs4_civ_grise": {_light attachto [_veh,[-0.5,0.1,1.38]];};
					case "Mrshounka_rs4_civ_bleufonce": {_light attachto [_veh,[-0.5,0.1,1.38]];};
					
					case "shounka_rs6_noir": {_light attachto [_veh,[-0.5,0.53,0.9]];};
					case "shounka_rs6_grise": {_light attachto [_veh,[-0.5,0.53,0.9]];};
					case "shounka_rs6_bleufonce": {_light attachto [_veh,[-0.5,0.53,0.9]];};
					
					case "shounka_a3_rs5_civ_noir": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
					case "shounka_a3_rs5_civ_grise": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
					case "shounka_a3_rs5_civ_bleufonce": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
					
					case "Mrshounka_bmwm6_noir": {_light attachto [_veh,[-0.5,0,1.34]];};
					case "Mrshounka_bmwm6_bleufonce": {_light attachto [_veh,[-0.5,0,1.34]];};
					case "Mrshounka_bmwm6_grise": {_light attachto [_veh,[-0.5,0,1.34]];};
					
					case "Mrshounka_bmwm1_civ_noir": {_light attachto [_veh,[-0.47,0.17,1.4]];};
					case "Mrshounka_bmwm1_civ_bleufonce": {_light attachto [_veh,[-0.47,0.17,1.4]];};
					case "Mrshounka_bmwm1_civ_grise": {_light attachto [_veh,[-0.47,0.17,1.4]];};
					
					case "Mrshounka_raptor2_noir": {_light attachto [_veh,[0,1.2,1.1]];};
					
					case "Mrshounka_mustang_noircase": {_light attachto [_veh,[-0.55,0,1.38]];};
					case "Mrshounka_mustang_grise": {_light attachto [_veh,[-0.55,0,1.38]];};
					
					case "Mrshounka_Volkswagen_Touareg_noir": {_light attachto [_veh,[-0.55,0.46,1.55]];};
					case "Mrshounka_Volkswagen_Touareg_grise": {_light attachto [_veh,[-0.55,0.46,1.55]];};
					
					case "Mrshounka_cherokee_noir_blanc_mat": {_light attachto [_veh,[-0.6,0.1,1.58]];};
					case "Mrshounka_cherokee_noir_bleu_mat": {_light attachto [_veh,[-0.6,0.1,1.58]];};
					case "Mrshounka_cherokee_noir": {_light attachto [_veh,[-0.6,0.1,1.58]];};
					
					case "Mrshounka_cayenne_p_noir": {_light attachto [_veh,[-0.6,0.1,1.6]];};
					
					case "Mrshounka_hummer_civ_noir": {_light attachto [_veh,[-0.8,0.7,1.58]];};
					case "Mrshounka_hummer_civ_grise": {_light attachto [_veh,[-0.8,0.7,1.58]];};
					
					case "shounka_h2_noir": {_light attachto [_veh,[-0.59,1.1,1.08]];};
					case "shounka_h2_grise": {_light attachto [_veh,[-0.59,1.1,1.08]];};
					
					case "Mrshounka_c63_2015_noir": {_light attachto [_veh,[-0.53,-0.3,0.81]];};
					case "Mrshounka_c63_2015_grise": {_light attachto [_veh,[-0.53,-0.3,0.81]];};
					
					case "shounka_clk_noir": {_light attachto [_veh,[-0.54,0.05,0.935]];};
					case "shounka_clk_grise": {_light attachto [_veh,[-0.54,0.05,0.935]];};
					
				//Ivory
					case "ivory_m3": {_light attachto [_veh,[-0.4,-0.05,0.405]];};
					
					default{deleteVehicle _light; hint "Fahrzeug unterstützt kein Blaulicht"; _exit = true;};
				};
			};
			if(!isNil "_exit") exitWith {};
			_veh setVariable["xcar",[_type,true,true],TRUE];	
			[_veh,0.5] remoteExec ["life_fnc_ULights",-2];
		};
		case "BL_car":{
			if(isNil{_xcar select 2})then{
				_light = "UGC_Einsatzlicht_Blau" createVehicle getPosATL player;
				switch(typeOf _veh)do{
					
				//DRPG
					case "DRPG_08Suburban_Black": {_light attachto [_veh,[-0.45,0.4,1.55]];};
					case "DRPG_08Suburban_White": {_light attachto [_veh,[-0.45,0.4,1.55]];};
					case "DRPG_08Suburban_blue": {_light attachto [_veh,[-0.45,0.4,1.55]];};
					
					case "DRPG_09Tahoe_Black": {_light attachto [_veh,[-0.5,0.15,1.9]];};
					case "DRPG_09Tahoe_White": {_light attachto [_veh,[-0.5,0.15,1.9]];};
					case "DRPG_09Tahoe_blue": {_light attachto [_veh,[-0.5,0.15,1.9]];};
					
					case "DRPG_11RS3_Black": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
					case "DRPG_11RS3_White": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
					case "DRPG_11RS3_blue": {_light attachto [_veh,[-1.6,0.1,-0.07]];};
					
					case "DRPG_12M5_Black": {_light attachto [_veh,[-0.37,0.05,0.23]];};
					case "DRPG_12M5_Blue": {_light attachto [_veh,[-0.37,0.05,0.23]];};
					case "DRPG_12M5_Red": {_light attachto [_veh,[-0.37,0.05,0.23]];};
					
					case "DRPG_06Victoria_Black": {_light attachto [_veh,[-0.49,0.1,1.525]];};
					case "DRPG_06Victoria_White": {_light attachto [_veh,[-0.49,0.1,1.525]];};
					case "DRPG_06Victoria_blue": {_light attachto [_veh,[-0.49,0.1,1.525]];};
					
					case "DRPG_14Explorer_Black": {_light attachto [_veh,[-0.5,0.1,0.106]];};
					case "DRPG_14Explorer_White": {_light attachto [_veh,[-0.5,0.1,0.106]];};
					case "DRPG_14Explorer_blue": {_light attachto [_veh,[-0.5,0.1,0.106]];};
					
					case "DRPG_15Charger_Black": {_light attachto [_veh,[-0.4,0.17,0.21]];};
					case "DRPG_15Charger_White": {_light attachto [_veh,[-0.4,0.17,0.21]];};
					
					case "DRPG_12Charger_Black": {_light attachto [_veh,[-0.4,0.3,0.18]];};
					case "DRPG_12Charger_White": {_light attachto [_veh,[-0.4,0.3,0.18]];};
					
				//MrShounka
					case "Mrshounka_rs4_civ_noir": {_light attachto [_veh,[-0.5,0.1,1.38]];};
					case "Mrshounka_rs4_civ_grise": {_light attachto [_veh,[-0.5,0.1,1.38]];};
					case "Mrshounka_rs4_civ_bleufonce": {_light attachto [_veh,[-0.5,0.1,1.38]];};
					
					case "shounka_rs6_noir": {_light attachto [_veh,[-0.5,0.53,0.9]];};
					case "shounka_rs6_grise": {_light attachto [_veh,[-0.5,0.53,0.9]];};
					case "shounka_rs6_bleufonce": {_light attachto [_veh,[-0.5,0.53,0.9]];};
					
					case "shounka_a3_rs5_civ_noir": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
					case "shounka_a3_rs5_civ_grise": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
					case "shounka_a3_rs5_civ_bleufonce": {_light attachto [_veh,[-0.48,-0.05,0.26]];};
					
					case "Mrshounka_bmwm6_noir": {_light attachto [_veh,[-0.5,0,1.34]];};
					case "Mrshounka_bmwm6_bleufonce": {_light attachto [_veh,[-0.5,0,1.34]];};
					case "Mrshounka_bmwm6_grise": {_light attachto [_veh,[-0.5,0,1.34]];};
					
					case "Mrshounka_bmwm1_civ_noir": {_light attachto [_veh,[-0.47,0.17,1.4]];};
					case "Mrshounka_bmwm1_civ_bleufonce": {_light attachto [_veh,[-0.47,0.17,1.4]];};
					case "Mrshounka_bmwm1_civ_grise": {_light attachto [_veh,[-0.47,0.17,1.4]];};
					
					case "Mrshounka_raptor2_noir": {_light attachto [_veh,[0,1.2,1.1]];};
					
					case "Mrshounka_mustang_noircase": {_light attachto [_veh,[-0.55,0,1.38]];};
					case "Mrshounka_mustang_grise": {_light attachto [_veh,[-0.55,0,1.38]];};
					
					case "Mrshounka_Volkswagen_Touareg_noir": {_light attachto [_veh,[-0.55,0.46,1.55]];};
					case "Mrshounka_Volkswagen_Touareg_grise": {_light attachto [_veh,[-0.55,0.46,1.55]];};
					
					case "Mrshounka_cherokee_noir_blanc_mat": {_light attachto [_veh,[-0.6,0.1,1.58]];};
					case "Mrshounka_cherokee_noir_bleu_mat": {_light attachto [_veh,[-0.6,0.1,1.58]];};
					case "Mrshounka_cherokee_noir": {_light attachto [_veh,[-0.6,0.1,1.58]];};
					
					case "Mrshounka_cayenne_p_noir": {_light attachto [_veh,[-0.6,0.1,1.6]];};
					
					case "Mrshounka_hummer_civ_noir": {_light attachto [_veh,[-0.8,0.7,1.58]];};
					case "Mrshounka_hummer_civ_grise": {_light attachto [_veh,[-0.8,0.7,1.58]];};
					
					case "shounka_h2_noir": {_light attachto [_veh,[-0.59,1.1,1.08]];};
					case "shounka_h2_grise": {_light attachto [_veh,[-0.59,1.1,1.08]];};
					
					case "Mrshounka_c63_2015_noir": {_light attachto [_veh,[-0.53,-0.3,0.81]];};
					case "Mrshounka_c63_2015_grise": {_light attachto [_veh,[-0.53,-0.3,0.81]];};
					
					case "shounka_clk_noir": {_light attachto [_veh,[-0.54,0.05,0.935]];};
					case "shounka_clk_grise": {_light attachto [_veh,[-0.54,0.05,0.935]];};
					
				//Ivory
					case "ivory_m3": {_light attachto [_veh,[-0.4,-0.05,0.405]];};
					
					default{deleteVehicle _light; hint "Fahrzeug unterstützt kein Blaulicht"; _exit = true;};
				};
			};
			if(!isNil "_exit") exitWith {};
			_veh setVariable["xcar",[_type,true,true],TRUE];	
			[_veh,0.5] remoteExec ["life_fnc_ULights",-2];
		};
	};
};