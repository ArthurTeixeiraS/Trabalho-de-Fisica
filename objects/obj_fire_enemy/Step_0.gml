/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _chao = place_meeting(x, y+1, obj_chao)

if(_chao) {
	
	walk_time -= 1;
	
	if walk_time <= 0 {
		walking = choose(true, false)
		if walking {
			velh = choose(vel, -vel)
		} else {
			velh = 0;
		}
		walk_time = room_speed * 2;
	}
	
	if velh != 0 {
		sprite_index = spr_fire_enemy_walk;
		image_xscale = sign(velh)
	} else {
		sprite_index = spr_fire_enemy_idle;
	}
	
	if (place_meeting(x + velh, y, obj_chao)) {
		velh *= -1;
	}
	
	if can_fall == false {
		if (place_meeting(x+(velh * 10), y+1, obj_chao) == false){
			velh *= -1;	
		}
	}
	
} else {
	velv += gravidade;
	velh = 0;
	if velh != 0 {
		image_xscale = sign(velh)
	}
} 

if (dano) {
	sprite_index = spr_fire_enemy_damege
}

