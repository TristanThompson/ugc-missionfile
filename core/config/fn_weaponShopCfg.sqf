#include <macro.h>
/*
        File: fn_weaponShopCfg.sqf
        Author: Bryan "Tonic" Boardwine
       
        Description:
        Master configuration file for the weapon shops.
       
        Return:
        String: Close the menu
        Array:
        [Shop Name,
        [ //Array of items to add to the store
                [classname,Custom Name (set nil for default),price]
        ]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
 
switch(_shop) do
{
	case "med_supplies":
	{
		switch (true) do
		{
			case (playerSide != independent): { };
			case (__GETC__(life_mediclevel) == 1):
			{
				["Praktikant",
					[
						["SmokeShell","Verbandspäckchen",20],
						["Chemlight_green","Leichensack",10]
					]
				];
			};
			
			case (__GETC__(life_mediclevel) == 2):
			{
				["Sanitäter",
					[
						["SmokeShell","Verbandspäckchen",20],
						["SmokeShellGreen","Nähkästchen",90],
						["SmokeShellPurple","Salzlösung",15],
						["Chemlight_green","Leichensack",10]
					]
				];
			};
			
			case (__GETC__(life_mediclevel) == 3):
			{
				["Rettungsassistent",
					[
						["SmokeShell","Verbandspäckchen",20],
						["SmokeShellRed","Injektionsbeutel",50],
						["SmokeShellGreen","Nähkästchen",90],
						["SmokeShellPurple","Salzlösung",15],
						["SmokeShellBlue","Plasmabeutel",15],
						["SmokeShellOrange","Bluttransfusion",15],
						["Chemlight_green","Leichensack",10]
					]
				];
			};
			
			case (__GETC__(life_mediclevel) == 4):
			{
				["Arzt",
					[
						["SmokeShell","Verbandspäckchen",20],
						["SmokeShellYellow","Notarztkoffer",250],
						["SmokeShellRed","Injektionsbeutel",50],
						["SmokeShellGreen","Nähkästchen",90],
						["SmokeShellPurple","Salzlösung",15],
						["SmokeShellBlue","Plasmabeutel",15],
						["SmokeShellOrange","Bluttransfusion",15],
						["Chemlight_green","Leichensack",10]
					]
				];
			};
			
			case (__GETC__(life_mediclevel) >= 5):
			{
				["Oberarzt bis Chefarzt",
					[
						["SmokeShell","Verbandspäckchen",20],
						["SmokeShellYellow","Notarztkoffer",250],
						["SmokeShellRed","Injektionsbeutel",50],
						["SmokeShellGreen","Nähkästchen",90],
						["SmokeShellPurple","Salzlösung",15],
						["SmokeShellBlue","Plasmabeutel",15],
						["SmokeShellOrange","Bluttransfusion",15],
						["Chemlight_green","Leichensack",10]
					]
				];
			};			
		};
	};
	
	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): { };
			case (__GETC__(life_mediclevel) == 1): {
				["EMS Praktika",
					[
						["TRYK_headset2","Headset Groß (Nightvision)",100],
						["TRYK_Headset_NV","Headset Klein (Nightvision)",100],
						["tf_anprc148jem_13","Kurzstreckenfunk",5],

						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
			
			default {
				["EMS Grundware",
					[
						["A3L_Extinguisher","Feuerlöscher",150],
						["30Rnd_test_mag_Tracer","Löschschaum",10],
						["acc_flashlight","Taschenlampe",10],
						
						["TRYK_headset2","Headset Groß (Nightvision)",100],
						["TRYK_Headset_NV","Headset Klein (Nightvision)",100],
						["pmc_earpiece","Nachtsichtgerät",100],
						
						["tf_anprc148jem_13","Kurzstreckenfunk",5],
						["tf_anarc164","Langstreckenfunk",50],

						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
		};
	};
	
	case "adac_basic":
	{
		switch (true) do
		{
			case (playerSide != east): { };
			case (__GETC__(life_adaclevel) >= 9): {"Du bist als Justiz whitelisted, nicht als LAC!"};
			default {
				["LAC Laden",
					[
						["TRYK_G_Shades_Black_NV","Brille Schwarz (Nightvision)",100],
						["TRYK_G_Shades_Blue_NV","Brille Blau (Nightvision)",100],
						["TRYK_Shemagh_WH_NV","Schal Weiß (Nightvision)",100],
						["TRYK_Shemagh_TAN_NV","Schal Braun (Nightvision)",100],
						["pmc_earpiece","Nachtsichtgerät",100],
						["A3L_Hammer","Hammer",50],
						["A3L_Spanner","Reparaturschlüssel",50],
						["tf_anprc148jem_13","Kurzstreckenfunk",5],
						["tf_anarc164","Langstreckenfunk",50],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
		};
	};
	
	case "justiz_laden":
	{
		switch (true) do
		{
			case (playerSide != east): { };
			case (__GETC__(life_adaclevel) <= 9): {"Du bist ein Mitarbeiter des LACs!"};
			default {
				["LAC Laden",
					[
						["TRYK_G_Shades_Black_NV","Brille Schwarz (Nightvision)",50],
						["TRYK_G_Shades_Blue_NV","Brille Blau (Nightvision)",50],
						["pmc_earpiece","Nachtsichtgerät",50],
						["tf_anprc148jem_13","Kurzstreckenfunk",5],
						["Toolkit",nil,200],
						["ItemGPS",nil,10],
						["Binocular","",10],
						["ItemMap","Karte",1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["HandGrenade_Stone","Kabelbinder",40],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
		};
	};
	
	case "cop_swat":
	{
		switch (true) do
		{
			case (playerSide != west): { };
			case (__GETC__(life_donator) <= 1): {"Du bist kein Mitglied des S.W.A.T.!"};
			case (__GETC__(life_donator) >= 4): {"Du bist kein Mitglied des S.W.A.T.!"};
			default {
				["S.W.A.T.",
					[
						["NVGoggles_OPFOR","SWAT NV",150],
						
						//MP5
						["arifle_mas_mp5",nil,1250],
						["muzzle_snds_L",nil,250],
						["30Rnd_mas_9x21_Stanag",nil,50],
						
						//Scorpion
						["SMG_02_F",nil,1250],
						["muzzle_snds_L",nil,250],
						["30Rnd_9x21_Mag",nil,50],
						
						//M4A1 RIS, M16A3, M4
						["RH_M4A1_ris",nil,1600],
						["RH_qdss_nt4",nil,400],
						["30Rnd_556x45_Stanag",nil,75],
						["RH_M16A3",nil,1500],
						["RH_qdss_nt4",nil,400],
						["30Rnd_556x45_Stanag",nil,75],
						["RH_m4",nil,1500],
						["RH_qdss_nt4",nil,400],
						["30Rnd_556x45_Stanag",nil,75],
						
						//Benelli
						["R3F_M4S90",nil,2200],
						["R3F_7Rnd_M4S90",nil,75],
						
						//HK416 14,5"
						["R3F_HK416M",nil,1500],
						["R3F_SILENCIEUX_HK416",nil,400],
						["R3F_30Rnd_556x45_HK416",nil,75],
						
						//HK417 16"
						["R3F_HK417M",nil,1800],
						["R3F_SILENCIEUX_HK417",nil,400],
						["R3F_20Rnd_762x51_HK417",nil,100],
						
						//HK417 20"
						["R3F_HK417L",nil,1800],
						["R3F_SILENCIEUX_HK417",nil,400],
						["R3F_20Rnd_762x51_HK417",nil,100],
					
						//M4 Block
						["RHARD_M4DDRP_F",nil,1600],
						["muzzle_MK18_L",nil,250],
						["30Rnd_556x45_Stanag",nil,80],
						
						//MK12
						["RH_Mk12mod1",nil,1650],
						["RH_spr_mbs",nil,400],
						["RH_30Rnd_556x45_Mk262",nil,75],
						
						//LRR AWM
						["srifle_mas_lrr",nil,1750],
						["optic_mas_LRPS",nil,500],
						["muzzle_mas_snds_SH",nil,500],
						["10Rnd_mas_338_Stanag",nil,900],
						
						//G19
						["RH_g19",nil,850],
						["RH_19Rnd_9x19_g18",nil,45],
						
						//USP
						["RH_uspm",nil,800],
						["RH_16Rnd_40cal_usp",nil,40],
						
						//Kimber
						["RH_kimber_nw",nil,750],
						["RH_7Rnd_45cal_m1911",nil,35],
						
						//FNP45
						["RH_fnp45",nil,700],
						["RH_15Rnd_45cal_fnp",nil,30],
						
						//FNP45 Schild
						["KA_FNP45","SWAT FNP45",850],
						["KA_15Rnd_45ACP_Mag",nil,95],
						["KA_FNP45_Flashlight","SWAT FNP45 Flashlight",50],
						["KA_red","SWAT FNP45 RedDot",120],
						["KA_FNP45_shield2","SWAT FNP45 Schild",1500],
						
						//Taser
						["Taser_26","x26 Taser",250],
						["26_cartridge",nil,10],
						
						["RH_docter",nil,50],
						["optic_ACO_grn_smg",nil,200],
						["optic_ACO_grn",nil,200],
						["optic_mas_Holosight_blk",nil,200],
						["RH_eotech553",nil,350],
						["optic_mas_acog_eo",nil,350],
						["optic_MRCO",nil,400],
						["R3F_AIMPOINT",nil,350],
						["R3F_J4",nil,400],
						["optic_Hamr",nil,400],
						["optic_DMS",nil,400],
						["optic_NVS",nil,500],
						["RH_m3lr",nil,350],
						["optic_mas_zeiss_eo",nil,100],
						["acc_flashlight",nil,100],
						["RH_M6X","Taschenlampe (klein)",100],
						["acc_pointer_IR",nil,100],
						
						["ACE_M84",nil,300],
						
						["pmc_earpiece","Nachtsichtgerät",100],
						["tf_anprc148jem_13","Kurzstreckenfunk",10],
						["tf_anprc155","Langstreckenfunk",50],
						
						["Laserdesignator",nil,50],
						["Laserbatteries",nil,5],
						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_red","Kartenlampe (Rot)",60],
						["HandGrenade_Stone","Kabelbinder",5],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
		};
	};
	
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): { };
			case (__GETC__(life_coplevel) == 0): { };
			case (__GETC__(life_coplevel) == 1):
			{
				["Rekrut",
					[
						//FNP45
						["RH_fnp45",nil,700],
						["RH_15Rnd_45cal_fnp",nil,30],
						
						//Taser
						["Taser_26","x26 Taser",250],
						["26_cartridge",nil,10],
						
						//Laserpistole
						["Radar_Gun","Radarpistole",50],
						
						["RH_docter",nil,100],
						["RH_M6X",nil,100],
						

						["pmc_earpiece","Nachtsichtgerät",100],
						["tf_anprc148jem_13","Kurzstreckenfunk",10],
						["tf_anprc155","Langstreckenfunk",50],
						
						
						["Laserdesignator",nil,50],
						["Laserbatteries",nil,5],
						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_red","Kartenlampe (Rot)",60],
						["HandGrenade_Stone","Kabelbinder",5],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 2):
			{
				["Officer",
					[
						//MP5
						["arifle_mas_mp5",nil,1250],
						["30Rnd_mas_9x21_Stanag",nil,50],
						
						//Scorpion
						["SMG_02_F",nil,1250],
						["30Rnd_9x21_Mag",nil,50],
						
						//G19
						["RH_g19",nil,850],
						["RH_19Rnd_9x19_g18",nil,45],
						
						//USP
						["RH_uspm",nil,800],
						["RH_16Rnd_40cal_usp",nil,40],
						
						//Kimber
						["RH_kimber_nw",nil,750],
						["RH_7Rnd_45cal_m1911",nil,35],
						
						//FNP45
						["RH_fnp45",nil,700],
						["RH_15Rnd_45cal_fnp",nil,30],
						
						//Taser
						["Taser_26","x26 Taser",250],
						["26_cartridge",nil,10],
						
						//Laserpistole
						["Radar_Gun","Radarpistole",50],
						
						
						["RH_docter",nil,50],
						["optic_ACO_grn_smg",nil,200],
						["optic_ACO_grn",nil,200],
						["optic_mas_Holosight_blk",nil,200],
						["RH_eotech553",nil,350],
						["optic_mas_acog_eo",nil,350],
						["acc_flashlight",nil,100],
						["RH_M6X","Taschenlampe (klein)",100],
						

						["pmc_earpiece","Nachtsichtgerät",100],
						["tf_anprc148jem_13","Kurzstreckenfunk",10],
						["tf_anprc155","Langstreckenfunk",50],
						
						
						["Laserdesignator",nil,50],
						["Laserbatteries",nil,5],
						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_red","Kartenlampe (Rot)",60],
						["HandGrenade_Stone","Kabelbinder",5],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 3):
			{
				["Detective",
					[
						//HK416 14,5"
						["R3F_HK416M",nil,1500],
						["R3F_30Rnd_556x45_HK416",nil,75],
					
						//M4 Block
						["RHARD_M4DDRP_F",nil,1600],
						["30Rnd_556x45_Stanag",nil,80],
						
						//MP5
						["arifle_mas_mp5",nil,1250],
						["30Rnd_mas_9x21_Stanag",nil,50],
						
						//Scorpion
						["SMG_02_F",nil,1250],
						["30Rnd_9x21_Mag",nil,50],
						
						//G19
						["RH_g19",nil,850],
						["RH_19Rnd_9x19_g18",nil,45],
						
						//USP
						["RH_uspm",nil,800],
						["RH_16Rnd_40cal_usp",nil,40],
						
						//Kimber
						["RH_kimber_nw",nil,750],
						["RH_7Rnd_45cal_m1911",nil,35],
						
						//FNP45
						["RH_fnp45",nil,700],
						["RH_15Rnd_45cal_fnp",nil,30],
						
						//Taser
						["Taser_26","x26 Taser",250],
						["26_cartridge",nil,10],
						
						//Laserpistole
						["Radar_Gun","Radarpistole",50],
						
						
						["RH_docter",nil,50],
						["optic_ACO_grn_smg",nil,200],
						["optic_ACO_grn",nil,200],
						["optic_mas_Holosight_blk",nil,200],
						["RH_eotech553",nil,350],
						["optic_mas_acog_eo",nil,350],
						["optic_MRCO",nil,400],
						["R3F_AIMPOINT",nil,350],
						["R3F_J4",nil,400],
						["optic_Hamr",nil,400],
						["optic_DMS",nil,400],
						["optic_NVS",nil,500],
						["RH_m3lr",nil,350],
						["optic_DMS",nil,450],
						["acc_flashlight",nil,100],
						["RH_M6X","Taschenlampe (klein)",100],
						

						["TRYK_headset2","Headset Groß (Nightvision)",100],
						["TRYK_Headset_NV","Headset Klein (Nightvision)",100],
						["pmc_earpiece","Nachtsichtgerät",100],
						["tf_anprc148jem_13","Kurzstreckenfunk",10],
						["tf_anprc155","Langstreckenfunk",50],
						["tf_anarc164","FBI Langstreckenfunk",50],
						
						
						["Laserdesignator",nil,50],
						["Laserbatteries",nil,5],
						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_red","Kartenlampe (Rot)",60],
						["HandGrenade_Stone","Kabelbinder",5],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 4):
			{
				["Sergeant",
					[
						//M16A3, M4
						["RH_M16A3",nil,1500],
						["RH_m4",nil,1500],
						["30Rnd_556x45_Stanag",nil,75],
						
						//HK416 14,5"
						["R3F_HK416M",nil,1500],
						["R3F_30Rnd_556x45_HK416",nil,75],
						
						//Benelli
						["R3F_M4S90",nil,2200],
						["R3F_7Rnd_M4S90",nil,75],
					
						//M4 Block
						["RHARD_M4DDRP_F",nil,1600],
						["30Rnd_556x45_Stanag",nil,80],
						
						//MP5
						["arifle_mas_mp5",nil,1250],
						["30Rnd_mas_9x21_Stanag",nil,50],
						
						//Scorpion
						["SMG_02_F",nil,1250],
						["30Rnd_9x21_Mag",nil,50],
						
						//G19
						["RH_g19",nil,850],
						["RH_19Rnd_9x19_g18",nil,45],
						
						//USP
						["RH_uspm",nil,800],
						["RH_16Rnd_40cal_usp",nil,40],
						
						//Kimber
						["RH_kimber_nw",nil,750],
						["RH_7Rnd_45cal_m1911",nil,35],
						
						//FNP45
						["RH_fnp45",nil,700],
						["RH_15Rnd_45cal_fnp",nil,30],
						
						//Taser
						["Taser_26","x26 Taser",250],
						["26_cartridge",nil,10],
						
						//Laserpistole
						["Radar_Gun","Radarpistole",50],
						
						["RH_docter",nil,50],
						["optic_ACO_grn_smg",nil,200],
						["optic_ACO_grn",nil,200],
						["optic_mas_Holosight_blk",nil,200],
						["RH_eotech553",nil,350],
						["optic_mas_acog_eo",nil,350],
						["optic_MRCO",nil,400],
						["R3F_AIMPOINT",nil,350],
						["R3F_J4",nil,400],
						["optic_Hamr",nil,400],
						["optic_DMS",nil,400],
						["optic_NVS",nil,500],
						["RH_m3lr",nil,350],
						["acc_flashlight",nil,100],
						["RH_M6X","Taschenlampe (klein)",100],
						

						["TRYK_headset2","Headset Groß (Nightvision)",100],
						["TRYK_Headset_NV","Headset Klein (Nightvision)",100],
						["pmc_earpiece","Nachtsichtgerät",100],
						["tf_anprc148jem_13","Kurzstreckenfunk",10],
						["tf_anprc155","Langstreckenfunk",50],
						["tf_anarc164","FBI Langstreckenfunk",50],
						
						
						["Laserdesignator",nil,50],
						["Laserbatteries",nil,5],
						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_red","Kartenlampe (Rot)",60],
						["HandGrenade_Stone","Kabelbinder",5],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 5):
			{
				["1st Sergeant",
					[
						//M4A1 RIS, M16A3, M4
						["RH_M4A1_ris",nil,1600],
						["RH_M16A3",nil,1500],
						["RH_m4",nil,1500],
						["30Rnd_556x45_Stanag",nil,75],
						
						//HK416 14,5"
						["R3F_HK416M",nil,1500],
						["R3F_30Rnd_556x45_HK416",nil,75],
						
						//Benelli
						["R3F_M4S90",nil,2200],
						["R3F_7Rnd_M4S90",nil,75],
					
						//M4 Block
						["RHARD_M4DDRP_F",nil,1600],
						["30Rnd_556x45_Stanag",nil,80],
						
						//MP5
						["arifle_mas_mp5",nil,1250],
						["30Rnd_mas_9x21_Stanag",nil,50],
						
						//Scorpion
						["SMG_02_F",nil,1250],
						["30Rnd_9x21_Mag",nil,50],
						
						//G19
						["RH_g19",nil,850],
						["RH_19Rnd_9x19_g18",nil,45],
						
						//USP
						["RH_uspm",nil,800],
						["RH_16Rnd_40cal_usp",nil,40],
						
						//Kimber
						["RH_kimber_nw",nil,750],
						["RH_7Rnd_45cal_m1911",nil,35],
						
						//FNP45
						["RH_fnp45",nil,700],
						["RH_15Rnd_45cal_fnp",nil,30],
						
						//Taser
						["Taser_26","x26 Taser",250],
						["26_cartridge",nil,10],
						
						//Laserpistole
						["Radar_Gun","Radarpistole",50],
						
						
						["RH_docter",nil,50],
						["optic_ACO_grn_smg",nil,200],
						["optic_ACO_grn",nil,200],
						["optic_mas_Holosight_blk",nil,200],
						["RH_eotech553",nil,350],
						["optic_mas_acog_eo",nil,350],
						["optic_MRCO",nil,400],
						["R3F_AIMPOINT",nil,350],
						["R3F_J4",nil,400],
						["optic_Hamr",nil,400],
						["optic_DMS",nil,400],
						["optic_NVS",nil,500],
						["RH_m3lr",nil,350],
						["acc_flashlight",nil,100],
						["RH_M6X","Taschenlampe (klein)",100],
						

						["TRYK_headset2","Headset Groß (Nightvision)",100],
						["TRYK_Headset_NV","Headset Klein (Nightvision)",100],
						["pmc_earpiece","Nachtsichtgerät",100],
						["tf_anprc148jem_13","Kurzstreckenfunk",10],
						["tf_anprc155","Langstreckenfunk",50],
						["tf_anarc164","FBI Langstreckenfunk",50],
						
						
						["Laserdesignator",nil,50],
						["Laserbatteries",nil,5],
						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_red","Kartenlampe (Rot)",60],
						["HandGrenade_Stone","Kabelbinder",5],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
			
			case (__GETC__(life_coplevel) >= 6):
			{
				["Lt. bis CoP.",
					[
						//HK417 16"
						["R3F_HK417M",nil,1800],
						["R3F_20Rnd_762x51_HK417",nil,100],
						
						//M4A1 RIS, M16A3, M4
						["RH_M4A1_ris",nil,1600],
						["RH_M16A3",nil,1500],
						["RH_m4",nil,1500],
						["30Rnd_556x45_Stanag",nil,75],
						
						//HK416 14,5"
						["R3F_HK416M",nil,1500],
						["R3F_30Rnd_556x45_HK416",nil,75],
						
						//Benelli
						["R3F_M4S90",nil,2200],
						["R3F_7Rnd_M4S90",nil,75],
					
						//M4 Block
						["RHARD_M4DDRP_F",nil,1600],
						["30Rnd_556x45_Stanag",nil,80],
						
						//MP5
						["arifle_mas_mp5",nil,1250],
						["30Rnd_mas_9x21_Stanag",nil,50],
						
						//Scorpion
						["SMG_02_F",nil,1250],
						["30Rnd_9x21_Mag",nil,50],
						
						//G19
						["RH_g19",nil,850],
						["RH_19Rnd_9x19_g18",nil,45],
						
						//USP
						["RH_uspm",nil,800],
						["RH_16Rnd_40cal_usp",nil,40],
						
						//Kimber
						["RH_kimber_nw",nil,750],
						["RH_7Rnd_45cal_m1911",nil,35],
						
						//FNP45
						["RH_fnp45",nil,700],
						["RH_15Rnd_45cal_fnp",nil,30],
						
						//Taser
						["Taser_26","x26 Taser",250],
						["26_cartridge",nil,10],
						
						//Laserpistole
						["Radar_Gun","Radarpistole",50],
						
						
						["RH_docter",nil,50],
						["optic_ACO_grn_smg",nil,200],
						["optic_ACO_grn",nil,200],
						["optic_mas_Holosight_blk",nil,200],
						["RH_eotech553",nil,350],
						["optic_mas_acog_eo",nil,350],
						["optic_MRCO",nil,400],
						["R3F_AIMPOINT",nil,350],
						["R3F_J4",nil,400],
						["optic_Hamr",nil,400],
						["optic_DMS",nil,400],
						["optic_NVS",nil,500],
						["RH_m3lr",nil,350],
						["acc_flashlight",nil,100],
						["RH_M6X","Taschenlampe (klein)",100],
						

						["TRYK_headset2","Headset Groß (Nightvision)",100],
						["TRYK_Headset_NV","Headset Klein (Nightvision)",100],
						["pmc_earpiece","Nachtsichtgerät",100],
						["tf_anprc148jem_13","Kurzstreckenfunk",10],
						["tf_anprc155","Langstreckenfunk",50],
						["tf_anarc164","FBI Langstreckenfunk",50],
						
						
						["Laserdesignator",nil,50],
						["Laserbatteries",nil,5],
						["ToolKit",nil,200],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",40],
						["Chemlight_red","Kartenlampe (Rot)",60],
						["HandGrenade_Stone","Kabelbinder",5],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): { };
			case (!license_civ_rebel): {"Du besitzt keine Rebellenausbildung!"};
			case ((license_civ_rebel)):
			{
				["Muhli's Outlaw Laden",
					[
						["arifle_mas_lee",nil,17500],
					//	["optic_LRPS",nil,500],
					//	["muzzle_snds_B",nil,1750],
						["5Rnd_mas_762x51_Stanag",nil,400],
				//CZ + AR10
						["A3L_CZ550",nil,16500],
						["A3L_CZ550Scope",nil,500],
						["A3L_CZ550mag",nil,100],
						["RH_ar10",nil,16000],
						["RH_Delft",nil,500],
						["RH_20Rnd_762x51_AR10",nil,350],
						
				//Benelli
						["R3F_M4S90",nil,15550],
						["R3F_7Rnd_M4S90",nil,375],
						
				//Ak´s 7.62	
						["hlc_rifle_ak47",nil,15000],
						["hlc_rifle_akm",nil,15000],
						["HLC_Optic_PSO1",nil,350],
						["hlc_optic_kobra",nil,220],
						["hlc_30Rnd_762x39_b_ak",nil,350],

				//Famas
						["R3F_Famas_surb",nil,14000],
						["R3F_AIMPOINT",nil,325],
						["R3F_J4",nil,400],
						["R3F_LAMPE_SURB",nil,150],
						["R3F_SILENCIEUX_FAMAS",nil,1000],
						["R3F_30Rnd_556x45_FAMAS",nil,175],		
						
				//G36C
						["arifle_mas_g36c",nil,13500],
						["optic_mas_acog_eo",nil,325],
						["muzzle_snds_M",nil,1350],
						["30Rnd_mas_556x45_Stanag",nil,200],

				//Ak´s 5.45
						["hlc_rifle_ak74",nil,13000],
						["hlc_rifle_aks74",nil,13000],
						["hlc_rifle_aek971",nil,12500],
						["hlc_rifle_aks74u",nil,12500],
						["HLC_Optic_PSO1",nil,350],
						["hlc_optic_kobra",nil,220],
						["hlc_rifle_ak12",nil,12000],
						["hlc_30Rnd_545x39_B_AK",nil,165],
						
				//Vitor + Samr
						["RH_SAMR",nil,12000],
						["RH_spr_mbs",nil,1500],
						["RH_30Rnd_556x45_Mk262",nil,120],
						["RH_M4sbr_b",nil,12000],
						["RH_qdss_nt4",nil,1500],
						["30Rnd_556x45_Stanag",nil,115],
						["RH_eotech553",nil,175],
						["RH_ta31rco",nil,225],
						["RH_shortdot",nil,225],
						["RH_m3lr",nil,295],
						
				//Vitor + Samr + Ak12 + G36C Visiere & Aufsätze
						["optic_Aco_smg",nil,205],
						["optic_ACO_grn",nil,205],
						["optic_Holosight",nil,150],
						["optic_Arco",nil,310],
						["optic_Hamr",nil,310],
						["optic_MRCO",nil,310],
						["optic_DMS",nil,420],
						//["ACE_acc_pointer_red",nil,100],
						["acc_flashlight",nil,95],
						
				//Maschienenpistolen
						["RH_vz61",nil,5100],
						["RH_20Rnd_32cal_vz61",nil,115],
						["RH_muzi",nil,5100],
						["RH_30Rnd_9x19_UZI",nil,115],
						
				//Pistole mit Schildoption
						["KA_FNP45",nil,3950],
						["KA_15Rnd_45ACP_Mag",nil,95],
						
				//NV-Goggles
						["TRYK_headset2","Headset Groß (Nightvision)",500],
						["TRYK_Headset_NV","Headset Klein (Nightvision)",500],
						["TRYK_Shemagh_G_NV","Schal Grün (Nightvision)",300],
						["TRYK_Shemagh_TAN_NV","Schal Tarnfleck (Nightvision)",300],
						["TRYK_Shemagh_WH_NV","Schal Weis (Nightvision)",300],
						
				//TFAR + ACE + Standart
						["tf_fadak","Walkie-Talkie",25],
						["tf_mr3000","Langstreckenfunk",250],
						["ToolKit",nil,450],
						["ItemGPS",nil,10],
						["Binocular",nil,10],
						["ItemMap",nil,1],
						["ItemCompass",nil,1],
						["SmokeShell","Verbandspäckchen ",50],
						["SmokeShellGreen","Abbindmaterial",500],
						["SmokeShellRed","Injektionsbeutel",1500],
						["Chemlight_yellow","Kartenlampe (Weiss)",80],
						["Chemlight_red","Kartenlampe (Rot)",120],
						["HandGrenade_Stone","Kabelbinder",50],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): { };
			case (!license_civ_gun): {"Du besitzt keinen gültigen Waffenschein!"};
			case ((license_civ_gun)):
			{
				["Billy Joe's Feuerwaffen",
					[
						["arifle_SDAR_F","Gummigeschoss-Waffe",6250],
						["30Rnd_556x45_Stanag_Tracer_Red","Gummigeschosse",70],
						["RH_gsh18",nil,1250],
						["RH_18Rnd_9x19_gsh",nil,50],
						["RH_g17",nil,1150],
						["RH_17Rnd_9x19_g17",nil,45],
						["RH_m9",nil,1150],
						["RH_15Rnd_9x19_M9",nil,40],
						["RH_sw659",nil,1025],
						["RH_14Rnd_9x19_sw",nil,35],
						["RH_p226",nil,1025],
						["RH_15Rnd_9x19_SIG",nil,35],
						["RH_cz75",nil,1000],
						["RH_A26",nil,100],
						["RH_16Rnd_9x19_CZ",nil,30],
						["RH_mak",nil,975],
						["RH_pmIR",nil,100],
						["RH_8Rnd_9x18_Mak",nil,25],
						["RH_M6X","Taschenlampe (klein)",50],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
		};
	};
	
   	case "gun_illegal":
	{
		switch(true) do
		{
			case (playerSide != civilian): { };
			case (!license_civ_ilgun): {"Du besitzt die Mitgliedschafts-Karte Billy-Joes Club nicht!"};
			case ((license_civ_ilgun)):
			{
				["Billy Joe's Hinterzimmer",
					[
						["RH_bullb",nil,6450],
						["RH_6Rnd_454_Mag",nil,150],
						["RH_Deaglem",nil,6350],
						["RH_demz",nil,200],
						["optic_Yorris",nil,150],
						["RH_7Rnd_50_AE",nil,140],
						["RH_fn57",nil,4000],
						["RH_20Rnd_57x28_FN",nil,75],
						["RH_usp",nil,3950],
						["RH_12Rnd_45cal_usp",nil,75],
						["RH_m1911",nil,3950],
						["RH_7Rnd_45cal_m1911",nil,75],
						["RH_g18",nil,1550],
						["RH_19Rnd_9x19_g18",nil,65],
						["RH_M6X","Taschenlampe (klein)",50],
						["RH_vp70",nil,1085],
						["RH_vp70stock",nil,175],
						["RH_18Rnd_9x19_VP",nil,40],
						["Chemlight_blue","Ohrstöpsel",1]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Lakeside General Store",
			[
				["tf_fadak","Walkie-Talkie",25],
				["ToolKit",nil,450],
				["TRYK_G_Shades_Black_NV","Brille Schwarz (Nightvision)",120],
				["TRYK_G_Shades_Blue_NV","Brille Blau (Nightvision)",120],
				["TRYK_Shemagh_G_NV","Schal Grün (Nightvision)",120],
				["TRYK_Shemagh_TAN_NV","Schal Tarnfleck (Nightvision)",120],
				["TRYK_Shemagh_WH_NV","Schal Weis (Nightvision)",120],
				["Binocular",nil,85],
				["ItemGPS",nil,20],
				["ItemMap",nil,1],
				["ItemCompass",nil,1],
				["A3L_sign",nil,100],
				["A3L_sign2",nil,100],
				["Tv_Camera",nil,185],
				["SmokeShell","Verbandspäckchen ",50],
				["Chemlight_yellow","Kartenlampe (Weiss)",40],
				["Chemlight_blue","Ohrstöpsel",1]
			]
		];
	};
};
