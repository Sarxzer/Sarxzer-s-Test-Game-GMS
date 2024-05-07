/// @description Player main code

var _shoot_cooldown = 0

var _movex = (keyboard_check(vk_right)-keyboard_check(vk_left))
var _jump = keyboard_check(vk_up)
var _shoot = keyboard_check(vk_down)

var _mouse_angle_rad = point_direction(x, y, mouse_x, mouse_y)
var _mouse_angle_deg = radtodeg(_mouse_angle_rad)

hspd = _movex * 5

// Jumping mechanism
if (_jump && place_meeting(x, y+1, oWall)) {
    show_debug_message("Jumping!");
    vspd = -jump_h;
}

// Shoot
if (_shoot && _shoot_cooldown<=current_time) {
	hspd = lengthdir_x(5, _mouse_angle_rad)
	vspd = lengthdir_y(5, _mouse_angle_rad)
	
	_shoot_cooldown = current_time + 5000
	print(_shoot_cooldown)
	print(current_time)
	print(_shoot_cooldown<=current_time)
}

// Side colision
if place_meeting(x+hspd, y, oWall) {
	while !place_meeting(x+sign(hspd), y, oWall) {
		x += sign(hspd)
	}
	while place_meeting(x, y, oWall) {
		x += sign(hspd)
	}
	hspd = 0
	show_debug_message("side colision!")
}

// Down colision
if place_meeting(x, y+vspd, oWall) {
	while !place_meeting(x, y+sign(vspd), oWall) {
		y += sign(vspd)
	}
	while place_meeting(x, y, oWall) {
		y -= sign(vspd)
	}
	vspd = 0
	show_debug_message("up/down colision!")
}


if mouse_check_button(1) {
	x = mouse_x
	y = mouse_y
}



vspeed = vspd
hspeed = hspd

if vspd < 12 {
	vspd += g
} else {
	vspd = 12
}