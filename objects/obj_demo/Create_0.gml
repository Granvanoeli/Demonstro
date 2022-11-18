/// @description Insert description here
// You can write your code in this editor
draw_things = true;

draw_test_things = false;

#region Setup
enum GROUPS {
	frail,
	carer
}

// List of nodes for Frail

nodes = [
	{
		name: "Suggested activity 1",
		groups: [GROUPS.frail],
		text: "This is some text",
		sprite: spr_draggable
	},
	{
		name: "Suggested activity 2",
		groups: [GROUPS.frail],
		text: "This is some text",
		sprite: spr_draggable
	},
	{
		name: "Suggested activity 2",
		groups: [GROUPS.frail],
		text: "This is some text",
		sprite: spr_draggable
	},
	{
		name: "Suggested activity 2",
		groups: [GROUPS.frail],
		text: "This is some text",
		sprite: spr_draggable
	},
	{
		name: "Suggested activity 2",
		groups: [GROUPS.frail],
		text: "This is some text",
		sprite: spr_draggable
	},
	{
		name: "VOCAL",
		groups:[GROUPS.carer],
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
		associatedNodes: []
	},
	{
		name: "Frances",
		tokens: [GROUPS.carer],
		text: "This is some text",
		sprite: spr_frances,
		isMainPerson: false,
		associatedNodes: []
	}
	
]

global.createdNodes = [];
global.createdPeople = [];
global.mainPerson = -1;

#endregion

#region Create all objects
if(draw_things){
	
	
	// PEOPLE CREATION
	/// Create all the people in the array of people
	var normalPeopleCreated = -1;
	for(var i=0; i<array_length(people); i++)
	{
		var currentPerson = people[i];
		
		if(currentPerson.isMainPerson){
			global.mainPerson = currentPerson;
		}		
		else {
			normalPeopleCreated++;
		}
		
		
		print(360/array_length(people)*normalPeopleCreated);
		
		// Dispose poeple in the right orbit. The "supporting peple" 
		// should be displayed in orbit of the main person.
		var personX = (people[i].isMainPerson ? (room_width/2): (room_width/2 + lengthdir_x(150, (360/array_length(people))*normalPeopleCreated )));
		var personY = (people[i].isMainPerson ? (room_height/2): (room_height/2 + lengthdir_y(150, (360/array_length(people))*normalPeopleCreated )));
		
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
				isMainPerson: people[i].isMainPerson,
				associatedNodes: people[i].associatedNodes
			}
		);

				
		// Store created nodes into array
		array_push(global.createdPeople, person);
	}
	
	
	// NODES ASSIGNMENT
	/// Assign each node to the appropriate people.
	//for(var i=0; i<array_length(nodes); i++)
	//{
		
define_orbits(nodes);
		
for(var j=0; j<array_length(global.createdPeople); j++){
			
	var currentPerson = global.createdPeople[j];
	for(var i=0; i<array_length(currentPerson.associatedNodes); i++){
			
		var nodes = currentPerson.associatedNodes;
			
		var px = currentPerson.x;
		var py = currentPerson.y;
		// Create each node in a random location
		var node = instance_create_layer(
			px + lengthdir_x(164, 360/array_length(currentPerson.associatedNodes)*i), 
			py + lengthdir_y(164, 360/array_length(currentPerson.associatedNodes)*i), 
			"Instances", 
			obj_node, 
			{	tokens: nodes[i].groups, 
				name: nodes[i].name, 
				sprite_index: nodes[i].sprite 
			}
		);
		
		//Store created nodes into array
		array_push(global.createdNodes, node);
	}
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
	instance_create_layer(_xx, _yy, "Instances", obj_draggable);
	
	var _xx2 = central.x + lengthdir_x(164, 90);
	var _yy2 = central.y + lengthdir_y(164, 90);
	instance_create_layer(_xx2, _yy2, "Instances", obj_area2);
}
#endregion