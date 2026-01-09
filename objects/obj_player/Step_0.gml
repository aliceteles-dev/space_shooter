//ativando os controles do player utilizando este método
player_control();

//Mudando o valor do level do tiro
//Se apertar para cima, o level do tiro diminui
//Se apertar para baixo, o level do tiro aumenta
//
//Criar um debug do level do tiro no evento draw
//Desenhar o level na tela

//modular_tiro();

//modular_tiro()
level_tiro = clamp(level_tiro, 1, 4);

//ativando e desativando o debug
if(keyboard_check(vk_tab))
{
	global.debug = !global.debug;
}

//debug pra fazer ele perder vida utilizando um método
if (keyboard_check_pressed(vk_enter))
{
	loose_life();	
}

//chamando o método que permite controlar o escudo
ativa_defesa();

//fazendo o escudo seguir o player
if (instance_exists(meu_escudo))
{
	obj_escudo.x = x;
	obj_escudo.y = y;	
}

show_debug_message(timer_inv)