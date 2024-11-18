if (transitioning) {
    alpha += 0.02;
    if (alpha >= 1) {
        go_to_next = true;
        room_goto_next();
    }
}
