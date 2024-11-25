index--;
audio_play_sound(a_menuPress, 1, false)
if index < 0 {
	index = op_max -1;
}