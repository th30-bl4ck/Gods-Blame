// Prevent sinking below ground
if (place_meeting(x, y + 1, ground_object)) {
    if (vspeed > 0) vspeed = 0;
}
