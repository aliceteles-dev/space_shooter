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
	
vida = 900;
estado = "chegando";

//controles de tempo para disparo
disparar_agora = game_get_speed(gamespeed_fps) * 0.1; 
timer = 0;

//pra saber se eu dou o primeiro ou o segundo disparo
disparo_doispontozero = 0;
contador_fase2 = 50; 
//variavel de controle pra que o disparo2.0 aumente apenas uma vez
//entrei_no_estado = false;

inicia_movimento();

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
			
			if (vida <= 600)
			{
				estado = "disparo1_fase2";	
			}
		break;
		
		
		case "disparando":
			//timer = 0;
			//timer++;
			//entrei_no_estado = true;
			var _disparo = instance_create_layer(x - x/5, y, "tiro", obj_tiro_mob3a);
			_disparo.vspeed = 5;
			var _disparo = instance_create_layer(x + x/5, y, "tiro", obj_tiro_mob3a);
			_disparo.vspeed = 5;
			estado = "carregando"
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
			
			if (timer == disparar_agora * 2)
			{
				instance_create_layer(x, y, "tiro", obj_tiro_boss2);
				timer = 0;
			}
			//estado = "carregando";
			movimento();
		break;
		
		
		case "disparo1_fase2":
			estado = "carregando";
		break;
			
		
	}
}







