// TFR Variables API
tf_no_auto_long_range_radio = true; 
tf_west_radio_code = "_alliance";
tf_east_radio_code = "_opfor";
tf_guer_radio_code = "_alliance";
tf_civ_radio_code = "_opfor";

// Server SetVariables
if (isServer) then {
	bank setvariable ["robbed",false,true];
	/*stash1 setvariable ["robbed",false,true];
	stash2 setvariable ["robbed",false,true];
	stash3 setvariable ["robbed",false,true];
	stash4 setvariable ["robbed",false,true];*/
};


// Different depending on server
tf_radio_channel_name = "TaskForceRadio";

enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "LS-Reallife v4.1.8.0";

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "extra\weather.sqf";

//#2 Anfang
if(isDedicated && isNil("life_market_prices")) then
{
	[] call life_fnc_marketconfiguration;
	diag_log "Market prices generated!";
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices updated! %1", _this select 1];
	};
};
//#2 Ende

//Cops
WEST setFriend [INDEPENDENT,1];
WEST setFriend [EAST,1];
WEST setFriend [CIVILIAN,1];
//LAC
EAST setFriend [WEST,1];
EAST setFriend [INDEPENDENT,1];
EAST setFriend [CIVILIAN,1];
//Medic
INDEPENDENT setFriend [EAST,1];
INDEPENDENT setFriend [WEST,1];
INDEPENDENT setFriend [CIVILIAN,1];
//Civ
CIVILIAN setFriend [WEST,1];
CIVILIAN setFriend [INDEPENDENT,1];
CIVILIAN setFriend [EAST,1];

KF_CHICKEN = 
[
	(str missionConfigFile), 0, -15
] call BIS_fnc_trimString;

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};