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


function define_orbits(nodes){
	
	for(var m=0; m<array_length(nodes); m++){
		
		var tokensArray = nodes[m].groups;
		// For each token the node has 
		for(var i=0; i<array_length(tokensArray); i++){
			//Check each of the people
			var token = tokensArray[i];
			for(var j=0; j<array_length(global.createdPeople); j++){
			
				var person = global.createdPeople[j];
				// Check each of the people's tokens
				for(var k=0; k<array_length(person.tokens); k++){
				
					// If they correspond
					if (person.tokens[k] == token){
						array_push(person.associatedNodes, nodes[m]);
					}
				}			
			}
		}
	}
}

function count_nodes_of_each_type(nodes){
	var types = [];
	
	for(var i=0; i<array_length(nodes); i++){
		
	}

}

function dispose_in_a_circle (xx, yy){
	theta = 0;
	repeat(8){
    instance_create_layer(lengthdir_x(120, theta),lengthdir_y(120, theta),obj_whatever);
    theta += (360/8);
	}
}