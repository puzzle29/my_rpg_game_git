right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("Q"));
up_key = keyboard_check(ord("Z"));
down_key = keyboard_check(ord("S"));

// get xspd and yspd
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

if instance_exists(obj_pauser)
{
	xspd = 0;
	yspd = 0;
}

//set sprite
mask_index = sprite[DOWN];

if yspd == 0
{
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
}

if xspd == 0
{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
}

// collisions
if place_meeting(x + xspd, y, obj_wall)
{
	xspd = 0;	
}

if place_meeting(x, y + yspd, obj_wall)
{
	yspd = 0;	
}

// move the player
x += xspd;
y += yspd;



sprite_index = sprite[face];

//animate
if xspd == 0 && yspd == 0
{
	image_index = 0	
}

depth = -bbox_bottom;