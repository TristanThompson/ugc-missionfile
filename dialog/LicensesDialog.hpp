class LicenseShop {
idd = 5546;
name= "life_license_shop";
movingEnable = false;
enableSimulation = true;
onLoad = "uiNamespace setVariable [""LicenseShop"", _this select 0];";
objects[] = { };

    class controls {

        class RscTitleBackground: Life_RscText
        {
            idc = -1;

            text = "Lizensen"; //--- ToDo: Localize;
            x = 4 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 31 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
			colorBackground[] = {0.18,0.604,0.996,1};
		};
        class Mainbackground: Life_RscText
        {
            idc = -1;

            x = 4 * GUI_GRID_W + GUI_GRID_X;
            y = 6.1 * GUI_GRID_H + GUI_GRID_Y;
            w = 31 * GUI_GRID_W;
            h = 13 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.7};
        };
        class listbox: Life_RscListBox
        {
            idc = 55126;
            sizeEx = 0.035;
            x = 4.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 12.5 * GUI_GRID_W;
            h = 10 * GUI_GRID_H;
        };
        class ShowLicenseslistbox: Life_RscListBox
        {
            idc = 55131;
            sizeEx = 0.035;
            x = 22 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 12.5 * GUI_GRID_W;
            h = 10 * GUI_GRID_H;
        };
        class MyLicenses: Life_RscText
        {
            idc = 55130;

            text = "Zum Kauf"; //--- ToDo: Localize;
            x = 7.5 * GUI_GRID_W + GUI_GRID_X;
            y = 6 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
        class ShowLicenses: Life_RscText
        {
            idc = 55129;

            text = "Lizenzen"; //--- ToDo: Localize;
            x = 26 * GUI_GRID_W + GUI_GRID_X;
            y = 6 * GUI_GRID_H + GUI_GRID_Y;
            w = 5.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
        class buybutton: Life_RscButtonMenu
        {
            idc = 55127;
            action = "if( (lbData[55126,lbCurSel (55126)] != """") ) then { [false, false, false, lbData[55126,lbCurSel (55126)]] call life_fnc_buyLicense; closeDialog 0; };";

            text = "Kaufen"; //--- ToDo: Localize;
            x = 14 * GUI_GRID_W + GUI_GRID_X;
            y = 18 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.8};
        };
        class sellButton: Life_RscButtonMenu
        {
            idc = 55128;
            action = "if( (lbData[55131,lbCurSel (55131)] != """") ) then { [false, false, false, lbData[55131,lbCurSel (55131)]] call life_fnc_sellLicense; closeDialog 0; };";

            text = "Verkaufen"; //--- ToDo: Localize;
            x = 20 * GUI_GRID_W + GUI_GRID_X;
            y = 18 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.8};
        };
    };
};