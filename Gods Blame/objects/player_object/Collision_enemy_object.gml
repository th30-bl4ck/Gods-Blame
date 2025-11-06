if (vsp > 0) { 
    // Player is falling down onto the enemy
    vsp = -2; // bounce player upwards
}

// If player is moving right into the enemy
if (hsp > 0) {
    hsp = -8; // bounce left
}

// If player is moving left into the enemy
if (hsp < 0) {
    hsp = 8; // bounce right
}
