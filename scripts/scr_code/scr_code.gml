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


#endregion