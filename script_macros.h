/*
*	Einige Script Macros, die das Leben einfacher machen.
*	- VariatoX
*/


#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define __GETC__(var) (call var)

//Math
#define __SUB__(var1,var2) var1 = var1 - var2
#define SUMME(var1,var2) var1 = var1 + var2

//Control Macros
#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

//Player based quick macros
#define grpPlayer group player
#define steamid getPlayerUID player

//Variablen
#define GETV getVariable
#define SETV setVariable
