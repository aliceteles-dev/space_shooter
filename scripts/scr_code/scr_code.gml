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





#endregion