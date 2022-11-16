/// @description Insert description here
// You can write your code in this editor
on = false;
dragging = false;
text="moppa"; //To be expanded
// connectsTo passed  by creator


image_index = 0;


xx = -1;
yy = -1;

// Add the info popup marker on the top right. Each instance creates their own info
info = instance_create_layer( bbox_right+10, bbox_top-10, "Info", obj_info);

// Set the text inside the popup. This should be a script (?)
info.text = text;