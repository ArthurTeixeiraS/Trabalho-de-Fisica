draw_set_font(ft_menu)
draw_set_color(c_white)

var dist =55;

var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_width();
var x1 = gui_largura/2;
var y1 = gui_altura/4;

draw_set_halign(fa_center)
draw_set_valign(fa_center)
var title = "The Energy Quest";
draw_text(x1, y1 + (dist * -1), title)

for(var i=0; i < op_max; i++){
	if index == i {
		draw_set_color(c_yellow)
	} else {
		draw_set_color(c_white)
	}
	
	
 	draw_text(x1, y1 + (dist*i), opcoes[i])
}

draw_set_font(-1);