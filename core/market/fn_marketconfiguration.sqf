/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
		
	["diamondc", 101, 70, 113, 0.016, 0.012, //4
			[
					["brotteig",1],
					["mehl",1],
					["iron_r",1],
					["copper_r",1],
					["cement",1],
					["glass",1],
					["oilp",1],
					["salt_r",1],
					["elektroteile",1],
					["laminat",1],
					["grillkohle",1]
			]
	],
	
	["oilp", 87, 56, 97, 0.028, 0.021, //5
			[
					["brotteig",1],
					["mehl",1],
					["diamondc",1],
					["iron_r",1],
					["copper_r",1],
					["cement",1],
					["glass",1],
					["salt_r",1],
					["elektroteile",1],
					["laminat",1],
					["grillkohle",1]
			]
	],
	
	["iron_r", 70, 49, 78, 0.028, 0.021, //5
			[
					["diamondc",1],
					["copper_r",1],
					["cement",1],
					["glass",1],
					["oilp",1],
					["salt_r",1],
					["elektroteile",1],
					["laminat",1],
					["grillkohle",1]
			]
	],
   
	["elektroteile", 123, 79, 137, 0.016, 0.012, //4
			[
					["iron_r",1],
					["copper_r",1],
					["cement",1],
					["glass",1],
					["oilp",1],
					["salt_r",1],
					["diamondc",1],
					["laminat",1],
					["grillkohle",1]
			]
	],
	
	["cement", 101, 70, 113, 0.024, 0.018, //6
			[
					["diamondc",1],
					["iron_r",1],
					["copper_r",1],
					["glass",1],
					["oilp",1],
					["salt_r",1],
					["elektroteile",1],
					["laminat",1],
					["grillkohle",1]
			]
	],
	
	["copper_r", 58, 40, 65, 0.016, 0.012, //4
			[
					["brotteig",1],
					["mehl",1],
					["diamondc",1],
					["iron_r",1],
					["cement",1],
					["glass",1],
					["oilp",1],
					["salt_r",1],
					["elektroteile",1],
					["laminat",1],
					["grillkohle",1]
			]
	],
	
	["laminat", 63, 44, 70, 0.016, 0.012, //4
			[
					["iron_r",1],
					["copper_r",1],
					["cement",1],
					["glass",1],
					["oilp",1],
					["salt_r",1],
					["elektroteile",1],
					["grillkohle",1],
					["diamondc",1]
			]
	],
	
	["grillkohle", 64, 41, 71, 0.017, 0.009, //3
			[
					["iron_r",1],
					["copper_r",1],
					["cement",1],
					["glass",1],
					["oilp",1],
					["salt_r",1],
					["elektroteile",1],
					["laminat",1],
					["diamondc",1]
			]
	],
	
	["glass", 57, 39, 63, 0.017, 0.009, //3
			[
					["diamondc",1],
					["iron_r",1],
					["copper_r",1],
					["cement",1],
					["oilp",1],
					["salt_r",1],
					["elektroteile",1],
					["laminat",1],
					["grillkohle",1]
			]
	],
   
	["salt_r", 50, 35, 56, 0.017, 0.009, //3
			[
					["brotteig",1],
					["mehl",1],
					["diamondc",1],
					["iron_r",1],
					["copper_r",1],
					["cement",1],
					["glass",1],
					["oilp",1],
					["elektroteile",1],
					["laminat",1],
					["grillkohle",1]
			]
	],
   
	["sunflower", 14, 10, 15, 0.008, 0.006, //2
			[
					["brotteig",1],
					["mehl",1],
					["wheat",1],
					["bean",1],
					["cotton",1],
					["pumpkin",1],
					["olive",1]
			]
	],
   
	["pumpkin", 15, 11, 16, 0.008, 0.006, //2
			[
					["wheat",1],
					["sunflower",1],
					["bean",1],
					["cotton",1],
					["olive",1]
			]
	],
   
	["wheat", 17, 12, 19, 0.008, 0.006, //2
			[
					["sunflower",1],
					["bean",1],
					["cotton",1],
					["pumpkin",1],
					["olive",1]
			]
	],
   
	["cotton", 15, 11, 16, 0.008, 0.006, //2
			[
					["wheat",1],
					["sunflower",1],
					["bean",1],
					["pumpkin",1],
					["olive",1]
			]
	],
	
	["mehl", 22, 16, 24, 0.008, 0.006, //2
			[
					["sunflower",1],
					["bean",1],
					["pumpkin",1],
					["olive",1]
			]
	],
	
	["brotteig", 97, 73, 108, 0.008, 0.006, //2
			[
					["sunflower",1],
					["bean",1],
					["pumpkin",1],
					["olive",1]
			]
	],
	
/////////////////////////
/*
        I L L E G A L E
        S T O F F E
*/
/////////////////////////

	["cocainep", 110, 77, 123, 0.017, 0.009, //3
			[
					["marijuana",1],
					["heroinp",1],
					["schwarzpulver",1]
			]
	],
	
	["heroinp", 94, 65, 105, 0.017, 0.009, //3
			[
					["marijuana",1],
					["cocainep",1],
					["schwarzpulver",1]
			]
	],
	
	["schwarzpulver", 75, 48, 84, 0.017, 0.009, //3
			[
					["marijuana",1],
					["cocainep",1],
					["heroinp",1]
			]
	],
   
	["marijuana", 141, 98, 157, 0.017, 0.009, //3
			[
					["cocainep",1],
					["heroinp",1],
					["schwarzpulver",1]
			]
	]
   
];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
//};