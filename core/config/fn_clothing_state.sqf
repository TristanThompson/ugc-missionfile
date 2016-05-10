/*
	File: fn_clothing_state.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
#include <macro.h>
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
//ctrlSetText[3104,"FBI Clothing Shop"];

If (__GETC__(life_donator) <= 1)exitwith{closeDialog 0; hint "Du bist nicht in der State Police Abteilung tätig (-Dlvl)"};
If (__GETC__(life_donator) >= 4)exitwith{closeDialog 0; hint "Du bist nicht in der State Police Abteilung tätig (+Dlvl)"};

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["TCG_SWAT","SWAT",7],
			["swat_uni1","SWAT 2",7],
			["TCG_SERT","SERT Uniform",10],
			["sert_uni1","SERT Uniform 2",10],
			["sp_rang3","State Detective Kurz",20],
			["mr_pol_cloth_state_c_3","State Detective Lang",20],
			["sp_rang4","State Sergeant Kurz",20],
			["mr_pol_cloth_state_c_4","State Sergeant Lang",20],
			["sp_rang5","State 1st Sergeant Kurz",20],
			["mr_pol_cloth_state_c_5","State 1st Sergeant Lang",20],
			["sp_rang6","State Lieutenant Kurz",20],
			["mr_pol_cloth_state_c_6","State Lieutenant Lang",20],
			["sp_rang7","State 1st Lieutenant Kurz",20],
			["mr_pol_cloth_state_c_7","State 1st Lieutenant Lang",20],
			["sp_rang8","State Captain Kurz",20],
			["mr_pol_cloth_state_c_8","State Captain Lang",20],
			["sp_rang9","State Commander Kurz",20],
			["mr_pol_cloth_state_c_9","State Commander Lang",20],
			["sp_rang10","State Dep. Chief Kurz",20],
			["mr_pol_cloth_state_c_10","State Dep. Chief Lang",20],
			["sp_rang11","State Ast. Chief Kurz",20],
			["mr_pol_cloth_state_c_11","State Ast. Chief Lang",20],
			["sp_rang12","State Chief Kurz",20],
			["mr_pol_cloth_state_c_12","State Chief Lang",20],
			["mr_pol_cloth_state_c_13","State Commissioner Lang",20]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_pmc","SWAT Mütze",10],
			["H_Capbw_pmc","SWAT Mütze",10],
			["H_Cap_tan_pmc","STATE Mütze",10],
			["H_Capbw_tan_pmc","STATE Mütze",10],
			["do_swatcap","SWAT Kappe",2],
			["TRYK_H_PASGT_BLK","SWAT Helm (black)",25],
			["RPIMA_helm","Schwerer Schutzhelm",28],
			["TCG_swathelmet",nil,28],
			["TCG_serthelmet",nil,28],
			["ATHhelm_Balaclava4","SERT Helm",28],
			["ATHhelm_Balaclava1","SERT Helm",28],
			["RPIMA_helm","Schwerer Schutzhelm",28],
			["gign_helm3","Leichter Schutzhelm",12],
			["gign_helm4","Leichter Schutzhelm",12],
			["gign_Balaclava","Taktische Maske",2],
			["Campaign_Hat_Dark","LVPD Swat Hut",17],
			["TRYK_H_PASGT_OD","SERT Helm",20],
			["RPIMA_Balaclava2","SERT Balaclava",20],
			["H_Beret_blk",nil,20],
			["H_Beret_Colonel",nil,20],
			["H_Watchcap_blk","Wollmütze Headset (Schwarz)",20],
			["TRYK_H_woolhat","Wollmütze (Schwarz)",20],
			["H_Watchcap_camo","Wollmütze Headset (grün)",20]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Bandanna_oli","Mundtuch Grün",5],
			["G_Bandanna_aviator","Mundtuch Schwarz",5],
			["TRYK_Spset_PHC2_Glasses",nil,2],
			["TRYK_kio_balaclava_ESS","Sturmhaube Brille",4],
			["TRYK_US_ESS_Glasses_BLK","SWAT Brille (black)",4],
			["TRYK_kio_balaclava_BLK_ear","Sturmhaube Headset (black)",7],
			["TRYK_kio_balaclava_ear","Sturmhaube (ghost)",4],
			["Mask_M40","Gasmaske",13],
			["G_Shades_Black",nil,1],
			["G_Shades_Blue",nil,1],
			["G_Sport_Blackred",nil,1],
			["G_Sport_Checkered",nil,1],
			["G_Sport_Blackyellow",nil,1],
			["G_Sport_BlackWhite",nil,1],
			["G_Spectacles_Tinted",nil,1],
			["G_Squares",nil,1],
			["G_Aviator",nil,5],
			["G_Lady_Mirror",nil,7],
			["G_Lady_Dark",nil,7],
			["G_Lady_Blue",nil,7],
			["G_Lowprofile",nil,2],
			["G_Combat",nil,3]
		];
	};
	
	//Vest
	case 3:
	{
		[
			//["A3L_deptjvest1","State Police",25],
			["TRYK_V_Bulletproof_SP","State Police",25],
			["V_PlateCarrier1_PMC_rgr","SERT Weste",25],
			["SERTvest1","SERT Weste Groß",25],
			["V_PlateCarrier1_PMC_blk","SWAT Weste",25],
			["SWATvest1","SWAT Weste Groß",25]
			
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Kitbag_mcamo",nil,25],
			["B_TacticalPack_oli",nil,20],
			["B_FieldPack_ocamo",nil,15],
			["B_Bergen_sgg",nil,25],
			["B_Kitbag_cbr",nil,25],
			["B_Carryall_oli",nil,25],
			["B_Carryall_khk",nil,25]
		];
	};
	
};
