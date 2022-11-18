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
		groups: [GROUPS.frail, GROUPS.carer],
		text: "This is some text",
		sprite: spr_PROMs
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
		var personX = (currentPerson.isMainPerson ? (room_width/2): (room_width/2 + lengthdir_x(100, (360/array_length(people))*normalPeopleCreated )));
		var personY = (currentPerson.isMainPerson ? (room_height/2): (room_height/2 + lengthdir_y(100, (360/array_length(people))*normalPeopleCreated )));
		
		var person = instance_create_layer(
			personX, 
			personY, 
			"Instances", 
			obj_person, 
			{	
				name: currentPerson.name, 
				tokens: currentPerson.tokens,
				text: currentPerson.text,
				sprite_index: currentPerson.sprite,
				isMainPerson: currentPerson.isMainPerson,
				associatedNodes: currentPerson.associatedNodes,
				image_xscale: (currentPerson.isMainPerson ? 1 : 0.7),
				image_yscale: (currentPerson.isMainPerson ? 1 : 0.7)
			}
		);

				
		// Store created nodes into array
		array_push(global.createdPeople, person);
	}
	
	
	// NODES ASSIGNMENT
	/// Assign each node to the appropriate people.		
	define_orbits(nodes);
		
	// Position the nodes around the people
	for(var j=0; j<array_length(global.createdPeople); j++){
			
		var currentPerson = global.createdPeople[j];
		for(var i=0; i<array_length(currentPerson.associatedNodes); i++){
			
			var currentNodes = currentPerson.associatedNodes;
			
			var px = currentPerson.x;
			var py = currentPerson.y;
			
			
			// Create each node in a random location
			var node = instance_create_layer(
				px + lengthdir_x(164, currentPerson.isMainPerson ? 30*(i+1) + 90 : 30*(i+1) + 270), 
				py + lengthdir_y(164, currentPerson.isMainPerson ? 30*(i+1) + 90 : 30*(i+1) + 270), 
				"Instances", 
				obj_node, 
				{	tokens: currentNodes[i].groups, 
					name: currentNodes[i].name, 
					sprite_index: currentNodes[i].sprite 
				}
			);
		
			//Store created nodes into array
			array_push(global.createdNodes, node);
		}
	}
}
	
#endregion

#region Create test objects
if(draw_test_things){
	var central = instance_create_layer(room_width/2,room_height/2, "Instances", obj_area1);
	
	var _xx = central.x + lengthdir_x(164, 0);
	var _yy = central.y + lengthdir_y(164, 0);
	instance_create_layer(_xx, _yy, "Instances", obj_draggable);
	
	var _xx2 = central.x + lengthdir_x(164, 450);
	var _yy2 = central.y + lengthdir_y(164, 450);
	instance_create_layer(_xx2, _yy2, "Instances", obj_area2);
}
#endregion