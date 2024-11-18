if (place_meeting(x, y, obj_enemy) && !invincible) {
    var enemy = instance_place(x, y, obj_enemy);
    
    if (enemy != noone && !enemy.is_frozen) {
        audio_play_sound(a_damage, 2, false);
        lives -= 1; 
        sprite_index = sprite_damaged; 
        invincible = true; 
        invincible_timer = 60;

        if (lives <= 0) {
            show_message("Game Over");
            room_restart();
        }
    }
}
