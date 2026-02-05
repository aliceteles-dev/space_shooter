vidas = 15;

//variable to control the state machine
estado = "chegando";

//timer pra conversão do estado carregando em atirando
espera = game_get_speed(gamespeed_fps) * 0.5;
timer = 0;


//variável para registrar quantos tiros ele deu
contador = 0;
tiro_max = 4;


//escolhendo a direção da fuga
fleeing_direction = false;

//timer_tiro = 0;
//espera_entre_tiros = game_get_speed(gamespeed_fps);

//hspeed = 1;

//tiro_mob3 = function(_tiro = obj_tiro_mob3a)
//{
//	timer_tiro++;
	
//	if (timer_tiro == espera_entre_tiros)
//	{
//		var _bullet = instance_create_layer(x, y, "tiro", _tiro);
//		_bullet.vspeed = 4;
//		timer_tiro = 0;
//	}
//}
//drop = function()
//{
//	//perder vida 
//	//instance_destroy(obj_tiro_player);
//	vidas--;
	
//	//se ele ficou sem vida, ele se destroi
//	if (vidas == 0)
//	{
//		instance_destroy();

	
//	//e cria sua partícula de explosão
//	}

drop = function()
{
	if (vidas > 1)
	{
		vidas--;	
		screenshake(3);
	}
	else
	{
		instance_destroy();
		screenshake(20);
		instance_create_layer(x, y, "particulas", obj_mob_explosion);
		var _chance = random(100);
		if (_chance > 98)
		{
			var _powerup = instance_create_layer(x, y, "power_up", obj_powerup);
			_powerup.x += 2;
			_powerup.y -= 10;
		}
	
	}
}


//máquina de estados
state_machine = function()
{
	switch(estado)
	{
		case "chegando":
			if y < 160
			{
				vspeed = 2;
			}
			else
			{
				estado = "carregando";
			}
		break;
	
		case "carregando":
			vspeed = 0;

			timer++;
			
			if (timer == espera)
			{
				estado = choose("atirando", "atirando2");
				timer = 0;
			}
				
		break;
		
		case "atirando":
			//tiro_mob3(obj_tiro_mob3a);
			var _pitch = random_range(.6, 0.8);
			if (instance_exists(obj_player))
			{
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				var _tiro = instance_create_layer(x, y, "tiro", obj_tiro_mob3a);
				audio_stop_sound(sfx_tiro_mob)
				audio_play_sound(sfx_tiro_mob, 1, false, , , _pitch)
				_tiro.speed = 2;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir + 90;
			}
			
			estado = "carregando";	
			contador++;
			if contador > tiro_max estado = "fugindo"
			
		break;
		
		case "atirando2":
		{
				var _angulo = 255;
				var _pitch = random_range(.6, 0.8);
			
				repeat(3)
				{
					var _tiro2 = instance_create_layer(x, y, "tiro", obj_tiro_mob3b);
					_tiro2.direction = _angulo;
					_tiro2.speed = 4;
					audio_stop_sound(sfx_tiro_mob);
					audio_play_sound(sfx_tiro_mob, 1, false, , , _pitch);

				
				
					_angulo += 15;
				}
			
				estado = "carregando";
				contador++;
				
				if contador > tiro_max estado = "fugindo"
		}
		break;
		
		case "fugindo":
			y -= 1.3;
			if fleeing_direction = false
			{
				hspeed = choose(1, -1);
				fleeing_direction = true;
			}
			if y < -64 instance_destroy();
		break;
		
	}


		
}




	