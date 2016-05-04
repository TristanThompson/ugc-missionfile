 /*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:			/*	Z I V I L I S T E N  */
	{
	
	//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		
	//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "static_dead" && !(cursorTarget getVariable["robbed",FALSE]) ']];
	//Spikes
		life_actions = life_actions + [player addAction[localize "STR_ISTR_Spike_Pack",life_fnc_packupSpikes,"",0,false,false,"",'_spikes = nearestObjects[getPos player,["A3L_SpikeStrip"],3] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];

	//Ausweis
		life_actions = life_actions + [player addAction["<t color='#FF00FF'>ID Card Zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",'
		playerSide == civilian && !isNull cursorTarget && player distance cursorTarget < 2.5 && cursorTarget isKindOf "Man" && alive cursortarget ']];
		
	//Vibrationsalarm AN
	//	life_actions = life_actions + [player addAction["<t color='#00BFFF'>Vibration An</t>",life_fnc_vibration,"",0,false,true,"",'!lrl_vibratooor']];
		
	//Vibrationsalarm AUS
	//	life_actions = life_actions + [player addAction["<t color='#00BFFF'>Vibration Aus</t>",life_fnc_vibration,"",0,false,true,"",'lrl_vibratooor']];
	};
	
	case west:
	{
	// Heli Fast Rope
		life_actions = life_actions + [player addAction["Abseilen",life_fnc_fastRope,"",99,false,false,"", '
		(vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 100 && (getPos player) select 2 >= 15 && speed vehicle player < 20 && !(player getVariable["transporting",false]) ']];
		
	//place bargate
		life_actions = life_actions + [player addAction["Platziere BarGate",{if(!isNull life_bargate) then {{detach _x} foreach (life_bargate getvariable "bargate"); _handle = [life_bargate,"bargate"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_bargate,"bargate"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_bargate = ObjNull;};},"",999,false,false,"",'!isNull life_bargate']];

	//Packup BarGate
		life_actions = life_actions + [player addAction["BarGate Aufheben",life_fnc_packupbargate,"",0,false,false,"",'
		_bargate = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_bargate" && !isNil {(_bargate getVariable "bargate")}']];

	//Pickup BarGate Briefcases
		life_actions = life_actions + [player addAction["BarGate Aufheben",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "BarGate" && (player distance cursorTarget) < 3 ']];	
	
	//place roadcones
		life_actions = life_actions + [player addAction["Roadcone Platzieren",{if(!isNull life_roadcone) then {{detach _x} foreach (life_roadcone getvariable "roadcone"); _handle = [life_roadcone,"roadcone"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadcone,"roadcone"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadcone = ObjNull;};},"",999,false,false,"",'!isNull life_roadcone']];
		
	//Packup Roadcones
		life_actions = life_actions + [player addAction["Pylonen-Streifen(L) Aufheben",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && (count (_cones getVariable "roadcone") > 1)
		']];
		life_actions = life_actions + [player addAction["Pylone Aufheben",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];
		life_actions = life_actions + [player addAction["Roadcone-Strip Aufheben",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") > 1}
		']];
		life_actions = life_actions + [player addAction["Roadcone Aufheben",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];

	//Pickup roadcone briefcases
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStripB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStrip" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "Roadcone" && (player distance cursorTarget) < 3 ']];
		

	//place roadblock
		life_actions = life_actions + [player addAction["Place Roadblock",{if(!isNull life_roadblock) then {{detach _x;} foreach (life_roadblock getvariable "roadblock"); 
		_handle = [life_roadblock,"roadblock"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadblock,"roadblock"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadblock = ObjNull;};},"",999,false,false,"",'!isNull life_roadblock']];

	//Packup Roadblocks
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wooden)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Fortified)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wreck)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["Land_MetalBarrel_empty_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}']];


	//Pickup roadblock briefcases
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wooden)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockWood" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Fortified)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockConc" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wreck)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockRebel" && (player distance cursorTarget) < 3 ']];
		
	//Spikes
		life_actions = life_actions + [player addAction[localize "STR_ISTR_Spike_Pack",life_fnc_packupSpikes,"",0,false,false,"",'_spikes = nearestObjects[getPos player,["A3L_SpikeStrip"],3] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
		
	//Ausweis
		life_actions = life_actions + [player addAction["<t color='#FF00FF'>Polizeimarke Zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == west && !isNull cursorTarget && player distance cursorTarget < 2.5 && cursorTarget isKindOf "Man" && alive cursortarget ']];
	
	//FBI - Ausweis
		life_actions = life_actions + [player addAction["<t color='#DBA901'>ID Card Zeigen</t>",life_fnc_fbiShowCard,"",1,false,true,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && cursorTarget isKindOf "Man" && alive cursortarget && (player getVariable "isFbi") ']];
	
	//Seize Objects
        life_actions = life_actions + [player addAction["Objekte vom Boden entfernen",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
	};
	
	case independent:
	{
	//place bargate
		life_actions = life_actions + [player addAction["Place BarGate",{if(!isNull life_bargate) then {{detach _x} foreach (life_bargate getvariable "bargate"); _handle = [life_bargate,"bargate"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_bargate,"bargate"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_bargate = ObjNull;};},"",999,false,false,"",'!isNull life_bargate']];

	//Packup BarGate
		life_actions = life_actions + [player addAction["Pack up BarGate",life_fnc_packupbargate,"",0,false,false,"",'
		_bargate = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_bargate" && !isNil {(_bargate getVariable "bargate")}']];

	//Pickup BarGate Briefcases
		life_actions = life_actions + [player addAction["Pickup BarGate",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "BarGate" && (player distance cursorTarget) < 3 ']];	
	
	//place roadcones
		life_actions = life_actions + [player addAction["Place Roadcone",{if(!isNull life_roadcone) then {{detach _x} foreach (life_roadcone getvariable "roadcone"); _handle = [life_roadcone,"roadcone"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadcone,"roadcone"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadcone = ObjNull;};},"",999,false,false,"",'!isNull life_roadcone']];
		
	//Packup Roadcones
		life_actions = life_actions + [player addAction["Pack up Roadcone Strip",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && (count (_cones getVariable "roadcone") > 1)
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone Strip",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") > 1}
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];

	//Pickup roadcone briefcases
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStripB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStrip" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "Roadcone" && (player distance cursorTarget) < 3 ']];
		

	//place roadblock
		life_actions = life_actions + [player addAction["Place Roadblock",{if(!isNull life_roadblock) then {{detach _x;} foreach (life_roadblock getvariable "roadblock"); 
		_handle = [life_roadblock,"roadblock"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadblock,"roadblock"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadblock = ObjNull;};},"",999,false,false,"",'!isNull life_roadblock']];

	//Packup Roadblocks
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wooden)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Fortified)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wreck)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["Land_MetalBarrel_empty_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}']];


	//Pickup roadblock briefcases
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wooden)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockWood" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Fortified)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockConc" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wreck)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockRebel" && (player distance cursorTarget) < 3 ']];

	//Ausweis
		life_actions = life_actions + [player addAction["<t color='#FF00FF'>Dienstausweis zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == independent && !isNull cursorTarget && player distance cursorTarget < 2.5 && cursorTarget isKindOf "Man" && alive cursortarget ']];
		
	//Personentrage AUSPARKEN
		life_actions = life_actions + [player addAction["<t color='#28DD00'>Personentrage Ausladen</t>",life_fnc_liegeToggle,"",1,false,true,"",'!lrl_liegeActive && ((typeOf cursortarget) == "Jonzie_Ambulance") && !isNull cursorTarget && player distance cursortarget < 6 && !(damage cursortarget >= 1)']];
	
	//Personentrage EINPARKEN
		life_actions = life_actions + [player addAction["<t color='#ff0000'>Personentrage Einladen</t>",life_fnc_liegeToggle,"",1,false,true,"",'lrl_liegeActive && ((typeOf cursortarget) == "Jonzie_Ambulance") && !isNull cursorTarget && player distance cursortarget < 6 && !(damage cursortarget >= 1)']];
		
	//Personentrage ENTFERNEN
		life_actions = life_actions + [player addAction["<t color='#FF9000'>Trage Entfernen</t>",{_tgt = cursortarget; if((typeof _tgt) == "A3L_Stretcher_F") then {if(crew _tgt == 0) then {deleteVehicle _tgt;} else {hintSilent "Da ist eine Person auf der Trage."};};},"",1,false,true,"",'((typeOf cursortarget) == "A3L_Stretcher_F") && !isNull cursorTarget && player distance cursortarget < 4']];
	};


	case east:
	{
	//place bargate
		life_actions = life_actions + [player addAction["Place BarGate",{if(!isNull life_bargate) then {{detach _x} foreach (life_bargate getvariable "bargate"); _handle = [life_bargate,"bargate"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_bargate,"bargate"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_bargate = ObjNull;};},"",999,false,false,"",'!isNull life_bargate']];

	//Packup BarGate
		life_actions = life_actions + [player addAction["Pack up BarGate",life_fnc_packupbargate,"",0,false,false,"",'
		_bargate = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_bargate" && !isNil {(_bargate getVariable "bargate")}']];

	//Pickup BarGate Briefcases
		life_actions = life_actions + [player addAction["Pickup BarGate",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "BarGate" && (player distance cursorTarget) < 3 ']];	
	
	//place roadcones
		life_actions = life_actions + [player addAction["Place Roadcone",{if(!isNull life_roadcone) then {{detach _x} foreach (life_roadcone getvariable "roadcone"); _handle = [life_roadcone,"roadcone"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadcone,"roadcone"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadcone = ObjNull;};},"",999,false,false,"",'!isNull life_roadcone']];
		
	//Packup Roadcones
		life_actions = life_actions + [player addAction["Pack up Roadcone Strip",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && (count (_cones getVariable "roadcone") > 1)
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone Strip",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") > 1}
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];

	//Pickup roadcone briefcases
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStripB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStrip" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "Roadcone" && (player distance cursorTarget) < 3 ']];
		

	//place roadblock
		life_actions = life_actions + [player addAction["Place Roadblock",{if(!isNull life_roadblock) then {{detach _x;} foreach (life_roadblock getvariable "roadblock"); 
		_handle = [life_roadblock,"roadblock"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadblock,"roadblock"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadblock = ObjNull;};},"",999,false,false,"",'!isNull life_roadblock']];

	//Packup Roadblocks
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wooden)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Fortified)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wreck)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["Land_MetalBarrel_empty_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}']];


	//Pickup roadblock briefcases
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wooden)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockWood" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Fortified)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockConc" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wreck)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockRebel" && (player distance cursorTarget) < 3 ']];
	
	//Ausweis
		life_actions = life_actions + [player addAction["<t color='#FF00FF'>Dienstausweis zeigen</t>",life_fnc_copShowLicense,"",1,false,true,"",' playerSide == east && !isNull cursorTarget && player distance cursorTarget < 2.5 && cursorTarget isKindOf "Man" && alive cursortarget ']];
	};
};