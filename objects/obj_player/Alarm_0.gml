// Quando o alarme 0 disparar, aplica o dano se encontrar um inimigo e o jogador não estiver invencível
if (place_meeting(x, y, obj_enemy) && !invincible) {
    // Identifica o inimigo na posição de colisão
    var enemy = instance_place(x, y, obj_enemy);
    
    // Verifica se o inimigo não está congelado antes de aplicar o dano
    if (enemy != noone && !enemy.is_frozen) {
        audio_play_sound(a_damage, 1, false);
        lives -= 1; 
        sprite_index = sprite_damaged; 
        invincible = true; 
        invincible_timer = 60;

        // Verifica se o jogador perdeu todas as vidas
        if (lives <= 0) {
            show_message("Game Over");
            room_restart();
        }
    }
}
