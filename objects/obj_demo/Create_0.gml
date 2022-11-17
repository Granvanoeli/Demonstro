/// @description Insert description here
// You can write your code in this editor
draw_things = false;

draw_test_things = true;

#region Setup
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
		isMainPerson: true,
	},
	{
		name: "Frances",
		tokens: [GROUPS.carer],
		text: "This is some text",
		sprite: spr_frances,
		isMainPerson: false,
	}
]

global.createdNodes = [];
global.createdPeople = [];
global.mainPerson = -1;

#endregion

#region Create all objects
if(draw_things){
	
	
	// PEOPLE
	/// Create all the people in the array of people
	for(var i=0; i<array_length(people); i++)
	{
		
		// Put person in random spot if not active
		var personX = (people[i].isMainPerson ? (room_width/2): (irandom(room_width)));
		var personY = (people[i].isMainPerson ? (room_height/2): (irandom(room_height)));
		
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
				isMainPerson: people[i].isMainPerson
			}
		);
		if (person.isMainPerson){
			global.mainPerson = person;
		}
		
				
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
		
		//trying orbit functionout
		show_debug_message(check_orbit(node.tokens));
		
		// Store created nodes into array
		array_push(global.createdNodes, node);
	}

	
	// Create nodes non-programmatically
	//instance_create_layer(702, 387, "Instances", obj_open_cdr,{ tokens: [GROUPS.frail]});
	//instance_create_layer(194, 271, "Instances", obj_data_exchange, { tokens: [GROUPS.carer]});	
}
	
#endregion

#region Create test objects
if(draw_test_things){
	var central = instance_create_layer(room_width/2,room_height/2, "Instances", obj_area1);
	var _xx = central.x + lengthdir_x(164, 0);
	var _yy = central.y + lengthdir_y(164, 0);
	instance_create_layer(_xx, _yy, "Instances", obj_area2);
	
	var _xx2 = central.x + lengthdir_x(164, 90);
	var _yy2 = central.y + lengthdir_y(164, 90);
	instance_create_layer(_xx2, _yy2, "Instances", obj_area2);
}
#endregion