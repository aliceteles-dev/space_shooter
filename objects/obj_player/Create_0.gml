#region Variables

//vidas
vida = 5

//escudo
escudo = 5

//escudo "ativo"
meu_escudo = noone;

//Defining a variable for the player's speed:
vel = 2;

//Variable for the delay time between shots
time_between_shots = 10;

//Timer that will keep track of said delay:
shot_timer = 0;

//Shot level
level_tiro = 1;

powerup_time = 5;

//invencibilidade
tempo_inv = game_get_speed(gamespeed_fps);
timer_inv = 2;

#endregion



#region Methods

//Creating a function for the player to move 
player_control = function()
{
	timer_inv --;
	
	//Checking for the keys:
	var _up, _down, _l, _r, _shoot

	_up = keyboard_check(ord("W")) ///|| keyboard_check(vk_up);
	//debugging up key:
	//if(_up)
	//show_debug_message("Para cima!");
	
	
	_down = keyboard_check(ord("S"))// or keyboard_check(vk_down);
	//debugging down key:
	//if(_down)
	//show_debug_message("Para trás!");

	_l = keyboard_check(ord("A")) || keyboard_check(vk_left);
	//debugging left key:
	//if (_l == true)
	//{
	//	show_debug_message("Para a esquerda!")
	//}
	
	_r = keyboard_check(ord("D")) || keyboard_check(vk_right);
	//debugginh right key:
	//if(_r) show_debug_message("Para a direita!")
	
//	_shoot = keyboard_check(vk_space) or mouse_check_button(mb_left);
	//debugging shot key:
	//if(_shoot) show_debug_message("BANG! POW! ZIM!");
	
	//Coding the actual movement
	//if (_l)
	//{
	//	x -= vel;
	//}
	
	//if(_r)
	//{
	//	x += vel;
	//}
	
	//if(_down)
	//{
	//	y += vel
	//}
	
	//if(_up)
	//{
	//	y -= vel;
	//}
	
	//I commented the previous lines because I just learned a way better way to do it:
	
	//Horizontal movement:
	var _velh = (_r - _l) * vel;
	x += _velh;
	//Viva a Matemágica! <3
	
	//Keeping the player inside the room
	x = clamp(x, sprite_width/2, room_width - sprite_width/2)

	//Vertical movement:
	var _vely = (_down - _up) * vel;
	y += _vely;
	
	//Keeping the player inside the room:
	
	y = clamp(y, sprite_height/2, room_height - sprite_height/2);
	
	//Diminishing the shot timer count
	shot_timer--;
	
	//Shooting
	_shoot = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
	if (_shoot && shot_timer <= 0) 
	{
		shot_timer = time_between_shots;
		//audio_play_sound(som_tiro, 5, 0);
		
		if(level_tiro == 1)
			{
				tiro_1();	
			}

		else if(level_tiro == 2)
			{
			tiro_2();	
			}
		else if (level_tiro == 3)
		{
			tiro_1();
			tiro_2();
		}
		else if (level_tiro == 4)
		{
			tiro_4()	
		}
		
	}

	
//	show_debug_message(y);
//	show_debug_message(shot_timer);
	
}


draw_icon = function(_icone = spr_vida, _qtd = vida, _yposition = display_get_gui_height() - 20, _xposition = 20)
{
	var _gui_height = display_get_gui_height();
	//var _xposition = h;
	
	
	repeat(_qtd)
	{
		draw_sprite_ext(_icone, 0,_xposition, _yposition, 1, 1, 0, c_white, .5)
		_xposition += 20;
	}
}

tiro_1 = function()
{
	var _bullet = instance_create_layer(x, y, "tiro", obj_tiro_player_vertical);
	//_bullet.vspeed = -10;
	//show_debug_message(_bullet.vspeed);
}
	
tiro_2 = function()
{
	var _bullet = instance_create_layer(x - 10, y, "tiro", obj_tiro_player_vertical);
	//_bullet.vspeed = -10;
	var _bullet = instance_create_layer(x + 10, y, "tiro", obj_tiro_player_vertical);
	//_bullet.vspeed = -10;

}

tiro_3 = function()
{
	tiro_1();
	tiro_2();
}

tiro_4 = function()
{
	tiro_1(); //obj_tiro_player_vertical
	
	var _bullet = instance_create_layer(x, y + 10, "tiro", obj_tiro_player_vertical);
	//_bullet.vspeed = 10;
	_bullet.image_yscale = -1;
	
	var _bullet = instance_create_layer(x, y, "tiro", obj_tiro_player_horizontal);
	//_bullet.hspeed = 10
	_bullet.image_angle = 270;
	_bullet.image_xscale = -1;

	
	var _bullet = instance_create_layer(x, y, "tiro", obj_tiro_player_horizontal);
	//_bullet.hspeed = -10;
	_bullet.image_angle = 90;
	
	var _bullet = instance_create_layer(x, y, "tiro", obj_tiro_player_diagonal); //finalmente está correto também
	//_bullet.hspeed = -5;
	//_bullet.vspeed = -5;
	_bullet.image_angle = 45;
	_bullet.direction = 135;
	//_bullet.image_yscale = 3;
	
	var _bullet = instance_create_layer(x, y, "tiro", obj_tiro_player_diagonal); //segundo correto 
	//_bullet.hspeed = 5;
	//_bullet.vspeed = 5;
	_bullet.direction = 315;
	_bullet.image_angle = 45;
	_bullet.image_xscale = -1;
	_bullet.image_yscale = -1;
		
	
	var _bullet = instance_create_layer(x, y, "tiro", obj_tiro_player_diagonal); //YAAAAAAAAAY!
	//_bullet.hspeed = 5;
	//_bullet.vspeed = -5;
	_bullet.direction = 45;
	_bullet.image_angle = 315;
	_bullet.image_xscale = -1;
	
	
	var _bullet = instance_create_layer(x, y, "tiro", obj_tiro_player_diagonal); //correto, só falta 1
	//_bullet.hspeed = -5;
	//_bullet.vspeed = 5;
	_bullet.direction = 225;
	_bullet.image_angle = 315;
	_bullet.image_yscale = -1;
	
	
}

loose_life = function()
{
	if timer_inv > 0 return;
	
	if (vida > 1)
	{
		vida--;	
		timer_inv = tempo_inv;
		screenshake(20);
	}
	else
	{
		destroyed(obj_mob_explosion);
		instance_destroy(obj_escudo);
		screenshake(50);
	}
}

ativa_defesa = function()
{
	if(escudo > 0 && keyboard_check_pressed(ord("E")) && meu_escudo == noone)
	{
		escudo--;	
		meu_escudo = instance_create_layer(x, y, "escudo", obj_escudo);
		meu_escudo.x = x;
		meu_escudo.y = y;
		timer_inv = game_get_speed(gamespeed_fps) * 4;
	}
}

//end_powerup = function() 
//{
//	tiro_1()
//}

//just found out a different way of declaring methods on gml which also works
//function modular_tiro()
//{
//	var _mais = keyboard_check_pressed(vk_down);
//	var _menos = keyboard_check_pressed(vk_up);


//	if (_mais)
//	{
//		level_tiro += 1;	
//	}

//	if(_menos)
//	{
//		level_tiro -= 1;	
//	}
//}






//layer_destroy_instances()









#endregion