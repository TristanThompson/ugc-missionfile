/*
	File: fn_clothing_justiz.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Uniform Shop für Justiz
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
//ctrlSetText[3103,"Justiz Kleidungsladen"];

if((call life_adaclevel) < 9) exitWith {closeDialog 0; hint "Du bist keine Justiz!"};

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
			["TRYK_SUITS_BR_F",nil,250]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Hat_Taqiyah_A",nil,5],
			["H_Hat_Taqiyah_B",nil,5],
			["H_Hat_Taqiyah_C",nil,5],
			["H_Hat_Taqiyah_D",nil,5],
			["H_Hat_Taqiyah_E",nil,5],
			
			["H_Hat_Turban_A",nil,5],
			["H_Hat_Turban_B",nil,5],
			["H_Hat_Turban_C",nil,5],
			["H_Hat_Turban_D",nil,5],
			["H_Hat_Turban_E",nil,5],
			
			["A3L_longhairblack","Lang-Haar Schwarz",10],
			["A3L_longhairblond","Lang-Haar Blond",10],
			["A3L_longhairbrown","Lang-Haar Braun",10]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Aviator",nil,5],
			["SFG_Tac_BeardD","Bart (Dunkel)",10],
			["SFG_Tac_BeardB","Bart (Blond)",10],
			["SFG_Tac_BeardG","Bart (Ginger)",10],
			["SFG_Tac_BeardO","Bart (Alt)",10],
			["SFG_Tac_ChopsD","Mutton Chops (Dunkel)",10],
			["SFG_Tac_ChopsG","Mutton Chops (Ginger)",10],
			["SFG_Tac_ChopsB","Mutton Chops (Blond)",10],
			["SFG_Tac_ChopsO","Mutton Chops (Alt)",10],
			["SFG_Tac_moustacheD","Moustache (Dunkel)",10],
			["SFG_Tac_moustacheG","Moustache (Ginger)",10],
			["SFG_Tac_moustacheB","Moustache (Blond)",10],
			["SFG_Tac_moustacheO","Moustache (Alt)",10],
			["SFG_Tac_chinlessbD","Chinless Beard (Dunkel)",10],
			["SFG_Tac_chinlessbG","Chinless Beard (Ginger)",10],
			["SFG_Tac_chinlessbB","Chinless Beard (Blond)",10],
			["SFG_Tac_chinlessbO","Chinless Beard (Alt)",10]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["A3L_policevest2","Justiz Weste",15]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["domepokemon",nil,75],
			["domepony",nil,75],
			["domegraffiti",nil,75],
			["domebuhse",nil,75],
			["domekappa_s",nil,75],
			["domekappa_blau",nil,75],
			["domekappa_p",nil,75],
			["domekappa_t",nil,75],
			["domekappa_w",nil,75],
			["domeadi_s",nil,75],
			["domeadi_blau",nil,75],
			["domeadi_p",nil,75],
			["domeadi_t",nil,75],
			["domeadi_w",nil,75],
			["domenik_s",nil,75],
			["domenik_blau",nil,75],
			["domenik_p",nil,75],
			["domenik_t",nil,75],
			["domenik_w",nil,75],
			["domepu_s",nil,75],
			["domepu_blau",nil,75],
			["domepu_p",nil,75],
			["domepu_t",nil,75],
			["domepu_w",nil,75],
			["TRYK_B_Carryall_wood",nil,100],
			["TRYK_B_Carryall_wh",nil,100],
			["TRYK_B_Carryall_blk",nil,100],
			["TRYK_B_Carryall_JSDF",nil,100],
			["TRYK_B_Alicepack",nil,100],
			["B_Carryall_oucamo",nil,100],
			["B_Carryall_cbr",nil,100],
			["B_Carryall_ocamo",nil,100],
			["B_Carryall_mcamo",nil,100],
			["B_Carryall_oli",nil,100],
			["B_Carryall_khk",nil,100],
			["TRYK_B_tube_blk",nil,50],
			["TRYK_B_tube_cyt",nil,50],
			["TRYK_B_tube_od",nil,50]
		];
	};
};