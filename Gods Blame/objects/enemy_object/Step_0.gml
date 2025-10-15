
if (frozen) {
    exit; //  this stops everything for this object
}

// your normal movement code here
if (instance_exists(player_object)) {
    if (x < player_object.x) {
        x += 2;
    } else if (x > player_object.x) {
        x -= 2;
    }
}
