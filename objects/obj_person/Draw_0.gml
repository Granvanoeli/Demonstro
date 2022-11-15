/// @description Insert description here
// You can write your code in this editor
draw_self();
for(var i=0; i<array_length(global.createdNodes); i++){
	
	var node = global.createdNodes[i];
	with(node){
		// This is not very good. I should iterate through the array of tokens
		if (tokens == GROUPS.frail) {			
			draw_line_width_color (x, y, other.x, other.y, 4, c_fuchsia, c_blue);	
		}
	}
}




