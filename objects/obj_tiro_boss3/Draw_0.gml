//fazendo ele se desenhar bonitão

draw_self();

gpu_set_blendmode(bm_add);

draw_sprite_ext(sprite_index, image_index, x, y, 2.5, 2, image_angle, c_aqua, 0.5);

//reset
gpu_set_blendmode(bm_normal);