if (distance_to_object(obj_player) <= 15){
	if(keyboard_check_pressed(ord("W"))){
		var dialog = instance_create_layer(0,0, "Player", obj_dialog)
		for(var i = 0; i < array_length(texto); i++){
			array_push(dialog.texto, texto[i]);
		}
	}
}

