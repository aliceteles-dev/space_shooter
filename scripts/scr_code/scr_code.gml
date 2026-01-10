#region Variáveis

global.debug = true

#endregion


#region Funções

//destruição do inimigo
function destroyed(_particula = obj_particula_tiro)
{
	instance_destroy();
	instance_create_layer(x, y, "particulas", _particula);
}





#endregion