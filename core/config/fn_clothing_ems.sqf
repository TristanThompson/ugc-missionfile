/*
	File: fn_clothing_ems.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"EMS/FDP Dienstkleidung"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["EMTRM_uni","Praktikant",10],
			["medic_rang1","Trainee",10],
			["medic_rang2","EMT",10],
			["medic_rang3","EMT-B",10],
			["medic_rang4","EMT-I",10],
			["medic_rang5","EMT Officer",10],
			["medic_rang6","EMT-P",10],
			["medic_rang7","EMT-PB",10],
			["medic_rang8","EMT-PI",10],
			["medic_rang9","EMS Officer",10],
			["medic_rang10","EMS Chief",10],
			["A3L_Sani","Sanitäter",10],
			["A3L_Retass","Rettungsassistent",15],
			["A3L_Notarzt","Arzt",15],
			["A3L_Oberarzt","Oberarzt",20],
			["A3L_Chefarzt","Chefarzt",20],
			["fire_uni2","PSA-Feuerwehr (orange)",25],
			["fire_uni1","PSA-Feuerwehr (black)",25],
			["emsoff_uni","LS-EMS Poloshirt",30],
			["emt_Uni3","LS-EMS-Dienstkleidung (rot)",30],
			["A3L_MotorUniM","LS-EMS Motorradkleidung",35],
			["U_CivilianCoat_A","Arztkittel",35],
			["U_O_Wetsuit","Taucheranzug",40]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["do_medcap","Paramedic Mütze (marineblau)",10],
			["firehat","Feuerwehr Einsatzhelm",10],
			["A3L_medic_helmet","Feuerwehr Kopfschutz",10],
			["H_Cap_blu","Blaue Mütze",10],
			["H_Cap_red","Rote Mütze",10],
			["H_Beret_A","Rotes Beret",10],
			["H_MilCap_blue","Blaue Funkmütze",10],
			["H_PilotHelmetHeli_B","Pilotenhelm",10],
			["H_RacingHelmet_1_red_F","Motorradhelm",10],
			["H_ALFR_Headset","Headset",10]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["Masque_Chirurgical","Mundschutz",5],
			["Mask_M40","Gasmaske",5],
			["G_Shades_Black",nil,5],
			["G_Shades_Blue",nil,5],
			["G_Sport_Blackred",nil,5],
			["G_Sport_Checkered",nil,5],
			["G_Sport_Blackyellow",nil,5],
			["G_Sport_BlackWhite",nil,5],
			["G_Squares",nil,5],
			["G_Aviator",nil,5],
			["G_Lady_Mirror",nil,5],
			["G_Lady_Dark",nil,5],
			["G_Lady_Blue",nil,5],
			["G_Lowprofile",nil,5],
			["G_Bandanna_aviator",nil,5],
			["G_Diving",nil,5],
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
			["V_BandollierB_blk",nil,25],
			["V_Rangemaster_belt",nil,25],
			["TRYK_V_ArmorVest_Winter","Einsatzleiter Weste",35],
			["V_RebreatherB","Tauchgerät",50]
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
			["ACE_TacticalLadder_Pack",nil,250],
			["B_Parachute",nil,500]
		];
	};
};
