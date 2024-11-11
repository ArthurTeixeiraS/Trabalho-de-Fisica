// Ganha uma vida extra ao tocar o item extra 
audio_play_sound(a_lifeUp, 1, false);
with(obj_player){
	lives += 1;
}
instance_destroy(); 