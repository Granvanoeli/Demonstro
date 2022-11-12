/// @description Insert description here
// You can write your code in this editor
draw_things = true;

enum GROUPS {
	frail,
	carer
}

if(draw_things){
	instance_create_layer(702, 387, "Instances", obj_person,{ tokens: [GROUPS.frail], sprite: spr_joan, name: "Joan"});
	instance_create_layer(702, 387, "Instances", obj_person,{ tokens: [GROUPS.frail], sprite: spr_frances, name: "Frances"});
	instance_create_layer(702, 387, "Instances", obj_open_cdr,{ tokens: [GROUPS.frail]});
	instance_create_layer(194, 271, "Instances", obj_data_exchange, { tokens: [GROUPS.carer]});	
}