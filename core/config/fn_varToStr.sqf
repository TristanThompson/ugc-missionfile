/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_axt": {(localize "STR_Item_Axt")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt": {(localize "STR_Item_Salt")};
	case "life_inv_saltr": {(localize "STR_Item_SaltR")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_wheat": {(localize "STR_Item_wheat")};
	case "life_inv_sunflower": {(localize "STR_Item_sunflower")};
	case "life_inv_corn": {(localize "STR_Item_corn")};
	case "life_inv_bean": {(localize "STR_Item_bean")};
	case "life_inv_cotton": {(localize "STR_Item_cotton")};
	case "life_inv_olive": {(localize "STR_Item_olive")};
	case "life_inv_opium": {(localize "STR_Item_opium")};
	case "life_inv_cannabis": {(localize "STR_Item_cannabis")};
	case "life_inv_pumpkin": {(localize "STR_Item_Pumpkin")};
	case "life_inv_wheatseeds": {(localize "STR_Item_wheatseeds")};
	case "life_inv_sunflowerseeds": {(localize "STR_Item_sunflowerseeds")};
	case "life_inv_cornseeds": {(localize "STR_Item_cornseeds")};
	case "life_inv_beanseeds": {(localize "STR_Item_beanseeds")};
	case "life_inv_cottonseeds": {(localize "STR_Item_cottonseeds")};
	case "life_inv_oliveseeds": {(localize "STR_Item_oliveseeds")};
	case "life_inv_opiumseeds": {(localize "STR_Item_opiumseeds")};
	case "life_inv_cokeseeds": {(localize "STR_Item_cokeseeds")};
	case "life_inv_cannabisseeds": {(localize "STR_Item_cannabisseeds")};
	case "life_inv_pumpkinseeds": {(localize "STR_Item_Pumpkinseeds")};
	case "life_inv_rawgoatmeat": {(localize "STR_Item_rawgoatmeat")};
	case "life_inv_rawchicken": {(localize "STR_Item_rawchicken")};
	case "life_inv_rawsheepmeat": {(localize "STR_Item_rawsheepmeat")};
	case "life_inv_rawrabbit": {(localize "STR_Item_rawrabbit")};

	case "life_inv_schwarzpulver": {(localize "STR_Item_Schwarzpulver")};
	case "life_inv_kohle": {(localize "STR_Item_Kohle")};
	case "life_inv_elektroteile": {(localize "STR_Item_Elektroteile")};
	case "life_inv_grillkohle": {(localize "STR_Item_Grillkohle")};
	case "life_inv_laminat": {(localize "STR_Item_Laminat")};
	case "life_inv_holz": {(localize "STR_Item_Holz")};

	case "life_inv_zoobeer": {"Zoo Beer"}; 
	case "life_inv_RoadConeStripB": {"Leitkegel (Reihe/Licht)"};
	case "life_inv_RoadConeB": {"Leitkegel (Licht)"};
	case "life_inv_RoadConeStrip": {"Leitkegel (Reihe)"};
	case "life_inv_RoadCone": {"Leitkegel"};
	case "life_inv_RoadBlockWood": {"Strassensperre (Holz)"};
	case "life_inv_RoadBlockConc": {"Strassensperre (befestigt)"};
	case "life_inv_RoadBlockRebel": {"Strassensperre (Wrack)"};
	case "life_inv_cigarette": {"Zigarette"};
	case "life_inv_raxsrum": {"Rax's Rum"};
	case "life_inv_weddingring": {(localize "STR_Item_WeddingRing")};
	case "life_inv_augenbinde": {(localize "STR_Item_augenbinde")};
	
	case "life_inv_stahlschild": {(localize "STR_Item_stahlschild")};
	case "life_inv_panzerglas": {(localize "STR_Item_panzerglas")};
	case "life_inv_junk": {(localize "STR_Item_junk")};
	case "life_inv_tracker": {(localize "STR_Item_tracker")};
	
//Formulare
	case "life_inv_presseformular": {(localize "STR_Item_PresseForm")};
	case "life_inv_taxischeinformular": {(localize "STR_Item_TaxiForm")};
	case "life_inv_permdriverformular": {(localize "STR_Item_PermDrivingForm")};

	case "life_inv_bohrmaschine": {(localize "STR_Item_Bohrmaschine")};
	case "life_inv_nothammer": {(localize "STR_Item_Nothammer")};
	case "life_inv_mehl": {(localize "STR_Item_Mehl")};
	case "life_inv_brotteig": {(localize "STR_Item_Brotteig")};
	case "life_inv_keks": {(localize "STR_Item_Keks")};
	case "life_inv_pizzabrot": {(localize "STR_Item_pizzabrot")};
	case "life_inv_pizza": {(localize "STR_Item_pizza")};
//Cops
	case "life_inv_sos": {(localize "STR_Item_sos")};
	case "life_inv_blaulicht": {(localize "STR_Item_blaulicht")};
	case "life_inv_flugscheinformular": {(localize "STR_Item_FlugForm")};
	

	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_bike": {(localize "STR_License_Bike")};
	case "license_civ_bus": {(localize "STR_License_Bus")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_civ_ilgun": {(localize "STR_License_IllegalFirearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_ausbilder": {(localize "STR_License_Polizeiausbilder")};
	case "license_cop_taktik": {(localize "STR_License_CopTaktik")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_elektriker": {(localize "STR_License_Elektriker")};
	case "license_civ_grillmeister": {(localize "STR_License_Grillmeister")};
	case "license_civ_schreiner": {(localize "STR_License_Schreiner")};
	case "license_civ_presse": {(localize "STR_License_Presse")};
	case "license_civ_taxischein": {(localize "STR_License_TaxiSchein")};
	case "license_civ_fischerei": {(localize "STR_License_Fischerei")};
	case "license_civ_mehlmahl": {(localize "STR_License_Mehlmahl")};
	case "license_civ_permdriver": {(localize "STR_License_permdriver")};
};
