///////////////////////////////////////////////////////////////////////////
/// Base Classes Wrapped to Altis Life
///////////////////////////////////////////////////////////////////////////
class RscShortcutButtonMain : Life_RscShortcutButtonMain
{
	
};
class RscSlider : Life_RscSlider
{
	
};
class RscCheckBox : Life_RscCheckBox
{
	
};

class RscButtonMenu : Life_RscButtonMenu
{
	
};
class RscButtonMenuOK : Life_RscButtonMenu
{
	idc = 1;
	shortcuts[] = 
	{
		"0x00050000 + 0",
		28,
		57,
		156
	};
	default = 1;
	text = "OK";
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
		0.09,
		1
	};
};
class RscButtonMenuCancel : Life_RscButtonMenu
{
	idc = 2;
	shortcuts[] = 
	{
		"0x00050000 + 1"
	};
	text = "Fermer";
};
class RscControlsGroup : Life_RscControlsGroup
{
	
};
