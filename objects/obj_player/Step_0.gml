// Variáveis de controle
if (!variable_instance_exists(self, "attack_lock_time")) {
    attack_lock_time = 0;
}

// Variáveis de controle de altura para o ataque cinético
if (!variable_instance_exists(self, "fall_start_y")) {
    fall_start_y = 0;
}
if (!variable_instance_exists(self, "fall_attack_enabled")) {
    fall_attack_enabled = false;
}

// Controles
var _chao = place_meeting(x, y+1, obj_chao); // Verifica se o jogador está no chão

var _left, _right, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

// Se o ataque está bloqueado, reduz o temporizador
if (attack_lock_time > 0) {
    attack_lock_time--;
}

if (attack_lock_time <= 0) {
    velh = (_right - _left) * vel;
} else {
    velh = 0; // Bloqueia movimento horizontal durante o ataque
}

// Alterna o tipo de energia ao pressionar 'K'
if (keyboard_check_pressed(ord("K"))) {
    energia_tipo = (energia_tipo + 1) % array_length(energia_simbolos);
    show_debug_message("Tipo de energia atual: " + string(energia_tipo));
}

// Cooldown para o super salto (energia cinética)
if (cooldown_cinetica > 0) {
    cooldown_cinetica--;
}

// Super salto com energia cinética (energia_tipo == 1)
if (energia_tipo == 1 && keyboard_check_pressed(ord("J")) && _chao && cooldown_cinetica <= 0) {
    velv = -1.5 * vel_jump; // Aplica o dobro da força do pulo normal
    cooldown_cinetica = room_speed * 5; // Define o cooldown para o super pulo
    _chao = false; // Garante que o personagem não se detecte no chão logo após o super pulo
    show_debug_message("Super salto ativado!");
}

// Lógica do ataque Melee (para energia_tipo == 0)
if (energia_tipo == 0 && keyboard_check_pressed(ord("J"))) {
    if (sprite_state == "attacking" && (_left || _right)) {
        sprite_state = "running";
        sprite_index = sprite_run;
        image_speed = 2;
        attack_lock_time = 0;
        velh = (_right - _left) * vel;
        return;
    }

    if (_chao && sprite_state != "attacking" && !(_left || _right || _jump)) {
        sprite_state = "attacking";
        sprite_index = sprite_attack;
        image_index = 0;
        attack_timer = 7;
		image_speed = 2;

        audio_play_sound(a_meleeAtk, 1, false);
        attack_lock_time = 10;
    }
}

if (energia_tipo == 2) {  // Energia Cinética (Ataque de Queda)
    if (!place_meeting(x, y + 1, obj_chao)) {
        // Início da queda
        if (!fall_attack_enabled) {
            fall_start_y = y; // Marca o ponto de início da queda
            fall_attack_enabled = true;
			sprite_index = spr_player_cinetica; // Troca para o sprite cinético
        }
    } else if (fall_attack_enabled) {
        // Jogador atingiu o chão (fim da queda)
        var fall_distance = abs(fall_start_y - y); // Calcula a altura da queda
		
        if (fall_distance > 32) { // Verifica se a queda foi grande o suficiente
            // Verifica se há um inimigo diretamente abaixo do jogador
            var enemy_hit = instance_place(x, y + 1, obj_enemy); // Encontra a instância específica do inimigo

            if (enemy_hit != noone) { // Se um inimigo foi atingido
                instance_destroy(enemy_hit); // Destroi a instância do inimigo
                velv = -2; // Dá um pequeno salto após o impacto
            }
        }

        // Restaura o estado para idle ou running após o ataque
        fall_attack_enabled = false;
        sprite_index = sprite_idle; // Volta ao sprite idle ou running
    }
}

// Invencibilidade temporária ao pressionar 'S' durante a queda com energia tipo 2
if (energia_tipo == 2 && keyboard_check(ord("S"))) {
    invincible = true; // Torna o jogador invencível enquanto segura 'S'
} else {
    invincible = false; // Desativa invencibilidade se 'S' não estiver pressionado
}

if (energia_tipo == 3) {  // Energia Térmica Positiva (Calor)
    if (keyboard_check_pressed(ord("J"))) {
        // Criação do projetil `obj_fireBall`
        var fireball = instance_create_layer(x + (image_xscale * 16), y - 25, "Player", obj_fireBall);
        
        // Define a direção e a velocidade do projetil com base no olhar do jogador
        fireball.direction = image_xscale == 1 ? 0 : 180; // Para direita (0) ou esquerda (180)
        fireball.speed = 8; // Velocidade do projetil
        
        // Ajusta o image_xscale da fireball para a direção do jogador
        fireball.image_xscale = image_xscale; // A fireball segue a direção do jogador
    }
}




// Atualiza o estado de movimento normal (quando não está atacando)
if (sprite_state != "attacking") {
    if (_chao) {
        velv = 0;

        if (_jump) {
            velv = -vel_jump;
            sprite_state = "jumping";
            sprite_index = sprite_jump;
        } else if (velh != 0) {
            sprite_state = "running";
            sprite_index = sprite_run;
            image_xscale = sign(velh);
        } else {
            sprite_state = "idle";
            sprite_index = sprite_idle;
        }
    } else {
        velv += gravidade;

        if (velh != 0) {
            image_xscale = sign(velh);
        }

        if (sprite_state != "jumping") {
            sprite_state = "jumping";
            sprite_index = sprite_jump;
        }
    }

    if (_chao && velv >= 0) {
        velv = 0;
    }
}
