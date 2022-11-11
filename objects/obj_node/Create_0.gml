/// @description Insert description here
// You can write your code in this editor
on = false;
image_index = 0;
image_xscale = 0.08;
image_yscale = 0.08;

xx = -1;
yy = -1;

dragging = false;
text="moppa";

// Add the info popup marker on the top right
info = instance_create_layer( bbox_right+10, bbox_top-10, "Info", obj_info);

// Set the text inside the popup
info.text = text;