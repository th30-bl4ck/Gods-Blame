if (frozen) {
    exit; // this stops everything for this object
}

// your normal movement code here
if (instance_exists(player_object)) {
    // calculate distance between enemy and player
    var dist = point_distance(x, y, player_object.x, player_object.y);

    // how close before stopping
    var stop_distance = 5; // stop moving when this close
    var start_distance = 240; // start moving when this close (you can change this)

    // only follow the player if they're within the start distance
    if (dist < start_distance) {
        if (dist > stop_distance) {
            if (x < player_object.x) {
                x += 2;
            } else if (x > player_object.x) {
                x -= 2;
            }
        }
    }
}
