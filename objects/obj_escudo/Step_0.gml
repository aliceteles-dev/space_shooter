//desativando o escudo
if(image_index < 1 && image_speed < 0)
{
	instance_destroy();
	obj_player.meu_escudo = noone;
}

