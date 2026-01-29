randomize();

#region Variáveis

global.debug = false;

#endregion


#region Funções

//destruição do inimigo
function destroyed(_particula = obj_particula_tiro)
{
	if (y > 16 && x > 16 && x < room_width - 16)
	{
		instance_destroy();
		instance_create_layer(x, y, "particulas", _particula);
	}
}

//função pra chamar a tremida de tela quando o player toma dano
function screenshake(_tremble = 1)
{
	if (instance_exists(obj_screenshake))
	{
	//	obj_screenshake.tremble = _tremble;	
		with(obj_screenshake)
		{
			if (_tremble > tremble)
			{
				tremble = _tremble;	
			}
		}
	}
		
	
}


//fazendo o player piscar e efeito stretch and squash quando tomar dano
function inicia_efeito_dano()
{
	damage = false;
}

function timer_efeito_branco(_tempo = 1)
{
	damage = _tempo;
}

function contador_eb()
{
	if (damage > 0) damage--;
		
}


//configurando o som de explosão dos mobs
function explosao_mob(_tom = 0.6)
{
	var _pitch = random_range(0.6, 1.2);
	
	if ((x >= 0 && x <= room_width) and (y >= 0 and y <= room_width))
	{
		audio_stop_sound(sfx_mob_explosion);
		audio_play_sound(sfx_mob_explosion, 1, false, 1, 0, _tom);
	}
}




#endregion