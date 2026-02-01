

if (keyboard_check_pressed(vk_down))
{
	atual += 1;	
	margem = 0;
}

if (keyboard_check_pressed(vk_up))
{
	atual--;	
	margem = 0;
}

show_debug_message(atual);

atual = clamp(atual, 0, array_length(menu) - 1);


margem = lerp(margem, 40, .1);