if (place_meeting(x, y + 1, obj_chao)) {
    instance_destroy(); 
}

if (instance_place(x, y, obj_water_enemy)) {
    var enemy = instance_place(x, y, obj_water_enemy);
    enemy.is_frozen = true;
    enemy.frozen_timer = room_speed * 5; 
    enemy.sprite_index = spr_water_enemy_freezed;
    instance_destroy(); 
}

if (place_meeting(x, y + 1, obj_fire_enemy)) {
    instance_destroy(); 
}

if (place_meeting(x, y + 1, obj_iceBlock)) {
    instance_destroy(); 
}





