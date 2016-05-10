/*
	File: fn_copShowLicense.sqf
	Author: ???
		edit by VariatoX
		edit by Bastian "Janl1.DE" Schumacher
			
	Server: lakeside-reallife.de
	
	Description:
	Show cop license to target player
	All pictures are copyright by its creator (in this case VariatoX)
	New: The Id card equals to the profile pictrue

*/

private ["_target", "_message","_rank","_rankSpec","_coplevel","_mediclevel",
"_adaclevel","_id","_pkw","_lkw","_presse","_donlevel","_rankSpec","_fish","_trank","_head"];

_target = cursorTarget;

if(isNull _target) exitWith {};
if(!(_target isKindOf "Man")) exitWith {};
if(!(alive _target)) exitWith {};

if(playerSide == west) then
{
	_coplevel = call life_coplevel;
	_donlevel = call life_donator;
	
	switch (_coplevel) do
	{
		case 1: { _rank = "<img image='images\idcards\cop\1.jpg' size='8.5'/>";};
		case 2: { _rank = "<img image='images\idcards\cop\2.jpg' size='8.5'/>";};
		case 3: { _rank = "<img image='images\idcards\cop\3.jpg' size='8.5'/>";};
		case 4: { _rank = "<img image='images\idcards\cop\4.jpg' size='8.5'/>";};
		case 5: { _rank = "<img image='images\idcards\cop\5.jpg' size='8.5'/>";};
		case 6: { _rank = "<img image='images\idcards\cop\6.jpg' size='8.5'/>";};
		case 7: { _rank = "<img image='images\idcards\cop\7.jpg' size='8.5'/>";};
		case 8: { _rank = "<img image='images\idcards\cop\8.jpg' size='8.5'/>";};
		case 9: { _rank = "<img image='images\idcards\cop\9.jpg' size='8.5'/>";};
		case 10: { _rank = "<img image='images\idcards\cop\10.jpg' size='8.5'/>";};
		case 11: { _rank = "<img image='images\idcards\cop\11.jpg' size='8.5'/>";};
		case 12: { _rank = "<img image='images\idcards\cop\12.jpg' size='8.5'/>";};
	};

// Don 2,3 = State Police/SWAT
// Don 4,5 = FBI/Underkoffer
//	if((_donlevel == 2) OR (_donlevel == 3)) then {_rankSpec = "<img image='images\idcards\cop\spec\swat.paa' size='8'/>";} else {""};
	_rankSpec = if((_donlevel == 4) OR (_donlevel == 5)) then {"<img image='images\idcards\cop\spec\fbi.jpg' size='7.5'/>";} else {"<br/>"};

	_message = format["<t size='1.25'>%1</t><br/><br/>%2<br/><br/>%3", name player, _rank, _rankSpec];
//	[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
	[_message] remoteExec ["life_fnc_copLicenseShown",_target];
};

if(playerSide == independent) then
{
	_mediclevel = call life_mediclevel;
	
	switch (_mediclevel) do
	{
		case 1: { _rank = "<img image='images\idcards\med\1.jpg' size='8.5'/>"; _trank = "Praktikant"};
		case 2: { _rank = "<img image='images\idcards\med\2.jpg' size='8.5'/>"; _trank = "Sanitäter"};
		case 3: { _rank = "<img image='images\idcards\med\3.jpg' size='8.5'/>"; _trank = "Rettungsassist."};
		case 4: { _rank = "<img image='images\idcards\med\4.jpg' size='8.5'/>"; _trank = "Notarzt"};
		case 5: { _rank = "<img image='images\idcards\med\5.jpg' size='8.5'/>"; _trank = "Oberarzt"};
		case 6: { _rank = "<img image='images\idcards\med\6.jpg' size='8.5'/>"; _trank = "Chefarzt"};
	};

	_message = format["<color='#FFFFFF'/><t size='2'>%1</t><br/><t size='1.5'>%2</t><br/><t size='2.5' color='#ff0000'>%3</t>", name player, _rank, _trank];
	
//	[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
	[_message] remoteExec ["life_fnc_copLicenseShown",_target];
};

if(playerSide == east) then
{
	_adaclevel = call life_adaclevel;
	
	switch (_adaclevel) do
	{
		case 1: { _rank = "Auszubildender";};
		case 2: { _rank = "LAC-Mechaniker";};
		case 3: { _rank = "LAC-Mechatroniker";};	
		case 4: { _rank = "LAC-Meister";};
		case 5: { _rank = "Betriebsleiter";};
		case 6: { _rank = "Ausbilder";};
		case 7: { _rank = "Co-LAC Leiter";};
		case 8: { _rank = "LAC Leiter";};
		case 9: { _rank = "!!REPORT ADMIN!!";};
		case 10: { _rank = "Staatsanwalt";};
		case 11: { _rank = "Richter";};
	};

	if(_adaclevel in [10,11]) then {
		_message = format["<color='#FFFFFF'/><t size='2'>%1</t><br/><t size='1.5'>%2</t><br/><t size='2.5' color='#d6c610'>Judikative</t>", name player, _rank];
//		[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
		[_message] remoteExec ["life_fnc_copLicenseShown",_target];
	} else {
		_message = format["<color='#FFFFFF'/><t size='2'>%1</t><br/><t size='1.5'>%2</t><br/><t size='2.5' color='#d6c610'>L.A.C</t>", name player, _rank];
//		[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
		[_message] remoteExec ["life_fnc_copLicenseShown",_target];
	};
};

if(playerSide == civilian) then
{
	_head = face player;
	switch (_head) do
	{
		case "AfricanHead_01": {_id =  "<img image='\UGC_Ausweise\Civ\id_AfricanHead_01.paa' size='8'/>";};
		case "AfricanHead_02": {_id =  "<img image='\UGC_Ausweise\Civ\id_AfricanHead_02.paa' size='8'/>";};
		case "AfricanHead_03": {_id =  "<img image='\UGC_Ausweise\Civ\id_AfricanHead_03.paa' size='8'/>";};
		case "AsianHead_A3_01": {_id =  "<img image='\UGC_Ausweise\Civ\id_AsianHead_A3_01.paa' size='8'/>";};
		case "AsianHead_A3_02": {_id =  "<img image='\UGC_Ausweise\Civ\id_AsianHead_A3_02.paa' size='8'/>";};
		case "AsianHead_A3_03": {_id =  "<img image='\UGC_Ausweise\Civ\id_AsianHead_A3_03.paa' size='8'/>";};
		case "Cheung": {_id =  "<img image='\UGC_Ausweise\Civ\id_Cheung.paa' size='8'/>";};
		case "COREV_AsianHead_A3_04": {_id =  "<img image='\UGC_Ausweise\Civ\id_COREV_AsianHead_A3_04.paa' size='8'/>";};
		case "COREV_AsianHead_A3_05": {_id =  "<img image='\UGC_Ausweise\Civ\id_COREV_AsianHead_A3_05.paa' size='8'/>";};
		case "COREV_AsianHead_A3_06": {_id =  "<img image='\UGC_Ausweise\Civ\id_COREV_AsianHead_A3_06.paa' size='8'/>";};
		case "COREV_AsianHead_A3_07": {_id =  "<img image='\UGC_Ausweise\Civ\id_COREV_AsianHead_A3_07.paa' size='8'/>";};
		case "COREV_AsianHead_A3_08": {_id =  "<img image='\UGC_Ausweise\Civ\id_COREV_AsianHead_A3_08.paa' size='8'/>";};
		case "COREV_AsianHead_A3_09": {_id =  "<img image='\UGC_Ausweise\Civ\id_COREV_AsianHead_A3_09.paa' size='8'/>";};
		case "GreekHead_A3_01": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_01.paa' size='8'/>";};
		case "GreekHead_A3_02": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_02.paa' size='8'/>";};
		case "GreekHead_A3_03": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_03.paa' size='8'/>";};
		case "GreekHead_A3_04": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_04.paa' size='8'/>";};
		case "GreekHead_A3_05": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_05.paa' size='8'/>";};
		case "GreekHead_A3_06": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_06.paa' size='8'/>";};
		case "GreekHead_A3_07": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_07.paa' size='8'/>";};
		case "GreekHead_A3_08": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_08.paa' size='8'/>";};
		case "GreekHead_A3_09": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_09.paa' size='8'/>";};
		case "GreekHead_A3_10_a": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_10_a.paa' size='8'/>";};
		case "GreekHead_A3_10_l": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_10_l.paa' size='8'/>";};
		case "GreekHead_A3_10_sa": {_id =  "<img image='\UGC_Ausweise\Civ\id_GreekHead_A3_10_sa.paa' size='8'/>";};
		case "ice123_female_bare": {_id =  "<img image='\UGC_Ausweise\Civ\id_ice123_female_bare.paa' size='8'/>";};
		case "ice123_female_hair": {_id =  "<img image='\UGC_Ausweise\Civ\id_ice123_female_hair.paa' size='8'/>";};
		case "Mason": {_id =  "<img image='\UGC_Ausweise\Civ\id_Mason.paa' size='8'/>";};
		case "Mason_camo": {_id =  "<img image='\UGC_Ausweise\Civ\id_Mason_camo.paa' size='8'/>";};
		case "Mason_Rigged": {_id =  "<img image='\UGC_Ausweise\Civ\id_Mason_Rigged.paa' size='8'/>";};
		case "Mason_scars": {_id =  "<img image='\UGC_Ausweise\Civ\id_Mason_scars.paa' size='8'/>";};
		case "Mason_v2": {_id =  "<img image='\UGC_Ausweise\Civ\id_Mason_v2.paa' size='8'/>";};
		case "Oakes": {_id =  "<img image='\UGC_Ausweise\Civ\id_Oakes.paa' size='8'/>";};
		case "Oakes_v2": {_id =  "<img image='\UGC_Ausweise\Civ\id_Oakes_v2.paa' size='8'/>";};
		case "PersianHead_A3_01": {_id =  "<img image='\UGC_Ausweise\Civ\id_PersianHead_A3_01.paa' size='8'/>";};
		case "PersianHead_A3_02": {_id =  "<img image='\UGC_Ausweise\Civ\id_PersianHead_A3_02.paa' size='8'/>";};
		case "PersianHead_A3_03": {_id =  "<img image='\UGC_Ausweise\Civ\id_PersianHead_A3_03.paa' size='8'/>";};
		case "PersianHead_A3_04_a": {_id =  "<img image='\UGC_Ausweise\Civ\id_PersianHead_A3_04_a.paa' size='8'/>";};
		case "PersianHead_A3_04_l": {_id =  "<img image='\UGC_Ausweise\Civ\id_PersianHead_A3_04_l.paa' size='8'/>";};
		case "PersianHead_A3_04_sa": {_id =  "<img image='\UGC_Ausweise\Civ\id_PersianHead_A3_04_sa.paa' size='8'/>";};
		case "Quereshi": {_id =  "<img image='\UGC_Ausweise\Civ\id_Quereshi.paa' size='8'/>";};
		case "Quereshi_v2": {_id =  "<img image='\UGC_Ausweise\Civ\id_Quereshi_v2.paa' size='8'/>";};
		case "Sean_Connery": {_id =  "<img image='\UGC_Ausweise\Civ\id_Sean_Connery.paa' size='8'/>";};
		case "Smith": {_id =  "<img image='\UGC_Ausweise\Civ\id_Smith.paa' size='8'/>";};
		case "Smith_v2": {_id =  "<img image='\UGC_Ausweise\Civ\id_Smith_v2.paa' size='8'/>";};
		case "Tyler": {_id =  "<img image='\UGC_Ausweise\Civ\id_Tyler.paa' size='8'/>";};
		case "Tyler_scars": {_id =  "<img image='\UGC_Ausweise\Civ\id_Tyler_scars.paa' size='8'/>";};
		case "WhiteHead_01": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_01.paa' size='8'/>";};
		case "WhiteHead_02": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_02.paa' size='8'/>";};
		case "WhiteHead_03": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_03.paa' size='8'/>";};
		case "WhiteHead_04": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_04.paa' size='8'/>";};
		case "WhiteHead_05": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_05.paa' size='8'/>";};
		case "WhiteHead_06": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_06.paa' size='8'/>";};
		case "WhiteHead_07": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_07.paa' size='8'/>";};
		case "WhiteHead_08": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_08.paa' size='8'/>";};
		case "WhiteHead_09": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_09.paa' size='8'/>";};
		case "WhiteHead_10": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_10.paa' size='8'/>";};
		case "WhiteHead_11 ": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_11.paa' size='8'/>";};
		case "WhiteHead_12": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_12.paa' size='8'/>";};
		case "WhiteHead_13": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_13.paa' size='8'/>";};
		case "WhiteHead_14": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_14.paa' size='8'/>";};
		case "WhiteHead_15": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_15.paa' size='8'/>";};
		case "WhiteHead_16": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_16.paa' size='8'/>";};
		case "WhiteHead_17": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_17.paa' size='8'/>";};
		case "WhiteHead_18": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_18.paa' size='8'/>";};
		case "WhiteHead_19": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_19.paa' size='8'/>";};
		case "WhiteHead_20": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_20.paa' size='8'/>";};
		case "WhiteHead_21": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_21.paa' size='8'/>";};
		case "WhiteHead_22_a": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_22_a.paa' size='8'/>";};
		case "WhiteHead_22_l": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_22_l.paa' size='8'/>";};
		case "WhiteHead_22_sa": {_id =  "<img image='\UGC_Ausweise\Civ\id_WhiteHead_22_sa.paa' size='8'/>";};
		//If there is something wrong (in the players profile) we take the default pictrue
		default {_id =  "<img image='images\idcards\civ\id_card.paa' size='8'/>";};
	};
	
	_presse = if(license_civ_presse) then {"<img image='images\idcards\civ\id_presse.paa' size='8'/>";} else {"<br/>"};
	_pkw = if(license_civ_driver) then {"<img image='images\idcards\civ\id_pkw.paa' size='8'/>";} else {"<br/>"}; 
	_lkw = if(license_civ_truck) then {"<img image='images\idcards\civ\id_lkw.paa' size='8'/>";} else {"<br/>"};
	_gun = if(license_civ_gun) then {"<img image='images\idcards\civ\Waffenschein.paa' size='8'/>";} else {"<br/>"};
	
	_message = format["<t size='1.25'>%1</t><br/><br/>%2<br/>%3<br/>%4<br/>%5<br/>%6<br/>",name player,_id,_pkw,_lkw,_presse,_gun];
//	[[player, _message],"life_fnc_copLicenseShown",_target,false] spawn life_fnc_MP;
	[_message] remoteExec ["life_fnc_copLicenseShown",_target];
};
