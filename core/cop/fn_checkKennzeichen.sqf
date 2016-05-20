/*
	File: fn_checkKennzeichen.sqf
	Author: Bastian "Janl1.DE" Schumacher

	Description:
	Bereitet die Serverseitigen Ablauf der Anfrage vor
*/

_kennzeichen = ctrlText 9557;

if (_kennzeichen == "" OR _kennzeichen == "Kennzeichen eingeben ...") exitWith {closeDialog 0; hint "Bitte geben ein Kennzeichen ein!";};
if (!lrl_copLeitstelle OR !(str(player) in ["cop_4"])) exitWith {closeDialog 0; hint "Nur die Leitstelle kann diese Funktion nutzen!";};
if (count(toArray _kennzeichen) > 7 OR count(toArray _kennzeichen) < 0) exitWith {closeDialog 0; hint "Das Kennzeichen ist zu kurz, bzw. zu lang!";};

closeDialog 0;
hint "Abfrage läuft ...";
[_kennzeichen, player] remoteExec ["UGC_fnc_checkKennzeichenServer",2];
