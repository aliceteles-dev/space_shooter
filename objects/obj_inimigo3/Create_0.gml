vidas = 10;


drop = function()
{
	//perder vida 
	//instance_destroy(obj_tiro_player);
	vidas--;
	
	//se ele ficou sem vida, ele se destroi
	if (vidas == 0)
	{
		instance_destroy();
		instance_create_layer(x, y, "particulas", obj_mob_explosion);
	
	//e cria sua partícula de explosão
	}
	
	
}