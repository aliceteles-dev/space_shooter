//vspeed = 2;
//v = 2;
//if y >= 150 vspeed = 0;

//hspeed = v;


//musica do boss
if (y >= -96 and toquei_musica == false)
{
	audio_stop_sound(som_noiseattack);
	audio_play_sound(som_aggressor, 1, true);	
	toquei_musica = true;
}


maquina_de_estado();

//show_debug_message(estado);
//show_debug_message(timer);

//movimento();



//show_debug_message(vida);