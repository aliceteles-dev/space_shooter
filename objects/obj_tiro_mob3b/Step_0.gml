//vspeed = 4;

if y >= room_height instance_destroy(self);

if (autodestruicao >= 2)
{
	instance_destroy();
	instance_create_layer(x, y, "tiro", obj_particula_tiro);
}