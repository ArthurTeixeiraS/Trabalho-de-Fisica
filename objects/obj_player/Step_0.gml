/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Controles
var _chao = place_meeting(x, y+1, obj_chao);

var _left, _right, _jump, _attack;
_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);
_attack = keyboard_check(inputs.attack);

velh = (_right - _left) * vel;

if (_chao){
	
	if (_jump){
		velv = -vel_jump;
	}
	
	if (velh != 0){
		sprite_index = spr_player_run;
		image_xscale = sign(velh)
	} else {
		sprite_index = spr_player_idle;
	}
	
} else {
	velv += gravidade;
	if (velh != 0){
		image_xscale = sign(velh)
	} else {
		sprite_index = spr_player_jump;
	}
	
}

if(isDamaged){
	sprite_index = spr_player_damaged;
} else {
	sprite_index = spr_player_idle;
}

if life <= 0 {
	room_restart()
}

if (_attack){
	var _enemy = instance_place(x+10, y, obj_enemy);
	sprite_index = spr_player_attack;
	if _enemy {
		_enemy.dano = true;
	}
} else {
	sprite_index = spr_player_idle;
}




