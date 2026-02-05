//criando as ondas

//var _index = choose(sq_mobwave3b, sq_mobwave1, sq_mobwave2, sq_mobwave3, sq_mobwave4, sq_mobwave4b, sq_mobwave5);

layer_sequence_create("sq_mobwaves", 144, 256, waves[index]);




//index = clamp(index, 0, 7)
if (index < array_length(waves) - 1)
{
	index += 1;
	alarm[0] = 340;
	
}