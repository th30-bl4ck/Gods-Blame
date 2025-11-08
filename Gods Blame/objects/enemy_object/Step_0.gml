if (stun_timer > 0) {
    stun_timer -= 1;
    exit;
}

if (instance_exists(player_object)) {
    // Check collision with player
    if (place_meeting(x, y, player_object)) {
        // Push the player slightly back only once per hit
        if (stun_timer == 0) {
            stun_timer = room_speed * 2; // enemy pause
            var push_dir = sign(player_object.x - x); // which side player is on
            player_object.x += push_dir * 10; // small nudge
        }
        exit;
    }
}
    // Only check horizontal distance (ignore vertical)
    var dist = abs(player_object.x - x);

    var stop_distance = 6;
    var start_distance = 200;
    var move_speed = 1.5;

    if (dist > stop_distance && dist < start_distance) {
        var dir = point_direction(x, y, player_object.x, y);
        var nx = x + lengthdir_x(move_speed, dir);

        if (!place_meeting(nx, y, ground_object)) {
            x = nx;
        }
    }

 // Flip sprite to face player without stretching
    var base_scale = abs(image_xscale);
    if (player_object.x < x) {
        image_xscale = -base_scale;
    } else {
        image_xscale = base_scale;
    }
