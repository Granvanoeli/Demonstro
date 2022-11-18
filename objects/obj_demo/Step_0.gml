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

//add to Joan
//obj_joan.nodes.gp 