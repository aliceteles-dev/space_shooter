audio_stop_all();

audio_play_sound(som_fullon, 5, true, , 1.8);
if (global.transicao)
{
	layer_sequence_create("transicao", room_width / 2, room_height / 2, sq_transicao2);
}