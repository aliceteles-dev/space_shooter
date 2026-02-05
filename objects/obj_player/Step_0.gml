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
if(keyboard_check_pressed(vk_tab))
{
	global.debug = !global.debug;
}


//debug do level do tiro
if (global.debug && keyboard_check_pressed(vk_up))
{
	level_tiro += 1;	
}
else if (global.debug && keyboard_check_pressed(vk_down))
{
	level_tiro -= 1;
}

//debug pra fazer ele perder vida utilizando um método
if (global.debug and keyboard_check_pressed(vk_enter))
{
	loose_life();	
}
//debug para reiniciar o level
if (global.debug && keyboard_check_pressed(vk_backspace))
{
	room_restart();
}


//chamando o método que permite controlar o escudo
ativa_defesa();

//fazendo o escudo seguir o player
if (instance_exists(meu_escudo))
{
	obj_escudo.x = x;
	obj_escudo.y = y;	
}


//efeito stretch and squash
xscale = lerp(xscale, 1, .4);
yscale = lerp(yscale, 1, .4);


//pra terminar o efeito do dano
contador_eb();


//chamando a transição de vitória
//if (global.controle == true)
//{
//	timer_final++
//}




//if (timer_final >= global.acabou)
//{
//	ativa_transicao_vitoria();

//}


//if (!global.controle)
//{
//	//timer_final = 0;
//	transicao_vitoria();

//}

//if (global.controle == false and x == 144 && y == 432)
//{
//	controla_transicao_vitoria();
//}



//nova_room();
//controla_transicao_vitoria()

//show_debug_message(timer_final);
//show_debug_message(y);
//show_debug_message(estado);


if (room == rm_tutorial)
{
	estado = "jogando";	
}
else
{
	maquina_estado();
}