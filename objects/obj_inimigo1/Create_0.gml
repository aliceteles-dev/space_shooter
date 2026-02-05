timer_tiro = 0;
tempo_tiro = game_get_speed(gamespeed_fps) * 2;
//vidas = 3;
from_seq = in_sequence;

disparo = function()
{
	timer_tiro = tempo_tiro;
	tempo_tiro --;

	
	if (tempo_tiro <= 0 and (x >= 0 + 19 and x <= room_width - 19))
	{
		var _tempo_random = random_range(1, 2) * game_get_speed(gamespeed_fps);	
		instance_create_layer(x, y, "tiro", obj_tiro_mob1);	
		audio_stop_sound(sfx_tiro_mob);
		audio_play_sound(sfx_tiro_mob, 0, 0);
		tempo_tiro = _tempo_random;
	}
}

drop = function()
{
	destroyed(obj_mob_explosion);
	var _powerup = choose(obj_escudoup, obj_vidaup, obj_powerup);
	
	var _chance = random(100);
	if (_chance > 99)
	{
		var _powerup = instance_create_layer(x, y, "power_up", _powerup);
		_powerup.x += 2;
		_powerup.y -= 10;
	}
	else if (_chance >= 97)
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