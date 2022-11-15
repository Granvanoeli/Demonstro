/// @description Insert description here
// You can write your code in this editor
draw_things = true;

//
enum GROUPS {
	frail,
	carer
}

// List of nodes for Frail

nodes = [
{
	name: "Suggested activity 1",
	group: GROUPS.frail,
	text: "This is some text",
	sprite: spr_draggable
},
{
	name: "Suggested activity 2",
	group: GROUPS.frail,
	text: "This is some text",
	sprite: spr_draggable
},
{
	name: "VOCAL",
	group: GROUPS.carer,
	text: "This is some text",
	sprite: spr_area1
}

]

global.createdNodes = [];

if(draw_things){
	
	// Create people
	instance_create_layer(702, 387, "Instances", obj_person,{ 
		tokens: [GROUPS.frail], 
		sprite: spr_joan, 
		name: "Joan"
		});
	instance_create_layer(200, 387, "Instances", obj_person,{ 
		tokens: [GROUPS.carer], 
		sprite: spr_frances, 
		name: "Frances"
		});
	
	
	// Create all the nodes in the array of nodes
	for(var i=0; i<array_length(nodes); i++)
	{
		// Create each node in a random location
		var node = instance_create_layer(
			irandom(room_width), 
			irandom(room_height), 
			"Instances", 
			obj_node, 
			{ tokens: nodes[i].group, name: nodes[i].name, sprite_index: nodes[i].sprite });
		
		array_push(global.createdNodes, node);
	}

	
	// Create nodes non-programmatically
	instance_create_layer(702, 387, "Instances", obj_open_cdr,{ tokens: [GROUPS.frail]});
	instance_create_layer(194, 271, "Instances", obj_data_exchange, { tokens: [GROUPS.carer]});	
}