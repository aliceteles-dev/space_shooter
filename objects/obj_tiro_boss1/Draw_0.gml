draw_sprite_ext(sprite_index, image_index, x, y, 1.5, image_yscale, image_angle, c_fuchsia, image_alpha);

gpu_set_blendmode(bm_add);


draw_sprite_ext(sprite_index, image_index, x, y, 2.0, image_yscale, image_angle, c_lime, 0.8);

gpu_set_blendmode(bm_normal);