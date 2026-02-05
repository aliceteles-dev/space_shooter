//variavel pra fazer ele desaperecer
erase_tempo = game_get_speed(gamespeed_fps) * 10;
timer_delete = 0;
estado = "normal";
contagem = 15;
cor = c_white;

//mudando a cor da sprite quando ela está perto de ser apagada


maquina_estado = function()
{
	var _tempo = game_get_speed(gamespeed_fps);
	//var _branco = draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	switch(estado)
	{
		case "normal":
			if (timer_delete >= _tempo * 5)
			{
				estado = "pisquei";
			}
		break;
	
		case "pisquei":
			shader_set(sh_branco);
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.7);
			shader_reset();
			if (timer_delete >= _tempo * 5 + contagem)
			{
				estado = "cor_normal";	
				contagem += 15;
			}
		break;
	
		case "cor_normal":
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			//shader_reset();
			//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			if (timer_delete >= _tempo * 5 + contagem)
			{			
				estado = "pisquei";	
				contagem += 15;
			}
		break;
	
	}
}