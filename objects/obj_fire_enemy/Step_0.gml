event_inherited();

// Verifica se está no chão
var _chao = place_meeting(x, y + 1, obj_chao);

if (_chao) {
    velv = 0;

    if (stunned_timer > 0) {
        sprite_index = spr_fire_enemy_stunned;
        stunned_timer -= 1;
        velh = 0;
    } else {
        // Controle de movimento
        willWalk();

        // Ajusta a direção de movimento e o sprite de caminhada
        if (velh != 0) {
            sprite_index = spr_fire_enemy_walk;
            image_xscale = sign(velh);
        } else {
            sprite_index = spr_fire_enemy_idle;
        }

        // Verifica se há uma borda na plataforma à frente
        if (!place_meeting(x + 4 * sign(velh), y + 1, obj_chao)) {
            velh *= -1;  // Inverte a direção ao detectar a borda
        }

        // Impede que o inimigo continue andando se houver uma parede à frente
        if (place_meeting(x + velh, y, obj_chao)) {
            velh *= -1;
        }
    }
} else {
    // Aplica gravidade quando o inimigo está no ar
    velv += gravidade;

    // Aplica a repulsão (throwback)
    if (throwback_h != 0 || throwback_v != 0) {
        x += throwback_h;
        y += throwback_v;
        
        throwback_h *= 0.9; // Diminui a velocidade horizontal
        throwback_v += gravidade; // Adiciona gravidade ao efeito vertical
    }
    
    if velh != 0 {
        image_xscale = sign(velh);
    }
}



