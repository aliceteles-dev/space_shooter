
var _altura = display_get_gui_height() / 2.25;


//alinhando
draw_set_valign(fa_middle); //fa_middle = 1

//escolhendo a fonte 
draw_set_font(fnt_menu);

//espaçamento entre linhas
var _height = string_height("D");

	
//introdução ao laço de repetição for
//usa um índice, uma condição de repetição e uma ação
//documentação: 
/*
for (<assignment>; <expression>; <operation>;)
{
    <statement>;
    <statement>;
    ...
}
*/

for (var i = 0; i < array_length(menu); i++)
{
	//variáveis para destacar o texto selecionado
	var _cor = c_white
	var _margem = 0;
	
	//destacando o texto selecionado
	if (atual == i)
	{
		_cor = c_red;
		_margem = margem;
	}
	
	draw_set_color(_cor);
	draw_text(20 + _margem, _altura + i * _height, menu[i]);
	//reset
	draw_set_color(-1);

}




//resetando o alinhamento e a fonte
draw_set_valign(0);
draw_set_font(-1);