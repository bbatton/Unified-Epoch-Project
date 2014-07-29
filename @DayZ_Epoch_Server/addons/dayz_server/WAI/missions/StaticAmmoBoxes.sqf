/* Add ammmo boxes to static locations on map and fills it with loot from missionCfg.sqf

creates a ammo box at [0,0,0] then fills it

_box = createVehicle ["BAF_VehicleBox",[0,0,0], [], 0, "CAN_COLLIDE"];
[_box] call spawn_ammo_box;

creates a 2nd ammo box at [1,1,1] then fills it

_box2 = createVehicle ["BAF_VehicleBox",[1,1,1], [], 0, "CAN_COLLIDE"];
[_box2] call spawn_ammo_box;

add custom ammo boxes below this line
*/
private ["_box","_numberofguns","_weapon","_possibleWeaponsList"];
_box = _this select 0;

_box = createVehicle ["BAF_VehicleBox",[7989.06,13648.8,0.001], [], 0, "CAN_COLLIDE"];
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];


clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

_numberofguns =  1;

_possibleWeaponsList = [
"BAF_AS50_TWS",
"SMAW",
"BAF_LRR_scoped",
"FN_FAL_ANPVS4",
"M107",
"KSVK",
"BAF_L110A1_Aim"
];

_weapon = _possibleWeaponsList call BIS_fnc_selectRandom;
_mags = getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");
_box addWeaponCargoGlobal [_weapon,1];
_box addMagazineCargoGlobal [(_mags select 0),round(random 2) + 2];
