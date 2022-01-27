/// @description Insert description here
// You can write your code in this editor

height = sprite_get_height(sprite_index);
width = sprite_get_width(sprite_index);

if(width != 0 and height != 0){
	var hover = checkHovering(width, height);
	var click = hover && mouse_check_button_pressed(mb_left);
		
	if(click) { 
		show_debug_message("click")
		with (instance_create_layer(x, y, "Dots", obj_dot)){		
		move_towards_point(obj_phr.x, obj_phr.y, 5);
	}
	}
}

if(!dragging){
	if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)){
		dragging = true;
		xx = x - mouse_x;
		yy = y - mouse_y;
	}
}
else {
   x = mouse_x + xx;
   y = mouse_y + yy;
   
   //If user releases the mouse button, stop dragging
   if (!mouse_check_button(mb_left)) {
      dragging = false;
   }
}