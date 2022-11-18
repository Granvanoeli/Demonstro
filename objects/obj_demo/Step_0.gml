/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("R"))){
	game_restart();
}

if(keyboard_check_pressed(ord("T"))){
	show_debug_message(global.createdNodes);
	show_debug_message(global.createdPeople[0].name );
	show_debug_message(global.createdPeople[0].associatedNodes );
	show_debug_message(global.createdPeople[1].name );
	show_debug_message(global.createdPeople[1].associatedNodes );
}

if(mouse_check_button_pressed(mb_left)){

var inst = instance_position(mouse_x, mouse_y, obj_person)


}

//add to Joan
//obj_joan.nodes.gp 