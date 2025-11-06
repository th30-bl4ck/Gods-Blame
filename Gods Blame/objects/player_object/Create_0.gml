// Movement variables
vsp = 2;           // vertical speed
grav = 0.5;        // gravity strength
jump_speed = -8;  // jump power (negative = up)


// Settings
move_speed    = 1.5;   // how fast player moves normally
kb_duration   = 12;  // how long knockback lasts (frames)
kb_strength   = 15;   // how strong knockback is
kb_friction   = 0.88; // how fast knockback slows down (0–1)

is_knocked    = false;
kb_timer      = 0;
kb_dir        = 0;
kb_speed      = 0;

facing = 1; // 1 = right, -1 = left

image_yscale = 1;
