// Se o projetil colidir com o chão, ele deve ser apagado
if (place_meeting(x, y + 1, obj_chao)) {
    instance_destroy();  // Apaga o projetil
}

// Verifica colisão com inimigos de água e apaga o projetil
if (instance_place(x, y, obj_water_enemy)) {
    instance_destroy();  // Apaga o projetil ao tocar inimigo de água
}

// Se atingir um inimigo robô, a fireball será rebatida em direção ao jogador
if (instance_place(x, y, obj_robot_enemy)) {
    var enemy = instance_place(x, y, obj_robot_enemy); // Pegando a instância do inimigo robô
    var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y); // Direção do projetil para o jogador
    direction = dir_to_player; // Atualiza a direção para rebatê-lo em direção ao jogador
    speed = 6; // Velocidade de movimento da fireball após ser rebatida
}

// Verificar colisão com obj_iceBlock
if (place_meeting(x, y, obj_iceBlock)) {
    // Encontrar o bloco de gelo à frente da fireball
    var ice_block = instance_place(x + 1, y, obj_iceBlock); // Encontrar o bloco de gelo à frente da fireball
    
    if (ice_block != undefined) {
        // Usando "with" para acessar e modificar o bloco de gelo
        with (ice_block) {
            // Incrementa a contagem de golpes no bloco de gelo
            hit_count += 1;

            // Se o bloco de gelo tiver sido atingido 5 vezes, destrua o bloco
            if (hit_count >= 5) {
                instance_destroy(); // Destrói o bloco de gelo
            }
        }
    }

    // Apagar a fireball ao atingir o bloco de gelo
    instance_destroy();
}




