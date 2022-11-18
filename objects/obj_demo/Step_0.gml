/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("R"))){
	game_restart();
}

if(keyboard_check_pressed(ord("T"))){
	show_debug_message(global.createdNodes);
	show_debug_message(global.createdPeople[0].name );
	show_debug_message(global.createdPeople[0].associatedNodes );
}

if(mouse_check_button_pressed(mb_left)){

var inst = instance_position(mouse_x, mouse_y, obj_person)

	if (inst != noone){
		if(!inst.isMainPerson){
			
			// Change the mail person
			inst.isMainPerson = true;
			inst.x = room_width/2;
			inst.y = room_height/2;
			
			for(var i=0; i<array_length(inst.associatedNodes); i++){
				var node = inst.associatedNodes[i];
				
				node.x = (room_width/2 + lengthdir_x(164, 30*(i+1) + 90 ))
				node.y = (room_height/2 + lengthdir_y(164, 30*(i+1) + 90 ))
			}
			
			global.mainPerson.isMainPerson = false;
			global.mainPerson = inst;
			
			// Move the nodes
			 
			
		}
	}
}

//add to Joan
//obj_joan.nodes.gp 