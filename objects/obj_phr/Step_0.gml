/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


//Create children if on
if (on and !instance_exists(obj_PROMs) and !instance_exists(obj_OCPs)){	
	with(instance_create_layer(154, 448, "Instances", obj_PROMs)){		
		show_debug_message("Created PROMs")
	}
	with(instance_create_layer(154, 580, "Instances", obj_OCPs)){		
		show_debug_message("Created OCPs")
	}
}

//Destroy children if not on
if(!on and instance_exists(obj_PROMs) and instance_exists(obj_OCPs)){
	with(obj_PROMs){
		instance_destroy();
	}
	with(obj_OCPs){
		instance_destroy();
	}
}


