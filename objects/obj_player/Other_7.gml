// Quando a animação de ataque terminar, volte para o estado idle
if (sprite_state == "attacking") {
    sprite_state = "idle"; // Retorna ao estado idle
    sprite_index = spr_player_idle; // Define o sprite de idle
    image_speed = 1; // Restaura a velocidade padrão para o idle
}