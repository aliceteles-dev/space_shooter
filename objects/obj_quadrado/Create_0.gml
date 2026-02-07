//inicia_movimento();

tempo = game_get_speed(gamespeed_fps) * 0.5;
timer = 0;

tiro_solo = function()
{
	
	timer++;
	
	if (timer >= tempo)
	{
		instance_create_layer(x, y, "tiro", obj_tiro_mob2);	
		timer = 0;
	}
}



//speed = 2;
//direction = 270;
//definindo velocidade
//velx = 2;
//vely = 2;

////definindo a variavel para swtichar
//posicao = "emcima" // descendo, embaixo, subindo

//muda_posicao = function()
//{
//	switch(posicao)
//	{

//		case "emcima":
	
//			x += velx;
		
//			if (x >= room_width - sprite_width / 2)// or x <= sprite_width / 2)
//			{
//				velx = -velx;
//				posicao = "descendo"
//			}
//		break;
		
//		case "descendo":
			
//			y += 1;
//			x += velx;
			
//			if (x <= sprite_width / 2)
//			{
//				velx = -velx
//				posicao = "embaixo"
//			}
//		break;
		
//		case "embaixo":
			
//			x += velx;
			
//			if (x >= room_width - sprite_width / 2)
//			{
//				velx = -velx;
//				posicao = "subindo";
//			}
//		break;
		
//		case "subindo":
//		{
//			y -= 1;
//			x += velx;
			
//			if (x <= sprite_width / 2)
//			{
//				velx = -velx;
//				posicao = "emcima";
//			}
//		}
		
//	}
//}







