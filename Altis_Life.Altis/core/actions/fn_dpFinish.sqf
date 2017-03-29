#include "..\..\script_macros.hpp"
/*
    File: fn_dpFinish.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Finishes the DP Mission and calculates the money earned based
    on distance between A->B
*/
params [
    ["_dp", objNull, [objNull]]  
];

life_delivery_in_progress = false;
life_dp_point = nil;
private _dis = round((getPos life_dp_start) distance (getPos _dp));
private _price = round(1.7 * _dis);

["DeliverySucceeded",[format [(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
CASH = CASH + _price;
[0] call SOCK_fnc_updatePartial;