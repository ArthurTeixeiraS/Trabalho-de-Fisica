// Evento de colisão com o ataque do jogador
if (obj_player.sprite_state == "attacking") {
    // Repulsão horizontal
    throwback_h = 16 * sign(x - obj_player.x);  

    stunned_timer = room_speed;  
	sprite_index = spr_water_enemy_stunned;
    var new_x = x + throwback_h;
    if (!place_meeting(new_x, y, obj_chao) && !place_meeting(new_x, y, obj_chao)) { 
        x = new_x; 
    }

    velh = 0;
    speed = 0;
} else {
	if (is_frozen) {
	    velh = 0;

	    frozen_timer--;

	    if (frozen_timer <= 0) {
	        is_frozen = false;
	        sprite_index = spr_water_enemy_idle; 
	    }
	} else {
		velh = 0
		sprite_index = spr_water_enemy_attack;  
}
}
