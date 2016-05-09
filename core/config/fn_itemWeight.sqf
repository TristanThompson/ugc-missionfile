/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {5};
	case "oilp": {3};
	case "heroinu": {6};
	case "heroinp": {2};
	case "marijuana": {2};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {3};
	case "tuna": {2};
	case "mullet": {4};
	case "catshark": {4};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "axt": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {2};
	case "glass": {2};
	case "diamond": {4};
	case "diamondc": {2};
	case "cocaine": {3};
	case "cocainep": {2};
	case "spikeStrip": {18};
	case "rock": {6};
	case "cement": {4};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {12};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "wheat": {2};
	case "sunflower": {2};
	case "corn": {2};
	case "bean": {2};
	case "cotton": {2};
	case "olive": {1};
	case "opium": {3};
	case "cannabis": {3};
	case "pumpkin": {2};
	case "wheat seed": {0.5};
	case "sunflower seed": {0.5};
	case "corn seed": {0.5};
	case "bean seed": {0.5};
	case "cotton seed": {0.5};
	case "olive seed": {0.5};
	case "opium seed": {0.5};
	case "coke seed": {0.5};
	case "cannabis seed": {0.5};
	case "pumpkin seed": {0.5};
	case "raw goat meat": {2};
	case "raw chicken": {2};
	case "raw sheep meat": {2};
	case "raw rabbit": {2};
	case "cigarette": {0.5};
	case "RoadConeStripB": {2};
	case "RoadConeB": {2};
	case "RoadConeStrip": {2};
	case "RoadCone": {2};
	case "RoadBlockWood": {2};
	case "RoadBlockConc": {4};
	case "RoadBlockRebel": {10};
	case "Rax's Rum" : {1};
	case "zoobeer": {1}; // Duff Beer
	case "blaulicht":{2};
	case "schwarzpulver":{2};
	case "kohle":{3};
	case "elektroteile":{1};
	case "laminat":{2};
	case "holz":{4};
	case "grillkohle":{1};
	case "presseformular":{0.5};
	case "taxischeinformular":{0.5};
	case "flugscheinformular":{0.5};
	case "taktikformular":{0.5};
	case "permdriverformular":{0.5};
	case "fbiformular":{0.5};
	case "swatformular":{0.5};
	case "bohrmaschine":{5};
	case "nothammer":{3};
	case "mehl":{2};
	case "brotteig":{4};
	case "keks":{1};
	case "pizzabrot":{2};
	case "pizza":{3};
	case "sos":{1};
	case "augenbinde":{1};
	case "tracker":{3};
	
	case "panzerglas": {4};
	case "stahlschild": {10};
	case "junk": {4};
	
	default {1};
};
