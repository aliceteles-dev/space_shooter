//pontos de vida bem altos
//dois ou mais tipos de tiro
//alterar cor e tamanho dos tiros (obj_tiro_boss1)
//movimentação ameaçadora (numa state machine com um choose direction)

//variável de estado
//estado = "chegando"; //fase1: disparo1, carregando, disparo2, carregando2 (loop, como mob3)
					//com uma variável de controle, vida, quando ela for menor que x a gente passa para a fase 2
					//fase2: disparo3, carregando3, disparo4, movimento, disparo3, carregando3...
					//fase4: se movimenta sempre em círculos (como) e spawna mobs

/*as variações de estado serão: chegando, disparando, disparomovendo1, disparomaior,  */



#region Variáveis	
//vida na verdade vale 900
vida = 900;
estado = "chegando";

//controles de tempo para disparo
disparar_agora = game_get_speed(gamespeed_fps) * 0.1; 
timer = 0;

//controle de tempo para spawnar os mobs
timer_spawn = 0;

//pra saber se eu dou o primeiro ou o segundo disparo
disparo_doispontozero = 0;
contador_fase2 = 50; 
//variavel de controle pra que o disparo2.0 aumente apenas uma vez
//entrei_no_estado = false;

inicia_movimento();
inicia_movimento2()

//definindo velocidade
velx = 2;
vely = 2;

//definindo a variavel para swtichar
posicao = "emcima" // descendo, embaixo, subindo

//variáveis para controlar o tiro solo
tempo = game_get_speed(gamespeed_fps) * 0.5;
timer_disparo1_fase2 = 0;


//variavel de controle pra iniciar a musica dele só uma vez
toquei_musica = false;

//controlando a explosão do boss
explodindo = false;
contador_explosao = 0;

//definindo onde cada explosão vai ser spawnada
aleatorio1 = x - sprite_width/2
aleatorio2 = x + sprite_width/2
aleatorio3 = y - sprite_width/2
aleatorio4 = y + sprite_width/2

//controlando o tempo da explosão
timer_explosao = 0;
tempo_explosao = game_get_speed(gamespeed_fps) * .1



#endregion


#region Métodos
tiro_solo = function()
{
	
	timer_disparo1_fase2++;
	
	if (timer_disparo1_fase2 >= tempo)
	{	
		var _pitch = random_range(.6, 0.8);
		audio_stop_sound(sfx_tiro_mob)
		audio_play_sound(sfx_tiro_mob, 1, false, , , _pitch)
		var _tiro = instance_create_layer(x, y, "tiro", obj_tiro_boss3);	
		//_tiro.vspeed = 4;
		//_tiro.image_xscale = 1.5;
		//_tiro.image_yscale = 1.5;
		timer_disparo1_fase2 = 0;
	}
}

roda_de_tiros = function(_angulo = 255)
{
	var _tempo = game_get_speed(gamespeed_fps) * 0.5;
	timer++;
	

		repeat(24)
		{

				var _pitch = random_range(.6, 0.8);
	
				var _tiro2 = instance_create_layer(x, y, "tiro", obj_tiro_boss1);
				_tiro2.direction = _angulo;
				_tiro2.speed = 4;
				audio_stop_sound(sfx_tiro_mob);
				audio_play_sound(sfx_tiro_mob, 1, false, , , _pitch);
				timer = 0;
				_angulo += 15;
				
		}		
}

muda_posicao = function()
{
	switch(posicao)
	{

		case "emcima":
	
			x += velx;
		
			if (x >= room_width - (sprite_width / 2 - 10))// or x <= sprite_width / 2)
			{
				velx = -velx;
				posicao = "descendo"
			}
		break;
		
		case "descendo":
			
			y += 1;
			x += velx;
			
			if (x <= sprite_width / 2 - 10)
			{
				velx = -velx
				posicao = "embaixo"
			}
		break;
		
		case "embaixo":
			
			x += velx;
			
			if (x >= room_width - (sprite_width / 2 - 10))
			{
				velx = -velx;
				posicao = "subindo";
			}
		break;
		
		case "subindo":
		
			y -= 1;
			x += velx;
			
			if (x <= sprite_width / 2 - 10)
			{
				velx = -velx;
				posicao = "emcima";
			}
	}
		
}

//explosão do boss após derrota
fui_derrotado = function()
{
	timer_explosao++;
	explodindo = true;
	
	//var x_explosao = random_range(aleatorio1, aleatorio2);
	//talvez usar bbox aqui seja melhor
	var x_explosao = random_range(bbox_left, bbox_right);
	var y_explosao = random_range(bbox_top, bbox_bottom);


	//definindo o áudio e a sprite de cada explosão
	var som = choose(sfx_boss_explosion1, sfx_boss_explosion2, sfx_boss_explosion3, sfx_mob_explosion);
	var minha_explosao = choose(obj_explosao_pequena1, obj_explosao_pequena2);
	
	if(vida <= 0 and timer_explosao >= tempo_explosao)
	{
		instance_create_depth(x_explosao, y_explosao, depth - 100, minha_explosao);
		//instance_create_layer(x_explosao, y_explosao, "explosao", minha_explosao);	
		audio_play_sound(som, 3, false);
		contador_explosao++;
		timer_explosao = 0;
		//screenshake(20);
	}
	
	if (contador_explosao >= 100) 
	{
		instance_destroy();
		obj_player.timer_final = global.acabou - 60;
	}
}


maquina_de_estado = function()
{
	switch(estado)
	{
		//variaveis que só vou usar aqui dentro
		
		
		case "chegando":
			if (y < 100)
			{
				vspeed = 2;	
			}
			else
			{
				estado = "carregando";	
			}
		break;
	
	
		case "carregando":
			vspeed = 0;
			timer++;
			if (timer == disparar_agora and disparo_doispontozero <= contador_fase2)
			{
				estado = "disparando";	
				timer = 0;
			}
			else if (timer == disparar_agora + 30 and disparo_doispontozero >= contador_fase2)
			{
				estado = "disparomovendo1";	
				movimento();
				timer = 0;
			}
			
			if (vida <= 675)
			{
				estado = "disparo1_fase2";	
			}
		break;
		
		
		case "disparando":
			//timer = 0;
			//timer++;
			//entrei_no_estado = true;
			var _pitch = random_range(.6, 0.8);
			var _disparo = instance_create_layer(x - x/5, y, "tiro", obj_tiro_mob3a);
			_disparo.vspeed = 5;
			var _disparo = instance_create_layer(x + x/5, y, "tiro", obj_tiro_mob3a);
			_disparo.vspeed = 5;
			audio_stop_sound(sfx_tiro_mob)
			audio_play_sound(sfx_tiro_mob, 1, false, , , _pitch)
			estado = "carregando";
			disparo_doispontozero++;
			
			if (disparo_doispontozero >= contador_fase2)
			{
				estado = "disparomovendo1";	
			}
			//if (entrei_no_estado)
			//{
			//	disparo_doispontozero += 1;
			//	entrei_no_estado = false;
			//}
			
			//if (timer >= disparar_agora * 5)
			//{
			//	estado = "disparomovendo1";	
			//}
			
			
		break;
	
	
		case "disparomovendo1":
			timer++;
			movimento();
			
			//disparo do meio
			if (timer == disparar_agora * 4)
			{
				var _pitch = random_range(.6, 0.8);
				var _tiro2 = instance_create_layer(x, y, "tiro", obj_tiro_boss2);
				
				//disparo da esquerda e da direita
				var _tiro1 = instance_create_layer(x, y, "tiro", obj_tiro_boss1);
				_tiro1.vspeed = 5;
				_tiro1.direction = 255;
				
				var _tiro3 = instance_create_layer(x, y, "tiro", obj_tiro_boss1);
				_tiro3.vspeed = 5;
				_tiro3.direction = 285;
				
				audio_stop_sound(sfx_tiro_mob)
				audio_play_sound(sfx_tiro_mob, 1, false, , , _pitch)
				
				timer = 0;
				
			}
			
			//mudando de fase
			if (vida <= 675)
			{
				estado = "disparo1_fase2";	
			}
			
			//estado = "carregando";
			
		break;
		
		
		case "disparo1_fase2":
			muda_posicao();
			timer++;
			timer_spawn++;
			
			if (timer >= disparar_agora * 23)
			{
				//função do repeat
				roda_de_tiros();
				timer = 0;
			}
			else if (timer >= disparar_agora * 5)
			{
				tiro_solo();	
			}

			
			if (timer_spawn = disparar_agora * 70)
			{
				var _mob = instance_create_layer(choose(36, 72, 108, 144, 180, 216, 252), y - 500, "inimigos", obj_inimigo1b);
				timer_spawn = 0;
			}
			
			if (vida <= 100)
			{
				estado = "fase3";	
			}
			
			
		break;
		
		
		//criar um novo case de tiro e alterná-lo com esse tiro circularw
		case "fase3":
			muda_posicao();	
			//roda_de_tiros();
			timer++;
			timer_spawn++;
			
			if (timer >= disparar_agora * 5)
			{
				roda_de_tiros();
				timer = 0;
			
			}
			
			if (timer_spawn == disparar_agora * 70)
			{
				var _mob = instance_create_layer(choose(36, 72, 108, 144, 180, 216, 252), y - 500, "inimigos", obj_inimigo1b);
				timer_spawn = 0;
			}
			
			if (vida <= 0)
			{
				estado = "morrendo";	
			}
			//estado = "disparo1_fase2";
		break;
		
		case "morrendo":
			fui_derrotado();
			audio_stop_sound(som_aggressor);
			screenshake(20)
		
		
		
			//var _angulo = 255;
			//var _pitch = random_range(.6, 0.8);
			
			//repeat(80)
			//{
			//	var _tiro2 = instance_create_layer(x, y, "tiro", obj_tiro_mob3b);
			//	_tiro2.direction = _angulo;
			//	_tiro2.speed = 10;
			//	audio_stop_sound(sfx_tiro_mob);
			//	audio_play_sound(sfx_tiro_mob, 1, false, , , _pitch);
			
			
			
			//	_angulo += 15;
			
			
			
			//estado = "carregando";
		break;
			
		
	}
}



#endregion






