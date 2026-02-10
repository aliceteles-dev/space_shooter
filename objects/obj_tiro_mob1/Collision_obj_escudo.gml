
if (me_destrui == false)
{
	instance_destroy();
	me_destrui = true;
}

if (me_destrui)
{
	instance_create_layer(x, y, layer, obj_particula_tiro);
}

