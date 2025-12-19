player_control();

//Mudando o valor do level do tiro
//Se apertar para cima, o level do tiro diminui
//Se apertar para baixo, o level do tiro aumenta
//
//Criar um debug do level do tiro no evento draw
//Desenhar o level na tela

//modular_tiro();

show_debug_message(alarm[0]);
//modular_tiro()
level_tiro = clamp(level_tiro, 1, 3);

if(keyboard_check(vk_tab))
{
	global.debug = !global.debug;
}

if (keyboard_check_pressed(vk_enter))
{
	loose_life();	
}

ativa_defesa();