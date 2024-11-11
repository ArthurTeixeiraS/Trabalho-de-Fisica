if (place_meeting(x, y + 1, obj_chao)) {
    instance_destroy(); 
}


if (instance_place(x, y, obj_water_enemy)) {
    instance_destroy();  
}

if (instance_place(x, y, obj_robot_enemy)) {
    var enemy = instance_place(x, y, obj_robot_enemy); 
    var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y); 
    direction = dir_to_player;
    speed = 6; 
}


if (place_meeting(x, y, obj_iceBlock)) {
   
    var ice_block = instance_place(x + 1, y, obj_iceBlock); 
    
    if (ice_block != undefined) {
        
        with (ice_block) {
            hit_count += 1;

            if (hit_count >= 5) {
                instance_destroy(); 
            }
        }
    }

    instance_destroy();
}




