/// @description Insert description here
// You can write your code in this editor

//Draw text box
draw_sprite(spr_text_box, 0, x, y);


//Draw text

draw_set_colour(c_black);
draw_text_ext(x,y, text, stringHeight, boxWidth);