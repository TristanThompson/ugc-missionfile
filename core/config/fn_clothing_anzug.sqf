/*
	File: fn_clothing_anzug.sqf
	Author: Bryan "Tonic" Boardwine (fn_clothing_bruce.sqf)
	edited by Marcel "VariatoX" Koch
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Karl Lagerheld Kollektion"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["KAEL_SUITS_BR_Judge",nil,250],
			["KAEL_SUITS_BLK_F",nil,250],
			["KAEL_SUITS_BR_F",nil,250],
			["KAEL_SUITS_BR_F3",nil,250],
			["KAEL_SUITS_BR_F4",nil,250],
			["KAEL_SUITS_BR_F5",nil,250],
			["KAEL_SUITS_BR_F6",nil,250],
			["KAEL_SUITS_BR_F7",nil,250],
			["KAEL_SUITS_BR_F8",nil,250],
			["KAEL_SUITS_BR_F9",nil,250],
			["KAEL_SUITS_BR_F10",nil,250],
			["KAEL_SUITS_BR_F11",nil,250],
			["KAEL_SUITS_BR_F12",nil,250],
			["KAEL_SUITS_BR_F13",nil,250],
			["KAEL_SUITS_BR_F14",nil,250],
			["KAEL_SUITS_BR_F15",nil,250],
			["KAEL_SUITS_BR_F16",nil,250],
			["KAEL_SUITS_BR_F17",nil,250],
			["KAEL_SUITS_BR_F18",nil,250],
			["KAEL_SUITS_BR_F19",nil,250],
			["KAEL_SUITS_BR_F20",nil,250],
			["KAEL_SUITS_BR_F21",nil,250],
			["KAEL_SUITS_BR_F22",nil,250],
			["KAEL_SUITS_BR_F23",nil,250],
			["KAEL_SUITS_BR_F24",nil,250],
			["KAEL_SUITS_BR_F25",nil,250],
			["KAEL_SUITS_BR_F26",nil,250],
			["KAEL_SUITS_BR_F27",nil,250],
			["KAEL_SUITS_BR_F28",nil,250],
			["KAEL_SUITS_BR_F29",nil,250],
			["KAEL_SUITS_BR_F30",nil,250],
			["KAEL_SUITS_BR_F31",nil,250],
			["KAEL_SUITS_BR_F32",nil,250],
			["KAEL_SUITS_BR_F33",nil,250],
			["KAEL_SUITS_BR_F34",nil,250],
			["KAEL_SUITS_BR_F35",nil,250],
			["U_CivilianSuit_A",nil,250],
			["U_CivilianSuit_C",nil,250],
			["U_CivilianSuit_B",nil,250],
			["TRYK_SUITS_BLK_F",nil,250],
			["TRYK_SUITS_BR_F",nil,250],
			
			["U_CivilianCoat_D",nil,250],
			["U_CivilianCoat_E",nil,250],
			["U_CivilianCoat_F",nil,250],
			["U_CivilianCoat_B",nil,250],
			["U_CivilianCoat_C",nil,250],
			["U_MilitaryCoat_A",nil,250],
			["U_MilitaryCoat_B",nil,250],
			["U_MilitaryCoat_C",nil,250],
			["U_MilitaryCoat_D",nil,250]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["turban","Indischer Turban",10],
			["kio_capital_hat","Zylinder",20]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["A3L_FatHead","Zigarette",5],
			["G_Squares",nil,5],
			["G_Aviator",nil,5],
			["G_Lady_Mirror",nil,5],
			["G_Lady_Dark",nil,5],
			["G_Lady_Blue",nil,5]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};
