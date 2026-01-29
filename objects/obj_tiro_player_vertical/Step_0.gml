 if (y <= -32 || y>= room_height + 32 || x <= -64 || x>= room_width + 64) 
 {
	 instance_destroy(self);
 }
 
 
//speed = 2;

#region //código pra dar um efeito no tamanho do tiro (não funciona, buga o image_scale do tiro 4)
//lerpvel = 0.1

//if (image_xscale < 0)
//{
//	image_xscale = lerp(image_xscale, -1, lerpvel);
//}
//else
//{
//	image_xscale = lerp(image_xscale, 1, lerpvel);
//}

//if (image_xscale < 0)
//{
//	image_yscale = lerp(image_yscale, -1, lerpvel);
//}
//else
//{
//	image_yscale = lerp(image_yscale, 1, lerpvel);
//}

//event_perform()
#endregion



//if (image_xscale == 1)
//{
//	hspeed = 1;
//}
//else if (image_xscale = -1)
//{
//	hspeed = -1;
//}


if (image_yscale == 1)
{
	vspeed = lerp(vspeed, -10, lerpvalue)

}
else
{
	vspeed = lerp(vspeed, 10, lerpvalue)

}





//show_debug_message(vspeed);