/*

	Open pack-up dlg

*/

if(!createDialog "marketView") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;

if(player getVariable "ace_captives_isHandcuffed") then {hint "Du kannst die Börse nicht verwenden, während du Handschellen trägst!"; closeDIalog 0;};
if(player getVariable "isblinded") then {hint "Du kannst die Börse nicht verwenden, während du Handschellen trägst!"; closeDIalog 0;};

waitUntil {!isnull (findDisplay 39500)};


//Refresh
[] call life_fnc_refreshMarketView;