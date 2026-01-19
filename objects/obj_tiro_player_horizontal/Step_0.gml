 if (x <= -64 || x>= room_width + 64) 
 {
	 instance_destroy(self);
 }
 

 
 
 if (image_xscale == 1)
{
	hspeed = lerp(hspeed, -10, lerpvalue)

}
else
{
	hspeed = lerp(hspeed, 10, lerpvalue)

}


 
// show_debug_message(hspeed);