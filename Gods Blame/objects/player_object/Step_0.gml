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

if (!variable_global_exists("paused") || !global.paused) {
    // normal movement / gameplay code here
}

// --- KNOCKBACK HANDLING ---
if (is_knocked) {
    // Apply knockback velocity
    hspeed = lengthdir_x(kb_speed, kb_dir);
    vspeed = lengthdir_y(kb_speed, kb_dir);

    // Slow down over time
    kb_speed *= kb_friction;

    // Timer
    kb_timer -= 1;
    if (kb_timer <= 0 || kb_speed < 0.2) {
        is_knocked = false;
        kb_timer = 0;
        kb_speed = 0;
        hspeed = 0;
        vspeed = 0;
    }

} else {
    // --- NORMAL MOVEMENT ---
    var mx = keyboard_check(ord("d"))
    var my = keyboard_check(ord("a"))

    if (mx != 0 || my != 0) {
        var md = point_direction(0, 0, mx, my);
        hspeed = lengthdir_x(move_speed, md);
        vspeed = lengthdir_y(move_speed, md);
    }  {
        hspeed = 0;
        vspeed = 0;
    }
}

// --- CHECK COLLISION WITH ENEMY ---
var e = instance_place(x, y, enemy_object);
if (e != noone && !is_knocked) {
    is_knocked = true;
    kb_dir = point_direction(e.x, e.y, x, y); // push away from enemy
    kb_speed = kb_strength;
    kb_timer = kb_duration;
}
