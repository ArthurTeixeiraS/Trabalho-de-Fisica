
if (!variable_instance_exists(self, "attack_lock_time")) {
    attack_lock_time = 0;
}


if (!variable_instance_exists(self, "fall_start_y")) {
    fall_start_y = 0;
}
if (!variable_instance_exists(self, "fall_attack_enabled")) {
    fall_attack_enabled = false;
}


var _chao = place_meeting(x, y+1, obj_chao); 

var _left, _right, _jump;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);


if (attack_lock_time > 0) {
    attack_lock_time--;
}

if (attack_lock_time <= 0) {
    velh = (_right - _left) * vel;
} else {
    velh = 0; 
}


if (keyboard_check_pressed(ord("K"))) {
    energia_tipo = (energia_tipo + 1) % array_length(energia_simbolos);
}

if (cooldown_cinetica > 0) {
    cooldown_cinetica--;
}

if (energia_tipo == 1 && keyboard_check_pressed(ord("L")) && _chao && cooldown_cinetica <= 0) {
    velv = -1.5 * vel_jump; 
    cooldown_cinetica = room_speed * 5; 
    _chao = false; 
}

if (energia_tipo == 0 && keyboard_check_pressed(ord("L"))) {
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
		
        var frozen_enemy = instance_place(x + image_xscale * atk_range, y, obj_water_enemy);
        if (frozen_enemy != noone) {
            if (frozen_enemy.is_frozen) {
                with (frozen_enemy) {
                    instance_destroy(); 
                }
            }
        }
    }
}

if (energia_tipo == 2) { 
    if (!place_meeting(x, y + 1, obj_chao)) {
        if (!fall_attack_enabled) {
            fall_start_y = y; 
            fall_attack_enabled = true;
			sprite_index = spr_player_cinetica; 
        }
    } else if (fall_attack_enabled) {
        var fall_distance = abs(fall_start_y - y); 
		
        if (fall_distance > 32) { 
            var enemy_hit = instance_place(x, y + 1, obj_enemy); 

            if (enemy_hit != noone) { 
                instance_destroy(enemy_hit); 
                velv = -2; 
            }
        }

        fall_attack_enabled = false;
        sprite_index = sprite_idle; 
    }
}

if (energia_tipo == 2 && keyboard_check(ord("S"))) {
    invincible = true;
} else {
    invincible = false; 
}

if (energia_tipo == 3) { 
    if (keyboard_check_pressed(ord("L"))) {
        var fireball = instance_create_layer(x + (image_xscale * 16), y - 25, "Player", obj_fireBall);
        
        fireball.direction = image_xscale == 1 ? 0 : 180; 
        fireball.speed = 8; 

        fireball.image_xscale = image_xscale;
    }
}

if (energia_tipo == 4) {
	if (keyboard_check_pressed(ord("L"))) {
		var iceball = instance_create_layer(x + (image_xscale * 16), y - 35, "Player", obj_iceBall);
		
		iceball.direction = image_xscale == 1 ? 0 : 180; 
        iceball.speed = 4; 

        iceball.image_xscale = image_xscale;
	}
}

if (energia_tipo == 5) {
    if (keyboard_check_pressed(ord("L"))) {
        if (!instance_exists(shockBallInstance)) {
            shockBallInstance = instance_create_layer(x + (image_xscale * 16), y - 35, "Player", obj_shockBall);
            shockBallInstance.image_xscale = image_xscale;
        } else {
            with (shockBallInstance) {
                instance_destroy();
            }
            shockBallInstance = undefined;
        }
    }

    if (instance_exists(shockBallInstance)) {
        if (shockBallInstance.image_xscale != image_xscale) {
            with (shockBallInstance) {
                instance_destroy();
            }
            shockBallInstance = undefined;
        } else {
            shockBallInstance.x = x + (image_xscale * 16);
            shockBallInstance.y = y - 35;
        }
    }
}



if (place_meeting(x, y, obj_door)) {
    var door = instance_place(x, y, obj_door);
    if (door != noone && door.sprite_index == spr_door_opened) {
        if (keyboard_check_pressed(ord("W"))) {
            image_speed = 0.2;
            var transition = instance_create_layer(0, 0, "Player", obj_transition);
            with (transition) {
                transitioning = true;
            }
            velh = 0;
        }
    }
}





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

