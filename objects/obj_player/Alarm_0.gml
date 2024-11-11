// Quando o alarme 0 disparar, aplica o dano
if (place_meeting(x, y, obj_enemy) && !invincible) {
	audio_play_sound(a_damage, 1, false)
    lives -= 1; 
    invincible = true; 
    invincible_timer = 60; 
    sprite_index = sprite_damaged; 
	
	// Verifica se o jogador perdeu todas as vidas
	if (lives <= 0) {
	    show_message("Game Over");
	    room_restart();
	}
}