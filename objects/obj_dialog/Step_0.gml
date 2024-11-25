if(keyboard_check_pressed(input.dialogActivate)){
	index++;
	index_letra =1;
	if (index >= array_length(texto)){
		instance_destroy();	
	}
}