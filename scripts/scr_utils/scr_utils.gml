// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function print(message);
/// @param {message} the message to print
function print(message){
	show_debug_message(message);
}

/// @function searchArray(array, val_to_search);
/// @param {array}			the array to look through
/// @param {val_to_search}	the value to find in the array
function searchArray (array, val_to_search){
	for(var i=0; i<array_length(array); i++){
		if (array[i] == val_to_search){
			return true;
		}
		else return false;
	}
}

function check_orbit(tokensArray){
	
	// for each token in the tokensArray of this node
	for(var i=0; i<array_length(tokensArray); i++){
		//Check if any of the people has a corresponding one
		var token = tokensArray[i];
		for(var j=0; j<array_length(global.createdPeople); j++){
			
			var person = global.createdPeople[j];
			for(var k=0; k<array_length(person.tokens); k++){
				if (person.tokens[k] == token){
					var personlocation = [person.x,person.y];
					return personlocation;
				}
			}
			
		}
	}
	
	// check the tokens array
	// for each element found check its position 
	// draw the instance in orbit of that position 
	
}

function dispose_in_a_circle (xx, yy){
	theta = 0;
	repeat(8){
    instance_create_layer(lengthdir_x(120, theta),lengthdir_y(120, theta),obj_whatever);
    theta += (360/8);
	}
}