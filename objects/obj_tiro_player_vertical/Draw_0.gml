//fazendo ele se desenhar
draw_self();


//fazendo ele se desenhar (sim, de novo, sobrescreve o desenho anterior)
if (obj_player.level_tiro < 4)
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 1.8, image_yscale * 1.8, image_angle, cor, image_alpha * 0.3);
}
//criando um efeito especial para o nível máximo do tiro
else
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, c_red, image_alpha * 0.2);
}

//mudando a maneira como o processador de vídeo mistura as coisas
//aqui eu vou pedir pra ele misturá-las bem, como se fossem tintas
gpu_set_blendmode(bm_add);

//agora preciso resetar o processamento gráfico para as configurações normais, ou o jogo todo ficaria zoado
gpu_set_blendmode(bm_normal);


