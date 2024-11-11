/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

vel = choose(1, -1);

walking = choose(true, false);

if walking {
    velh = choose(vel, -vel);
} else {
    velh = 0;
}
walk_time = room_speed * 2;

stunned_timer = 0;

throwback_h = 0;
throwback_v = 0;

// Função para alternar entre andar e ficar parado
function willWalk() {
    walk_time -= 1;
    if (walk_time <= 0) {
        walking = choose(true, false);
        if (walking) {
            velh = choose(vel, -vel);
        } else {
            velh = 0;
        }
        walk_time = room_speed * 2;
    }
}

//Controles de queda
sensor_dist = 10;
direcao = 1;
