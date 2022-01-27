/// @description Insert description here
// You can write your code in this editor

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

