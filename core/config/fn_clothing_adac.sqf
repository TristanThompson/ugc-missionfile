/*
	File: fn_clothing_adac.sqf
	Author: Hungry?
	
	Description:
	Uniform Shop für EMS
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"LAC Kleidungsladen"];

if((call life_adaclevel) >= 9) exitWith {closeDialog 0; hint "Du bist als Justiz whitelisted, nicht als LAC!"};

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["A3L_Worker_Outfit","Allg Arbeitskleidung",10],
			["A3L_lacpraktikant","Praktikant Arbeitskleidung",10],
			["A3L_lacmechaniker","Mechaniker Arbeitskleidung",15],
			["A3L_lacmechatroniker","Mechatroniker Arbeitskleidung",15],
			["A3L_lacmeister","Meister Arbeitskleidung",20],
			["A3L_lacausbilder","Ausbilder Arbeitskleidung",20],
			["A3L_lacpersonal","Personal Arbeitskleidung",25],
			["A3L_lacstell","Stellv.Leitung Arbeitskleidung",25],
			["A3L_lacchef","Leitung Arbeitskleidung",30],
			["U_O_Wetsuit","Taucheranzug",50]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_PilotHelmetHeli_O","Pilotenhelm Mk I",10],
			["H_CrewHelmetHeli_O","Pilotenhelm Mk II",10],
			["H_RacingHelmet_1_black_F","Motorradhelm",10],
			["Kio_Afro_Hat","Afro",10],
			["H_MilCap_blue","Blaue Funkmütze",10],
			["ALE_H_NewEra_Black",nil,10],
			["ALE_H_NewEra_Cyan",nil,10],
			["ALE_H_NewEra_Superman",nil,10],
			["ALE_H_NewEra_Monster",nil,10],
			["ALE_H_Cowboy_Brown",nil,10],
			["ALE_H_Cowboy_Black",nil,10],
			["ALE_H_Cowboy_White",nil,10],
			["ALE_H_NewEra_Lakers",nil,10],
			["ALE_H_NewEra_Redsox",nil,10],
			["H_ALFR_Headset",nil,10],
			["H_Hat_Boonie_Cowboy","Cowboy Hut",10],
			["H_Beret_blk","Beret (black)",10],
			["A3L_longhairblack","Haar Schwarz",10],
			["A3L_longhairblond","Haar Blond",10],
			["A3L_longhairbrown","Haar Braun",10]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_O_Diving",nil,5],
			["G_Goggles_VR","Augenschutz",5],
			["G_Combat",nil,5],
			["G_Shades_Black",nil,5],
			["G_Shades_Blue",nil,5],
			["G_Sport_Blackred",nil,5],
			["G_Sport_Checkered",nil,5],
			["G_Sport_Blackyellow",nil,5],
			["G_Sport_BlackWhite",nil,5],
			["SFG_Tac_BeardD","Bart (Dunkel)",5],
			["SFG_Tac_BeardB","Bart (Blond)",5],
			["SFG_Tac_BeardG","Bart (Ginger)",5],
			["SFG_Tac_BeardO","Bart (Alt)",5],
			["SFG_Tac_ChopsD","Mutton Chops (Dunkel)",5],
			["SFG_Tac_ChopsG","Mutton Chops (Ginger)",5],
			["SFG_Tac_ChopsB","Mutton Chops (Blond)",5],
			["SFG_Tac_ChopsO","Mutton Chops (Alt)",5],
			["SFG_Tac_moustacheD","Moustache (Dunkel)",5],
			["SFG_Tac_moustacheG","Moustache (Ginger)",5],
			["SFG_Tac_moustacheB","Moustache (Blond)",5],
			["SFG_Tac_moustacheO","Moustache (Alt)",5],
			["SFG_Tac_chinlessbD","Chinless Beard (Dunkel)",5],
			["SFG_Tac_chinlessbG","Chinless Beard (Ginger)",5],
			["SFG_Tac_chinlessbB","Chinless Beard (Blond)",5],
			["SFG_Tac_chinlessbO","Chinless Beard (Alt)",5]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherB","Tauchgerät",50],
			["SWATvest2","Unsichtbare Weste",25],
			["V_HarnessOGL_gry","Unsichtbare Weste",25],
			["V_Rangemaster_belt","Werkzeug-Gurt",25]
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
			["ACE_TacticalLadder_Pack",nil,250]
		];
	};
};