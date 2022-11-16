/// @description Insert description here
// You can write your code in this editor
draw_self();

// Iterate through the list of nodes and connect to the appropriate ones
for(var i=0; i<array_length(global.createdNodes); i++){
	
	// Current node
	var node = global.createdNodes[i];
	
	with(node){
		// This is not very good. I should iterate through the array of tokens
		for(var j=0; j<array_length(node.tokens); j++)
		{		   
			
		    if (searchArray(other.tokens, node.tokens[j]))
		    {
		        draw_line_width_color (x, y, other.x, other.y, 4, c_fuchsia, c_blue);
		    }

		}		
	}
}




