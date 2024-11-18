// Variáveis de movimentação e ataque do jogador
velh        = 0;
velv        = 0;
vel         = 2;
gravidade   = 0.3;
vel_jump    = 7;


energia_tipo = 0; // 0: Melee (nenhuma), 1: Cinética, 2: Gravitacional, 3: Térmica Positiva, 4: Térmica Negativa, 5: Elétrica
energia_simbolos = [spr_melee, spr_cinetica, spr_gravitacional, spr_termica_pos, spr_termica_neg, spr_eletrica];
cooldown_cinetica = 5;
shockBallInstance = undefined;

obj_door.visible = false;


fall_start_y = 0;           
fall_attack_enabled = false;

atk_range   = 30; 
atk_cooldown = 15; 
atk_damage  = 1;

inputs = {
    left: ord("A"),
    right: ord("D"),
    jump: vk_space
};


attack_lock_time = 0; 


lives = 4; 
invincible = false; 
invincible_time = 120; 
invincible_timer = 0;

contact_timer = 0; 
contact_threshold = 90;
is_damaged = false;

alarm[0] = 90;


sprite_idle    = spr_player_idle;
sprite_jump    = spr_player_jump;
sprite_damaged = spr_player_damaged;
sprite_run     = spr_player_run;
sprite_attack  = spr_player_attack;
sprite_state   = "idle";

energia_gravitacional_ativa = false;  

function go_to_next_room() {
    if (room_next(room) != -1) {
        room_goto_next();
    } else {
        show_message("Fim de Jogo! Parabéns!");
        game_restart();
    }
}