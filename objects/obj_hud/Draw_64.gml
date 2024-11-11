// Desenha as vidas restantes ao lado
var vida_x = 20; // Posição inicial para desenhar as vidas
var vida_y = 660; // Alinhado com a imagem do personagem

// Desenha o número de vidas restantes
for (var i = 0; i < lives; i++) {
    // Ajusta a posição horizontal (vida_x) para cada ícone de vida
    draw_sprite(spr_life, 1, vida_x + (i * 30), vida_y); // 30 é o espaço entre os ícones
}

// Verifica se a variável obj_player e energia_tipo estão definidas
if (instance_exists(obj_player)) {
    var energia_tipo = obj_player.energia_tipo;

    // Desenha o símbolo da energia ativa na HUD
    if (energia_tipo >= 0 && energia_tipo < array_length(energia_simbolos)) {
        draw_sprite(energia_simbolos[energia_tipo], 0, energia_x, energia_y);
    }
}
