/// @description Insert description here
// You can write your code in this editor
//Draw score
if (distance_to_object(obj_phr) < 200) {	
    draw_line_width_color (x, y, obj_phr.x, obj_phr.y, 4, c_fuchsia, c_blue);	
} 

draw_sprite(spr_PROMs, 0, x, y);
draw_set_font(font_big);
draw_set_halign(fa_left);
draw_text_transformed(x-40, y+40, "OCPs", 0.5, 0.5, 0);

//draw_text_transformed(251, 551, "OCPs", 0.5, 0.5, 0);
//draw_text_transformed(10,45, "GULL" +string(global.gulls), 0.5, 0.5, 0);

