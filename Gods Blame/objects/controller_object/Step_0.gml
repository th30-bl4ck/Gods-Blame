if (keyboard_check_pressed(vk_escape)) {
    if (!global.paused) {
        // Pause the game
        global.paused = true;
        instance_create_layer(0, 0, "GUI", obj_pausemenu);
    } else {
        // Unpause
        global.paused = false;
        if (instance_exists(obj_pausemenu)) {
            instance_destroy(obj_pausemenu);
        }
    }
}
