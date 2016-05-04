/*
	File: fn_intoxTestReturn.sqf
	@Deo	
	Description:
	Returns the Intox Results.
*/
private["_civ","_intox"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_intox = [_this,1,0,[0]] call BIS_fnc_param;
if(isnull _civ) exitWith {};

if(_intox > 0.08) then 
{
	hint parseText format["<t size='1.75' color='#ff0000'>Drogen- / Alkoholtest</t><br/><br/><t size='1.3'>Getestet:</t><br/> %1<br/><br/><t size='1.3'>Intox-Level:</t><br/>%2<br/><t color='#ff0000'>Nicht Verkehrssicher!</t>",name _civ,_intox];
} else {
	hint parseText format["<t size='1.75' color='#ff0000'>Drogen- / Alkoholtest</t><br/><br/><t size='1.3'>Getestet:</t><br/> %1<br/><br/><t size='1.3'>Intox-Level:</t><br/>%2<br/>Verkehrssicher!",name _civ,_intox];
};

sleep 12;

if(side _civ == civilian) then {
	if (_intox > 0.20) then 
	{
		[4,format["<t size='1.65' color='#00CD00'>LVPD-Fahndungsliste</t><br/><br/><t size='1.1' align='center'>=<br/>Eine Person wurde zur<br/>Fahndung augeschrieben<br/>=</t><br/><br/><br/><t size='0.95' align='left' color='#79CdCd'>Verbrecher:</t><t size='1.05' align='right'><br/>%1</t><br/><br/><t size='0.95' align='left' color='#79CDCD'>Ausgeschrieben Von:</t><t size='1.05' align='right'><br/>INTOX_TEST_DEVICE</t>",name _civ]] remoteExec ["life_fnc_broadcast",west];
		[getPlayerUID _civ,name _civ,"647"] remoteExec ["life_fnc_wantedAdd",2];
	};
};