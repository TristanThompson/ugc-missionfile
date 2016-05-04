#define BGX -0.65
#define BGY 0.2
#define BGW 0.3

class Life_farming_menu
{
	idd = 40100;
	movingEnabled = false;
	enableSimulation = true;
   
	class controlsBackground
	{
		class background: life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = BGX;
			y = BGY + (11 / 250);
			w = BGW;
			h = 0.3 - (22 / 250);
		};
		
		class background_top: Life_RscText
		{
			colorBackground[] = {0.18,0.604,0.996,1};
			idc = -1;
			x = BGX;
			y = BGY;
			w = BGW;
			h = (1 / 25);
		};
		
		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 47400;
			text = "$STR_FarmMenu_Title";
			x = BGX;
			y = BGY;
			w = BGW;
			h = (1 / 25);
		};
	};

	class controls
	{
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = BGX;
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class button_pickaxe: life_RscButtonMenu
		{
			idc = 40111;
			colorBackground[] = {0.18,0.604,0.996,1};
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.07;
			w = 0.24;
			h = 0.038;
		};

		class button_axe: life_RscButtonMenu
		{
			idc = 40112;
			colorBackground[] = {0.18,0.604,0.996,1};
			text = "";
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.12;
			w = 0.24;
			h = 0.038;
		};
	};
};