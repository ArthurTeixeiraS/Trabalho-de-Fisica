event_inherited();

var _chao = place_meeting(x, y + 1, obj_chao);

if (is_frozen) {
    velh = 0;

    frozen_timer--;

    if (frozen_timer <= 0) {
        is_frozen = false;
        sprite_index = spr_water_enemy_idle; 
    }
} else {
	if (_chao) {
    velv = 0;

    if (stunned_timer > 0) {
        sprite_index = spr_water_enemy_stunned;
        stunned_timer -= 1;
        velh = 0;
    } else {
        willWalk();

        if (velh != 0) {
            sprite_index = spr_water_enemy_walk;
            image_xscale = sign(velh);
        } else {
            sprite_index = spr_water_enemy_idle;
        }

        if (!place_meeting(x + 4 * sign(velh), y + 1, obj_chao)) {
            velh *= -1; 
        }

        if (place_meeting(x + velh, y, obj_chao)) {
            velh *= -1;
        }
    }
} else {
    velv += gravidade;

    if (throwback_h != 0 || throwback_v != 0) {
        x += throwback_h;
        y += throwback_v;
        
        throwback_h *= 0.9; 
        throwback_v += gravidade;
    }
    
    if velh != 0 {
        image_xscale = sign(velh);
    }
 }   
}

