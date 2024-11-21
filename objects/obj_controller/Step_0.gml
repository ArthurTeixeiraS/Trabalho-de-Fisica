if (!instance_exists(obj_enemy)) {
    show_debug_message("Todos os inimigos foram derrotados.");
    var door_instance = instance_find(obj_door, 0);
    if (door_instance != noone && door_instance.visible == false) {

        door_instance.visible = true;
		audio_play_sound(a_doorAppears, 1, false)
    }
}
