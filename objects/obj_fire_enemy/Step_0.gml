/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _chao = place_meeting(x, y+1, obj_chao)

if(_chao) {
	if walking {
		velh = vel;
	}
	
	if velh != 0 {
		sprite_index = spr_fire_enemy_walk;
		image_xscale = sign(velh)
	} else {
		sprite_index = spr_fire_enemy_idle;
	}
} else {
	velv += gravidade;
	velh = 0;
	if velh != 0 {
		image_xscale = sign(velh)
	}
}