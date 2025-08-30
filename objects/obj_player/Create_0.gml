#region Variables

//Defining a variable for the player's speed:
vel = 2;

//Variable for the delay time between shots
time_between_shots = 10;

//Timer that will keep track of said delay:
shot_timer = 0;



#endregion



#region Methods

//Creating a function for the player to move
player_control = function()
{
	//Checking for the keys:
	var _up, _down, _l, _r, _shoot

	_up = keyboard_check(ord("W")) || keyboard_check(vk_up);
	//debugging up key:
	//if(_up)
	//show_debug_message("Para cima!");
	
	
	_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
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
	
	_shoot = keyboard_check(vk_space) or mouse_check_button(mb_left);
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
	if(_shoot == true && shot_timer <= 0)
	{
		shot_timer = time_between_shots;
		var _bullet = instance_create_layer(x, y, "tiro", obj_tiro);
		_bullet.vspeed = -10;
		audio_play_sound(som_tiro, 5, false);
		
		//if(_bullet.y <= 0)
		//{
		//	instance_destroy(self);
		//}
	}
	

	//if (
	
	show_debug_message(y);
//	show_debug_message(shot_timer);
	
}

#endregion