timer_tiro = 0;
tempo_tiro = game_get_speed(gamespeed_fps) * 2;

disparo = function()
{
	timer_tiro = tempo_tiro;
	tempo_tiro --;

	
	if (tempo_tiro <= 0)
	{
		var _tempo_random = random_range(1, 2) * game_get_speed(gamespeed_fps);	
		instance_create_layer(x, y, "tiro", obj_tiro_mob1);	
		tempo_tiro = _tempo_random;
	}
}