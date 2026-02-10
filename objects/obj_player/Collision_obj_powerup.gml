instance_destroy(other);

level_tiro ++;

//timer_powerup = 0; não consegui corrigir o problema assim
meu_powerup++;

var _part = instance_create_layer(other.x, other.y, "particulas", obj_particula_tiro);
//alarm[0] = game_get_speed(gamespeed_fps) * powerup_time;

_part.image_angle = random(360);
_part.image_blend = choose(c_white, c_yellow, c_silver);