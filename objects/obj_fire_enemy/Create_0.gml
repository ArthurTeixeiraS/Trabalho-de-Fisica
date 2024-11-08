/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

vel = choose(1, -1);

walking = choose(true, false);

if walking {
	velh = choose(vel, -vel)
} else {
	velh = 0;
}
walk_time = room_speed * 2;

