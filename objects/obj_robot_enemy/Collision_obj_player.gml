// Evento de colisão com o ataque do jogador
if (obj_player.sprite_state == "attacking") {
    throwback_h = 16 * sign(x - obj_player.x);  
    stunned_timer = room_speed;  
    sprite_index = spr_robot_enemy_stunned;

    var new_x = x + throwback_h;
    if (!place_meeting(new_x, y, obj_chao)) { 
        x = new_x; 
    }

    velh = 0;
    speed = 0;
} else {
    velh = 0;
}
