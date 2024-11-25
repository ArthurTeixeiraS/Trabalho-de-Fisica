var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var xx = 0;
var yy = gui_height - 200;

draw_set_color(c_black)
draw_rectangle(xx, yy-700, gui_width, yy-450, 0)


draw_set_font(ft_menu)
draw_set_color(c_white);

var textoAtual = string_copy(texto [index], 1, index_letra)

if (index_letra < string_width(texto[index])){
	index_letra = index_letra + 0.5;
}
draw_set_halign(fa_center)
draw_text((gui_width/2), yy-500, textoAtual);
draw_set_halign(-1)