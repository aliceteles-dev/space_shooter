//vspeed = 2;
//v = 2;
//if y >= 150 vspeed = 0;

//hspeed = v;

maquina_de_estado();

//show_debug_message(estado);
show_debug_message(timer);

//movimento();

if (vida <= 0)
{
	instance_destroy();	
}

show_debug_message(vida);