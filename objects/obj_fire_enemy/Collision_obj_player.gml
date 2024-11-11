// Evento de colisão com o ataque do jogador
if (obj_player.sprite_state == "attacking") {
    // Repulsão horizontal
    throwback_h = 16 * sign(x - obj_player.x);  

    stunned_timer = room_speed;  

    var new_x = x + throwback_h;
    if (!place_meeting(new_x, y, obj_chao) && !place_meeting(new_x, y, obj_chao)) { 
        x = new_x; 
    }

    velh = 0;
    speed = 0;
} else {
	velh = 0;
	sprite_index = spr_fire_enemy_attack;
}
