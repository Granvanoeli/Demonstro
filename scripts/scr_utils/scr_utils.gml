// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print(message){
	show_debug_message(message);
}

function searchArray (array, val_to_check){
	for(var i=0; i<array_length(array); i++){
		if (array[i] == val_to_check){
			return true;
		}
		else return false;
	}
}