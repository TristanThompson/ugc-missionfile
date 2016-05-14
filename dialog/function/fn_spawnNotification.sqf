/*

	File: fn_dynamixErrorMsg.sqf
	Author: Marcel "Variatox" Koch
	Server: lakeside-reallife.de

	Description:
	Dynamische Nachricht für den Spieler wo er aufgewacht ist.
*/

//Fix 4 TFAR Black Screen
titleText ["Ts3 Channel Checked. Willkommen!","BLACK IN"];

params[["_sp","",[""]]];

if(_sp == "" ) exitWith {};

private _LSCity = "Lakeside City";
private _LSCGericht = "Lakeside Gericht";
private _MTown = "Morrison Town";
private _LDiablos = "Los Diablos";
private _SCristobal = "San Cristobal";
private _AField = "Flughafen";
private _RAField = "Rebellen SW";
private _RPost = "Rebellen W";
private _RBHof = "Rebellen Bauernhof";
private _JVA = "Justizvollzugsanstalt";
private _FBHQ = "Fort Baxter HQ";
private _HWHQ = "Highway Police Dept.";
private _ZKH = "Zentralklinikum";

switch (_sp) do {

	case _LSCity: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen in ","align = 'center' size = '0.6'"],["","<br/>"],["      Lakeside City","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _LSCGericht: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen beim ","align = 'center' size = '0.6'"],["","<br/>"],["      Lakeside Gericht","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _MTown: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen in ","align = 'center' size = '0.6'"],["","<br/>"],["      Morrison Town","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _LDiablos: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen in ","align = 'center' size = '0.6'"],["","<br/>"],["      Los Diablos","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _SCristobal: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen in ","align = 'center' size = '0.6'"],["","<br/>"],["      San Cristobal","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _AField: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen beim ","align = 'center' size = '0.6'"],["","<br/>"],["      Flughafen","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _RAField: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen beim ","align = 'center' size = '0.6'"],["","<br/>"],["      Rebellen Posten SUD-WEST","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _RPost: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen beim ","align = 'center' size = '0.6'"],["","<br/>"],["      Rebellen Posten WEST","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _RBHof: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen beim ","align = 'center' size = '0.6'"],["","<br/>"],["      Rebellen Bauernhof","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _JVA: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen zur ","align = 'center' size = '0.6'"],["","<br/>"],["      Justizvollzugsanstalt","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _FBHQ: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen im ","align = 'center' size = '0.6'"],["","<br/>"],["      Fort Baxter HQ","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _HWHQ: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen im ","align = 'center' size = '0.6'"],["","<br/>"],["      Highway Dept.","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	case _ZKH: {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen beim ","align = 'center' size = '0.6'"],["","<br/>"],["     Zentralklinikum","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};
	default {[[["","<br/><br/><br/><br/><br/><br/><br/>"],["Willkommen in ","align = 'center' size = '0.6'"],["","<br/>"],["      Lakeside Valley","align = 'center' size = '0.7' font='PuristaBold'"]]] spawn BIS_fnc_typeText2;};

};
