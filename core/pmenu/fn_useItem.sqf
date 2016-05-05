/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
if(player getVariable["ace_captives_isHandcuffed",true]) exitWith {hint localize "STR_Global_Restrained"};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playsound "trinken";
			life_thirst = 100;
//			player setFatigue 0; Unlogisch, oder?
		};
	};

	case (_item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playsound "trinken";
			life_thirst = 100;
			player setFatigue 0;
		};
	};

	case (_item == "cigarette"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			titleText["Du rauchst eine Zigarette","PLAIN"];
			player setFatigue 1;
			[] spawn life_fnc_useCigarette;	
		};
	};

	case (_item == "zoobeer"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playsound "trinken";
			titleText["Du hast Bier getrunken.","PLAIN"];
			life_intox = life_intox + 0.02;
		};
	};

	case (_item == "Rax's Rum"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playsound "trinken";
			titleText["Du hast Jack Daniel's Rum getrunken.","PLAIN"];
			life_thirst = 100;
			life_intox = life_intox + 0.06;
		};
	};

	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "bohrmaschine"): {
		[cursorTarget] spawn life_fnc_bohrmaschine;
		closeDialog 0;
	};

	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_intox = life_intox + 0.10;
			[] spawn life_fnc_useMarijuana;
			player setFatigue 1;
		};
	};

	case (_item == "cocainep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn
			{
				life_cocaine_effect = time;
				titleText["Du sniffst Kokain.","PLAIN"];
				player enableFatigue false;
				life_intox = life_intox + 0.10;
				[] spawn life_fnc_useCocaine;
				waitUntil {!alive player OR ((time - life_cocaine_effect) > (2 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			titleText["Du injiziert dir Heroin.","PLAIN"];
			life_intox = life_intox + 0.10;
			[] spawn life_fnc_useHeroin;
		};
	};

	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item == "BarGate"):
	{
		if(!isNull life_bargate) exitWith {hint "Du hast bereits ein BarGate in der Hand"};
		if(playerSide != civilian) then
		{
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_BarGate;
			};
		};
	};

	case (_item == "RoadCone"):
	{
		if(!isNull life_roadcone) exitWith {hint "Du hast bereits ein RoadCone in der Hand"};
		//if cop override and allow use of item
		if(playerSide != civilian) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadCone;
			};
		};
	};

	case (_item == "RoadConeB"):
	{
		if(!isNull life_roadcone) exitWith {hint "Du hast bereits eine blinkende RoadCone in der Hand"};
		//if cop override and allow use of item
		if(playerSide != civilian) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadConeB;
			};
		};
	};

	case (_item == "RoadConeStrip"):
	{
		if(!isNull life_roadcone) exitWith {hint "Du hast bereits ein RoadCone-Strip in der Hand"};
		//if cop override and allow use of item
		if(playerSide != civilian) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadConeStrip;
			};
		};
	};

	case (_item == "RoadConeStripB"):
	{
		if(!isNull life_roadcone) exitWith {hint "Du hast bereits eine blinkende RoadCone-Strip in der Hand"};
		//if cop override and allow use of item
		if(playerSide != civilian) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadConeStripB;
			};
		};
	};

	case (_item == "RoadBlockConc"):
	{
		if(!isNull life_roadblock) exitWith {hint "Du hast bereits ein Strassenblock in der Hand"};
		//if cop override and allow use of item
		if(playerSide != civilian) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadBlockConc;
			};
		};
	};

	case (_item == "RoadBlockWood"):
	{
		if(!isNull life_roadblock) exitWith {hint "Du hast bereits eine Sperre aus Holz in der Hand"};
		//if cop override and allow use of item
		if(playerSide != civilian) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadBlockWood;
			};
		};
	};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playsound "trinken";
			life_thirst = 100;
			player setFatigue 0;

			[] spawn
			{
				life_redgull_effect = time;
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
				player setFatigue 0.1;
				titleText ["Glaube der Energy-Drink hat nachgelassen","PLAIN"];
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "sos"): {
		if(playerSide == west) then {
			[_item] spawn life_fnc_SOS;
			closeDialog 0;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "fuelE"):
	{
		if(playerSide == east) then {
			if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
			[] spawn life_fnc_jerryRefuelLAC;
		};
	};
	
/*	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
		closeDialog 0;
	};*/
	
	case (_item == "nothammer"):
	{
		if(playerSide == east) then {
			[] spawn life_fnc_scheibeEinschlagen;
			closeDialog 0;
		} else {
			hint localize "STR_ISTR_NotUsable";
		};
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","keks","pizzabrot","pizza","brotteig"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	
	case (_item == "axt"):
	{
		[] spawn life_fnc_axtUse;
	};
	
	case (_item == "tracker"): {
		[cursorTarget] spawn life_fnc_gpsTracker
	};
	
	case (_item == "weddingring"):
	{
		if( life_married != "-2" ) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				hint "Du hast geheiratet. Die Regierung gratuliert dem Paar!";
				//c00l3_b4Nck3h13R = c00l3_b4Nck3h13R + 5000;
				if(life_married == "-1") then {
					life_married = "jemand";
				};
				
				[0,format["%1 und %2 haben geheiratet! Wir wünschen dem glücklichen Paar alles Gute!",profileName, life_married]] remoteExec ["life_fnc_broadcast",-2];
				life_married = "-2"; //ich werde wohl nie justin heiraten Kappa
			};
		}
		else
		{
			hint "Du kannst nur einmal heiraten... DU FREMDGEHER DU!!!!";
		};
	};

	case (_item == "presseformular"):
	{
		if(playerSide != civilian) exitWith {hint "Nur Zivilisten können das Presseformular ausfüllen!"};
		if([false,_item,1] call life_fnc_handleInv) then {
			license_civ_presse = true;
			hint parseText format["Du bist nun offiziell als Presse eingetragen.<br/><br/>Solltest du ins Gefängnis einwandern oder Personen überfallen, wird dir dieser Ausweis entzogen!"];
		};
	};
	
	case (_item == "taktikformular"):
	{
		if(playerSide != west) exitWith {hint "Nur Polizisten können das Taktikformular ausfüllen!"};
		if([false,_item,1] call life_fnc_handleInv) then {
			license_cop_taktik = true;
			hint parseText format["Du hast nun die Taktiklizent!"];
		};
	};
	
	case (_item == "taxischein"):
	{
		if(playerSide != civilian) exitWith {hint "Nur Zivilisten können den Taxi-Schein ausfüllen!"};
		if([false,_item,1] call life_fnc_handleInv) then {
			license_civ_taxischein = true;
			hint parseText format["Du bist nun offiziell als Taxi-Fahrer eingetragen.<br/><br/>Solltest du ins Gefängnis einwandern oder Personen überfallen, wird dir dieser Ausweis entzogen!"];
		};
	};
	
	case (_item == "permdriverformular"):
	{
		if(playerSide != civilian) exitWith {hint "Nur Zivilisten können das Führerscheinformular ausfüllen!"};
		if(license_civ_driver && license_civ_truck && license_civ_bus && license_civ_bike) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				license_civ_permdriver = true;
				hint parseText format["Du hast nun offiziell den PERMANENTEN FÜHRERSCHEIN.<br/><br/>Polizisten können dir diesen Führerschein abnehmen, wenn du gegen die StVO verstößt!"];
			};
		} else {
			titleText ["Du benötigst einen gültigen FÜHRERSCHEIN A, B, C und D um das Formular auszufüllen!","PLAIN"];
		};
	};
	
	case (_item == "flugscheinformular"):
	{
		if(playerSide != west) exitWith {hint "Nur Polizisten können das Führerscheinformular ausfüllen!"};
			if([false,_item,1] call life_fnc_handleInv) then {
				license_cop_air = true;
				hint parseText format["Du hast nun offiziell den Flugschein."];
			};
	};

	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;