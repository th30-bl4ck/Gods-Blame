// Get distance between enemy and player
if (instance_exists(player_object)) {
    // Horizontal chasing
    if (x < player_object.x) {
        x += 2; // move right
    }
    if (x > player_object.x) {
        x -= 2; // move left
    }
}
