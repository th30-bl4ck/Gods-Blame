// Reset horizontal movement
hsp = 0;

// Move left (A)
if (keyboard_check(ord("A"))) {
    hsp = -move_speed;
}

// Move right (D)
if (keyboard_check(ord("D"))) {
    hsp = move_speed;
}

// Apply movement
x += hsp;

// Apply gravity every step
vsp += grav;

// Jump when SPACE is pressed
if (keyboard_check_pressed(vk_space)) {
    if (place_meeting(x, y + 1, ground_object)) {
        vsp = jump_speed; // go upwards
    }
}

// Vertical movement with collision
if (place_meeting(x, y + vsp, ground_object)) {
    // Stop right at the solid
    while (!place_meeting(x, y + sign(vsp), ground_object)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (keyboard_check_pressed(vk_escape)) {
    room_goto(pause_screen);
}
