//me desenho
draw_self()

//com outra cor
gpu_set_blendmode(bm_add);

//draw_sprite_ext(sprite_index, image_index, x, y, 5, 3, image_angle, c_fuchsia, 0.8);
//esse efeito é muito bom, talvez eu o guarde para os tiros do boss


draw_sprite_ext(sprite_index, image_index, x, y, 1.5, 1.5, image_angle, c_teal, 0.8)

//resetando o processamento gráfico
gpu_set_blendmode(bm_normal);