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
	var found = false;
	for(var i=0; i<array_length(array); i++){		
		if (array[i] == val_to_search){
			found = true;
		}
	}
	return found;
}


function define_orbits(nodes){
	
	// For every node NODE 1
	for(var i=0; i<array_length(nodes); i++){
		var node = nodes[i];
		
		// For every token in that node TOKEN 1 of NODE 1
		for(var j=0; j<array_length(node.groups); j++){
			var tokenInGroup = node.groups[j];
			
			// For every person PERSON 1
			for(var k=0; k<array_length(global.createdPeople); k++){
				var person = global.createdPeople[k];
								
				if(searchArray(person.tokens, tokenInGroup)){		
						
					array_push(person.associatedNodes, node);
				}

			}
		}
	}
		
}


function dispose_in_a_circle (xx, yy){
	theta = 0;
	repeat(8){
    instance_create_layer(lengthdir_x(120, theta),lengthdir_y(120, theta),obj_whatever);
    theta += (360/8);
	}
}