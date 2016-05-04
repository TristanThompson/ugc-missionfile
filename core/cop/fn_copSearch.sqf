#include <macro.h>
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/
life_action_inUse = false;
private["_civ","_invs","_license","_guns","_gun"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_money = _this select 2;
if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
		_index = [_x select 0,__GETC__(sell_array)] call TON_fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((__GETC__(sell_array) select _index) select 1));
		};
	} foreach _invs;

	
	[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"] remoteExec ["life_fnc_wantedAdd",2];
	[0,format[localize "STR_Cop_Contraband",(_civ getVariable["realname",name _civ]),[_illegal] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",west];
	c00l3_b4Nck3h13R = c00l3_b4Nck3h13R + _illegal;
}
	else
{
	_inv = localize "STR_Cop_NoIllegal";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format[localize "STR_Cop_CouldntSearch",_civ getVariable["realname",name _civ]]};

hint parseText format["<t color='#FF0000'><t size='1.6'>Durchsuchung</t></t><br/><br/><br/><t size='1.3' align='left' color='#00A2FF'>Name:</t><br/><t align='right' size='0.95'>%1<br/><br/><t size='1.3' align='left' color='#00CD00'>Bargeld (in $):</t><br/><t size='1.1' align='right'>%3</t><br/><br/><br/><t color='#FFD700'><t size='1.5' align='left'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t></t><br/>%2<br/><br/>"
,(_civ getVariable["realname",name _civ]),_inv,[_money] call life_fnc_numberText];

