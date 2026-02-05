//estabelecendo variáveis temporárias 
var _gui_height = display_get_gui_height();
var _gui_width = display_get_gui_width();

//debug de level do tiro
if (global.debug)
{
	draw_text(10, 5, "Level do tiro:" + string(level_tiro));	
	draw_text(10, 25, "Quantidade de escudos:" + string(escudo));
	draw_text(10, 45, "Vidas: " +string(vida));
}


//desenhando os ícones de escudo e vida do player
draw_icon(spr_icone_escudo, escudo, _gui_height - 45);
draw_icon();

draw_text(x, y, estado);
