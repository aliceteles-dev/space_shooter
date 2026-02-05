//pra funcionar o efeito stretch and squash
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);

if (damage)
{
	//chamando o shader que eu criei
	shader_set(sh_branco);
	
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);

	//damage--;

	//resetando o shader
	shader_reset();
}

//fazendo ele ficar invisível para que a transição funcione
//checar se o alarme >= 49, se x e y estão nas posiç