/// @description Insert description here
// You can write your code in this editor

//Turning on and off
if(!on){
    image_index = 1;
}
else{
	image_index = 0;
}

if(mouse_check_button_pressed(mb_right) && position_meeting(mouse_x, mouse_y, id)){
	on = !on;
	show_debug_message("Click!")
}


//Dragging
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

// Move associated info tooltip
info.x =  bbox_right+10;
info.y = bbox_top-10;
