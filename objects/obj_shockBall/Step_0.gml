
if (instance_place(x, y, obj_water_enemy)) {
    var water_enemy = instance_place(x, y, obj_water_enemy);
    if (water_enemy != noone) { 
        with (water_enemy){
			sprite_index = spr_water_enemy_dead;  
			instance_destroy();  
		}
    }
    instance_destroy();  
}


if (instance_place(x, y, obj_robot_enemy)) {
    var robot_enemy = instance_place(x, y, obj_robot_enemy); 
    if (robot_enemy != noone) {
		with (robot_enemy){
			sprite_index = spr_robot_enemy_dead;  
			instance_destroy();  
		}
    }
    instance_destroy();  
}

if (instance_place(x, y, obj_door)) {
    var door = instance_place(x, y, obj_door);
    if (door != noone) {
        door.sprite_index = spr_door_opening;
        door.opening = true;
        with (door) {
            alarm[0] = 30; 
        }
    }
    instance_destroy(); 
}

