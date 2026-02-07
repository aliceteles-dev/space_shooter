randomize();

#region Variáveis

global.debug = false;

global.destino = rm_jogo;

//variável pra permitir o controle do player
global.controle = 1;

//variavel para saber se eu posso criar uma sequence
global.sequence = false;

//tempo da room acabou
global.acabou = game_get_speed(gamespeed_fps) * 0;

global.transicao = false;

//variavel para controlar o idioma do jogo
//global.idiomas = ["portugues", "ingles", "espanhol"]
//global.idioma_atual = global.idiomas[0];
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

//função pra chamar a tremida de tela quando o player toma dano
function screenshake(_tremble = 1)
{
	if (instance_exists(obj_screenshake))
	{
	//	obj_screenshake.tremble = _tremble;	
		with(obj_screenshake)
		{
			if (_tremble > tremble)
			{
				tremble = _tremble;	
			}
		}
	}
		
	
}


//fazendo o player piscar e efeito stretch and squash quando tomar dano
function inicia_efeito_dano()
{
	damage = false;
}

function timer_efeito_branco(_tempo = 1)
{
	damage = _tempo;
}

function contador_eb()
{
	if (damage > 0) damage--;
		
}


//configurando o som de explosão dos mobs
function explosao_mob(_tom = 0.6)
{
	var _pitch = random_range(0.6, 1.2);
	
	if ((x >= 0 && x <= room_width) and (y >= 0 and y <= room_width))
	{
		audio_stop_sound(sfx_mob_explosion);
		audio_play_sound(sfx_mob_explosion, 1, false, 1, 0, _tom);
	}
}

//mudando a room a partir da transicao
function sq_muda_room()
{
	room_goto(global.destino);
}

//fazer o player ir para a posição x = 144 e y = 432
//quando ele estiver nela, chamar a sq_vitoria
//programar um timer para o player ir para a posição certa depois que o level acabar
//ou eu posso destruir o obj player e spawnar uma sprite no lugar dele 

function ativa_transicao_vitoria()
{
	global.controle = false;
}

function transicao_vitoria()
{
	//global.sequence = true;
	//y -= 3;
	////removendo a restrição do clamp
	//var _clamp = clamp(y, -128, room_height);
	
	////redefinindo o clamp
	//if (y <= -128)
	//{
	//	_clamp = clamp(y, 0, room_height);
	//}
	
	//levando o x pra posição certa (to trigger the vspeed increase)
	if (x != 144)
	{
		x = lerp(x, 144, .04);	
		//me certificando de que ele vai para o x exato que eu quero, independente do lerp
		if ((x > 143 and x < 144) or (x < 145 and x > 144))
		{
			x = 144;
		}
	}
	

	if (y != 432)
	{
		y = lerp(y, 432, .04);	
		if ((y > 431 && y < 432) or (y < 433 and y > 432))
		{
			y = 432;
		}
	}
}	
	
function controla_transicao_vitoria()
{
	//chamando a minha transição no momento certo
	//if (global.controle == false && x = 144 && y = 432)
	//{
	//	vspeed = -5;
	//}
	vspeed = -5;
}

//função para mudar a room após a transição
function nova_room()
{
	if (y <= -128)
	{
		//global.destino = rm_jogo2;
		layer_sequence_create("transicao", room_width / 2, room_height / 2, sq_transicao1);
		//global.controle = true;
	}	
}

//zerando a velocidade do player
function vel_zero()
{
	if (instance_exists(obj_player))
	{
		obj_player.vspeed = 0;	
	}
}


function finaliza_transicao()
{
	global.transicao = false;	
}


//criando a movimentação da primeira fase do boss
function inicia_movimento()
{
	vel_x = 1;
}


function inicia_movimento2()
{
	vel_x = 1;
	vel_y = 1;
}

function movimento()
{
	x += vel_x;

	if (x > room_width - (sprite_width / 2 - 10) or x < sprite_width / 2 - 10)
	{
		vel_x = -vel_x;
	}	
	
}


function movimento2()
{
	x += vel_x;

	if (x > room_width - (sprite_width / 2 - 10) or x < sprite_width / 2 - 10)
	{
		vel_x = -vel_x;
	}	
	
}





#endregion