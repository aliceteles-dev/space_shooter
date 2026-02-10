//controlando o tempo entre os tiros 
tempo = game_get_speed(gamespeed_fps) * 0.5;
timer = 0;


vida = 1;

tiro_solo = function()
{
	timer++;
	
	if (timer >= tempo)
	{
		instance_create_layer(x, y, "tiro", obj_tiro_mob2);	
		timer = 0;
	}
}


//controlando a explosão do boss
explodindo = false;
contador_explosao = 0;

//definindo onde cada explosão vai ser spawnada
aleatorio1 = x - sprite_width/2
aleatorio2 = x + sprite_width/2
aleatorio3 = y - sprite_width/2
aleatorio4 = y + sprite_width/2


var x_explosao = random_range(aleatorio1, aleatorio2);
var y_explosao = random_range(aleatorio3, aleatorio4);


//definindo o áudio e a sprite de cada explosão
var som = choose(sfx_tiro, sfx_mob_explosion);
var minha_explosao = choose(obj_explosao_pequena1, obj_explosao_pequena2);

//controlando o tempo da explosão
timer_explosao = 0;
tempo_explosao = game_get_speed(gamespeed_fps) * .1

//criar variavel local pro pitch do som da explosão







fui_derrotado = function()
{
	timer_explosao++;
	explodindo = true;
	
	var x_explosao = random_range(aleatorio1, aleatorio2);
	var y_explosao = random_range(aleatorio3, aleatorio4);


	//definindo o áudio e a sprite de cada explosão
	var som = choose(sfx_boss_explosion1, sfx_boss_explosion2, sfx_boss_explosion3, sfx_mob_explosion);
	var minha_explosao = choose(obj_explosao_pequena1, obj_explosao_pequena2);
	
	if(vida <= 0 and timer_explosao >= tempo_explosao)
	{
		instance_create_layer(x_explosao, y_explosao, "explosao", minha_explosao);	
		audio_play_sound(som, 3, false);
		contador_explosao++;
		timer_explosao = 0;
	}
	
	if contador_explosao >= 50 instance_destroy();
	
}



