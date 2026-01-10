timer_tiro = 0;
tempo_tiro = game_get_speed(gamespeed_fps) * 2;
vidas = 3;

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

drop = function()
{
	destroyed(obj_mob_explosion);
	
	var _chance = random_range(0, 100);
	if (_chance > 60)
	{
		var _powerup = instance_create_layer(x, y, "power_up", obj_powerup);
		_powerup.x += 2;
		_powerup.y -= 10;
	}
	
}

//tava tentando dar 3 pontos de vida pro mob, pra ele só morrer depois de três tiros, mas este código não funciona
//perde_vida = function(){
//	if (vidas > 1)
//	{
//		vidas --;
//	}
//	else
//	{
//		drop()	
//	}
	
//}