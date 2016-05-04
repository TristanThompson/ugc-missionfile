// command to open HUD:  "cutRsc ["a3lhud", "PLAIN"];"
 
while {true} do {
sleep 1;
//_playerhealth = getdammage player;
_playerstamina = getfatigue player;
_playerhunger = life_hunger;
_playerthirst = life_thirst;

 
 
_healthcolor = "#00FF4C";
_hungercolor = "#00FF4C";
_thirstcolor = "#00FF4C";
_staminacolor = "#00FF4C";
_magcolor = "#FFFFFF";
_ammocolor = "#FFFFFF";
_hungertext = parseText format[""];
_thirsttext = parseText format[""];
_healthtext = parseText format[""];
_zeroingtext = parseText format[""];
_staminatext = parseText format[""];
_ammotext = parseText format[""];
_amountmagtext = parseText format[""];
_weaponname = parseText format[""];
_hudinfo = weaponState player; // ["weapon_class_name","weapon_class_name","feuer_modus","magazin_name",verbleibende_schusse]
_curweapon = _hudinfo select 0;
_curmagazine = _hudinfo select 4;
_className = _hudinfo select 3;
_gunmodeold = _hudinfo select 2;
_gunmode = "";
if (_gunmodeold in ["single","FullAuto","Burst","securite","Single"]) then {
	_gunmode = _gunmodeold;
	if(_gunmodeold == "single") then {_gunmode = "Manuell"}; //Gibt es 2x...
	if(_gunmodeold == "Single") then {_gunmode = "Manuell"};
	if(_gunmodeold == "FullAuto") then {_gunmode = "Automatisch"};
	if(_gunmodeold == "Burst") then {_gunmode = "Feuerstoss"};
	if(_gunmodeold == "securite") then {_gunmode = "Gesichert"};
};
 
_magforpic = "";
if (!(_curweapon in lrl_noWeapons)) then {
	_magforpic = (getArray (configFile >> "CfgWeapons" >> _curweapon >> "magazines")) select 0;
};
_picture = "";
_picture = getText (configFile >> "CfgMagazines" >> _magforpic >> "picture");
_nameofPlayer = name player;
_noweaponsarray = ["","","","",0];
_nothing = _noweaponsarray select 0;
if (_nothing == _curweapon) then {} 
else
{
 
_zeroing = currentZeroing player;
 
_magazineClass = currentMagazine player;
_weaponname = getText (configFile >> "CfgWeapons" >> _curweapon >> "displayName");
_maxammo = getNumber(configFile >> "CfgMagazines" >> _magazineClass >> "count") ;
_prcentammo = 0;
if (_curmagazine == 0) then {
_prcentammo = 0;
} else {
_prcentammo = (_curmagazine / _maxammo) * 100;
};
 
_amountmag = {_x == (currentmagazine player)} count magazines player;
if (_amountmag == 0) then {
        _amountmagtext = parseText format["Ich habe keine Magazine mehr"];
                _magcolor = "#FFFFFF";
    } else {
    if (_amountmag == 1) then {
        _amountmagtext = parseText format["Ich habe noch %1 Magazin übrig.", _amountmag];
                _magcolor = "#FFFFFF";
    } else {
    if (_amountmag > 1) then {
        _amountmagtext = parseText format["Ich habe noch %1 Magazine übrig.", _amountmag];
                _magcolor = "#FFFFFF";
};};};
       
if (_prcentammo == 0) then {
        _ammotext = parseText format["Ich denke ich habe keine Munition mehr"];
                _ammocolor = "#FFFFFF";
    } else {
    if (_prcentammo < 20) then {
        _ammotext = parseText format["Ich habe fast keine Munition mehr"];
                _ammocolor = "#FFFFFF";
    } else {
    if (_prcentammo < 40) then {
        _ammotext = parseText format["Ich müsste die Munitionsmenge checken"];
                _ammocolor = "#FFFFFF";
    } else {
    if (_prcentammo < 60) then {
        _ammotext = parseText format["Das Magazin ist halb voll"];
                _ammocolor = "#FFFFFF";
    } else {
    if (_prcentammo < 80) then {
        _ammotext = parseText format["Ich habe genug Munition"];
                _ammocolor = "#FFFFFF";
    } else {
    if (_prcentammo < 100) then {
        _ammotext = parseText format["Ich habe reichlich Schuss"];
                _ammocolor = "#FFFFFF";
    } else {
    if (_prcentammo == 100) then {
        _ammotext = parseText format["Das Magazin ist voll"];
                _ammocolor = "#FFFFFF";
};};};};};};};
 
if (_zeroing == 0) then {
                _zeroingtext = parseText format[""];
        } else {
                _zeroingtext = parseText format["Nullpunkt: %1M", _zeroing];
};
 
 
};  
 
if (_playerhunger > 90) then {
                _hungercolor = "#00FF4C";
                _hungertext = parseText format["Keinen Hunger"];
        } else {
        if (_playerhunger > 80) then {
                _hungercolor = "#1AFF00";
                _hungertext = parseText format["Überhaupt keinen Hunger"];
        } else {
        if (_playerhunger > 70) then {
                _hungercolor = "#7BFF00";
                _hungertext = parseText format["Ein Keks wäre gut"];
        } else {
        if (_playerhunger > 60) then {
                _hungercolor = "#BFFF00";
                _hungertext = parseText format["Ein paar Kekse wären gut"];
        } else {
        if (_playerhunger > 50) then {
                _hungercolor = "#EAFF00";
                _hungertext = parseText format["Habe Hunger"];
        } else {
        if (_playerhunger > 40) then {
                _hungercolor = "#FFBF00";
                _hungertext = parseText format["Mein Magen knurrt"];
        } else {
        if (_playerhunger > 30) then {
                _hungercolor = "#FF8400";
                _hungertext = parseText format["Muss dringend etwas Essen"];
        } else {
        if (_playerhunger > 20) then {
                _hungercolor = "#FF4000";
                _hungertext = parseText format["Habe starkes Sodbrennen"];
        } else {
        if (_playerhunger >= 1 && _playerhunger <= 20) then {
                _hungercolor = "#FF0000";
                _hungertext = parseText format["Der Hunger tötet mich noch"];
        } else {
        if (_playerhunger == 0) then {
                _hungercolor = "#590000";
                _hungertext = parseText format["TOT</t>"];
		};
};};};};};};};};};
 
if (_playerthirst > 80) then {
                _thirstcolor = "#1AFF00";
                _thirsttext = parseText format["Nicht durstig"];
        } else {
        if (_playerthirst > 70) then {
                _thirstcolor = "#7BFF00";
                _thirsttext = parseText format["Ein Schluck Wasser wäre gut"];
        } else {
        if (_playerthirst > 60) then {
                _thirstcolor = "#BFFF00";
                _thirsttext = parseText format["Ein Glas Wasser wäre gut"];
        } else {
        if (_playerthirst > 50) then {
                _thirstcolor = "#EAFF00";
                _thirsttext = parseText format["Mund fühlt sich trocken an"];
        } else {
        if (_playerthirst > 40) then {
                _thirstcolor = "#FFBF00";
                _thirsttext = parseText format["Kehle ist trocken"];
        } else {
        if (_playerthirst > 30) then {
                _thirstcolor = "#FF8400";
                _thirsttext = parseText format["Sollte jetzt etwas trinken"];
        } else {
        if (_playerthirst > 20) then {
                _thirstcolor = "#FF4000";
                _thirsttext = parseText format["Mir ist schwindelig"];
        } else {
        if (_playerthirst >= 1 && _playerthirst <= 20) then {
                _thirstcolor = "#FF0000";
                _thirsttext = parseText format["Mir geht es kotzübel"];
        } else {
        if (_playerthirst == 0) then {
                _thirstcolor = "#590000";
                _thirsttext = parseText format["TOT</t>"];
};};};};};};};};};
 
if (_playerstamina < 0.10) then {
                _staminacolor = "#00FF4C";
                _staminatext = parseText format["Total Erholt"];
        } else {
        if (_playerstamina < 0.20) then {
                _staminacolor = "#1AFF00";
                _staminatext = parseText format["Kann ewig Laufen"];
        } else {
        if (_playerstamina < 0.30) then {
                _staminacolor = "#BFFF00";
                _staminatext = parseText format["Brauche eine Verschnaufpause"];
        } else {
        if (_playerstamina < 0.45) then {
                _staminacolor = "#EAFF00";
                _staminatext = parseText format["Beginne zu schwitzen"];
        } else {
        if (_playerstamina < 0.65) then {
                _staminacolor = "#FF8400";
                _staminatext = parseText format["Das ist so anstrengend"];
        } else {
        if (_playerstamina < 0.80) then {
                _staminacolor = "#FF4000";
                _staminatext = parseText format["Mir geht echt die Puste aus"];
        } else {
        if (_playerstamina >= 0.8) then {
                _staminacolor = "#590000";
                _staminatext = parseText format["Ich bekomme kaum noch Luft..."];
};};};};};};};
 
 
_playerstatustext = parseText format ["<t font='EtelkaNarrowMediumPro' size='1' align='right'><t color='%1'>%2</t> | <t color='%3'>%4</t> | <t color='%5'>%6</t> | <t color='%7'>%8</t></t>", _healthcolor, _healthtext, _staminacolor, _staminatext, _hungercolor, _hungertext, _thirstcolor, _thirsttext];
_playernametext = parseText format ["<t font='EtelkaNarrowMediumPro' color='#FFFFFF' size='1.3' align='right'>%1</t>", _nameofplayer];
// _zeroinghudtext = parseText format ["<t font='EtelkaNarrowMediumPro' color='#949494' size='1' align='left'>%1</t>", _zeroingtext];
_ammohudtext = parseText format ["<t font='EtelkaNarrowMediumPro' color='%1' size='0.9' align='left'>%2</t>",_ammocolor, _ammotext];
_maghudtext = parseText format ["<t font='EtelkaNarrowMediumPro' color='%1' size='1' align='left'>%2</t>", _magcolor, _amountmagtext];
_gunmodetext = parseText format ["<t font='EtelkaNarrowMediumPro' color='#FFFFFF' size='1' align='center'>%1</t>", _gunmode];
 
_weapontexthud = parseText format ["<t font='EtelkaNarrowMediumPro' color='#FFFFFF' size='1' align='left'>%1</t>", _weaponname];
((uiNamespace getVariable "a3lhud") displayCtrl 41652) ctrlSetStructuredText _playerstatustext;
((uiNamespace getVariable "a3lhud") displayCtrl 16418) ctrlSetText _picture;
((uiNamespace getVariable "a3lhud") displayCtrl 62362) ctrlSetStructuredText _playernametext;
// ((uiNamespace getVariable "a3lhud") displayCtrl 16423) ctrlSetStructuredText _zeroinghudtext;
((uiNamespace getVariable "a3lhud") displayCtrl 16422) ctrlSetStructuredText _ammohudtext;
((uiNamespace getVariable "a3lhud") displayCtrl 16419) ctrlSetStructuredText _gunmodetext;
((uiNamespace getVariable "a3lhud") displayCtrl 16421) ctrlSetStructuredText _maghudtext;
((uiNamespace getVariable "a3lhud") displayCtrl 16420) ctrlSetStructuredText _weapontexthud;
 
};