//estabelecendo variáveis temporárias 
var _gui_height = display_get_gui_height();
var _gui_width = display_get_gui_width();

//debug de level do tiro
if (global.debug)
{
	draw_text(20, 20, "Level do tiro:" + string(level_tiro));	
	draw_text(20, 35, "Quantidade de escudos:" + string(escudo));
	draw_text(_gui_width/2, _gui_height/2, "Vidas: " +string(vida));
}


//desenhando os ícones de escudo e vida do player
draw_icon(spr_escudo, escudo, ,_gui_width - 100);
draw_icon();

