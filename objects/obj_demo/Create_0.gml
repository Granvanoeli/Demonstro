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
		group: [GROUPS.frail],
		text: "This is some text",
		sprite: spr_draggable
	},
	{
		name: "Suggested activity 2",
		group: [GROUPS.frail],
		text: "This is some text",
		sprite: spr_draggable
	},
	{
		name: "VOCAL",
		group:[GROUPS.carer],
		text: "This is some text",
		sprite: spr_area1
	}
];

people = [
	{
		name: "Joan",
		tokens: [GROUPS.frail],
		text: "This is some text",
		sprite: spr_joan,
		isSelected: false,
	},
	{
		name: "Frances",
		tokens: [GROUPS.carer],
		text: "This is some text",
		sprite: spr_frances,
		isSelected: true,
	}
]

global.createdNodes = [];
global.createdPeople = [];

if(draw_things){
	
	
	// PEOPLE
	/// Create all the people in the array of people
	for(var i=0; i<array_length(people); i++)
	{
		
		// Put person in random spot if not active
		var personX = (people[i].isSelected ? (room_width/2): (irandom(room_width)));
		var personY = (people[i].isSelected ? (room_height/2): (irandom(room_height)));
		
		var person = instance_create_layer(
			personX, 
			personY, 
			"Instances", 
			obj_person, 
			{	
				name: people[i].name, 
				tokens: people[i].tokens,
				text: people[i].text,
				sprite_index: people[i].sprite,
				isSelected: people[i].isSelected
			}
		);
				
		// Store created nodes into array
		array_push(global.createdPeople, person);
	}
	
	
	// NODES
	/// Create all the nodes in the array of nodes
	for(var i=0; i<array_length(nodes); i++)
	{
		// Create each node in a random location
		var node = instance_create_layer(
			irandom(room_width), 
			irandom(room_height), 
			"Instances", 
			obj_node, 
			{	tokens: nodes[i].group, 
				name: nodes[i].name, 
				sprite_index: nodes[i].sprite 
			}
		);
				
		// Store created nodes into array
		array_push(global.createdNodes, node);
	}

	
	// Create nodes non-programmatically
	//instance_create_layer(702, 387, "Instances", obj_open_cdr,{ tokens: [GROUPS.frail]});
	//instance_create_layer(194, 271, "Instances", obj_data_exchange, { tokens: [GROUPS.carer]});	
}