class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

/*class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
		class variableCheck{};
		class initSpy {preInit=0;};
	};
};*/

class LRL_AC {
	tag = "LRLAC";
	class a3ldelrlac {
		file = "lrl_ac";
		class busted {};
	}

};

class Life_Client_Core
{
	tag = "life";

	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class initZeus {};
		class initAdac {};
	};

	class CopPlaceables
	{
		file = "core\cop\placeables";
		class placeablesInit {};
		class placeablesMenu {};
		class placeablesRemoveAll {};
		class placeablePlace {};
		class placeableCancel {};
		class placeablesPlaceComplete {};
	};

	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDebugCon {};
		class adminCompensate {};
		class adminGodMode {};
		class adminFreeze {};
		class adminMarkers {};
		class adminHeal {};
		class adminJail {};
		class adminToggle {};
	};

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		//class revivePlayer {};
		//class revived {};
		//class medicMarkers {};
		class medicMapMarker {};
		//class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		//class medMarkers {};
		class medicInteractionMenu {};
	};

	class Actions
	{
		file = "core\actions";
		class packupRoadcones {};
		class packupRoadblock {};
		class packupBarGate {};
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class repairAdac {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class copLicenseShown {};
		class copShowLicense {};
		class surrender {};
		class TorturePlayer {};
		class handyEntnehmen {};
		class handyEntnommen {};
		class robShops {};
		class robShops2 {};
		class sellLicense {};
		class rechnungAction {};
		class augenbindeAn {};
		class augenbindeAus {};
		class augenbindeAction {};
		class hammer {};
		class robBank {};
		class robBank2 {};
		class robBankLS {};
		class robBankLS2 {};
		class robBankMT {};
		class robBankMT2 {};
		class craftAction {};
		class earplugs {};
		class fbiShowCard {};
		class liegeToggle {};
	};

	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};

	class Drugs
	{
		file = "core\drugs";
		class useMarijuana {};
		class useHeroin {};
		class useCigarette {};
	}

	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class craftCfg {};

		//Clothing Store Configs
		class clothing_cop {};
		class clothing_ems {};
		class clothing_bruce {};
		class clothing_fbi {};
		class clothing_ausbilder {};
		class clothing_taktik {};
		class clothing_state {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_adac {};
		class clothing_justiz {};
		class clothing_anzug {};

		//#1
		//class itemIcon {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class wantedCheck {};
		class wantedCheckFeedback {};
		class wantedCheckPredefinition {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class Farmmenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		//class settingsMenu {};
		class settingsInit {};
		class wantedAddP {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class revokeLicense {};
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
	};

	class Functions
	{
		file = "core\functions";
		class A3L_bankrobbery {};
		class A3L_PlantCharge {};
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class dropItemsFloor {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		//class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class enablecollisionwith {};
		class disablecollisionwith {};
		class random {};
		class randomRound {};
		class globalSound {};
		class globalSoundClient {};
		class openHandyMenu {};
		class commandSpam {};
		class vibration {};
		class smsSound {};
		class readyForJail {};
		class roundMoney {};
		class statsNormalizer {};
		class copCounter {};
		class monitorColorizeEffect {};
		class gpsMarker {};
		class runIntro {};
	};

	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
		class setHitGlobal {};
	};

	class Civilian
	{
		file = "core\civilian";
		class getPlate {};
		class checkVehicleVIP {};
		class removeWeapons {};
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class zoneCreator {};
		class demoChargeTimer {};
		class civLoadout {};
		class pInteraction_reb {};
		class umbrellus {};
		class umbrellus2 {};
		class gummit {};
	};

	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
		class adacInteractionMenu {};
	};

	class Cop
	{
		file = "core\cop";
		class checkKennzeichen {};
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class testIntox {};
		class testIntoxClient {};
		class intoxTestReturn {};
		class fastRope {};
		class removeWeaponAction {};
		class removeWeapons {};
		class seizeObjects {};
		class wantedGrab {};
		class EinsatzLicht {};
		class ULights {};
		class copCards {};
		class openGate {};
		class copYelp {};
		class copSirenAlter {};
		class copSirenVehPlease {};
		class copSirenVehNormal {};
		class copSirenVehAggro {};
	};

	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
	};

	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class licenses {};
		class slotmachine {};
		class slotSpin {};
		class blackjack {};
		class BJbet {};
		class BJhit {};
		class BJstay {};
	};

	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class axtUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class jerryRefuelLAC {};
		class flashbang {};
		class boltcutter {};
		class bohrmaschine {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class RoadBlockWood {};
		class RoadBlockConc {};
		class RoadBlockRebel {};
		class RoadCone {};
		class RoadConeStrip {};
		class RoadConeB {};
		class RoadConeStripB {};
		class scheibeEinschlagen {};
		class SOS {};
		class gpsTracker {};
	};

	class Dialog_Controls
	{
		file = "dialog\function";
		class callBackPlayer {};
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnNotification {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class bankLsrlCoinsCheck {};
		class bankLsrlCoinsGive {};
	};

	class extra
	{
		file = "extra";
		class cleanStation {};
		//class tankchanger {};
		class useStation {};
	};

	//#2
	class Market
	{
		file = "core\market";

		class openMarketView;
		class refreshMarketView;
		class marketShortView;
		class marketBuy;
		class marketSell;
		class marketGetBuyPrice;
		class marketGetSellPrice;
		class marketconfiguration;
		class marketReset;
		class marketChange;
		class marketGetRow;
		class marketGetPriceRow;
		class marketSetPriceRow;
    };
	class Adac
	{
		file = "core\adac";
		class adacLoadout {};
		class rechnungGive {};
		class rechnungPay {};
		class rechnungPrompt {};
		class adacpInteractionMenu {};
		class adacMarkers {};
		class deleteADAC {};
		class requestADAC {};
		class requestNotADAC {};
		class adacRequest {};
		class adacNotRequest {};
		class rechnungPaid {};
		class adacLights {};
		class adacSirenLights {};
		class adacSiren {};
		class adacMarker {};
	};
};
