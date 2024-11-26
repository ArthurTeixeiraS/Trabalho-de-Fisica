if (transitioning) {
	alpha += 0.02;
    if (room == room_last) {
        room_goto(Room0);
    } else {
        room_goto(room_next(room));
    }
}
