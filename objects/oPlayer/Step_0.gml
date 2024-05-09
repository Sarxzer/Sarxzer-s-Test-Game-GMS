/// @description Player main code
ConfigIni()

var _movex = (keyboard_check(key_right) - keyboard_check(key_left))
var _jump = keyboard_check(key_up)
var _shoot = keyboard_check(key_down)

var _mouse_angle_rad = point_direction(x, y, mouse_x, mouse_y)
var _mouse_angle_deg = radtodeg(_mouse_angle_rad)

// Modify hspd
if hspd <= 5 && hspd >= -5 {
	hspd += _movex * (5 - hspd*sign(hspd))
}

// Jumping mechanism
if (_jump && place_meeting(x, y+1, oWall)) {
    show_debug_message("Jumping!");
    vspd = -jump_h;
}

// Shoot
if (_shoot && _shoot_cooldown<=current_time) {
	hspd += -lengthdir_x(10, _mouse_angle_rad)
	vspd += -lengthdir_y(10, _mouse_angle_rad)
	
	_shoot_cooldown = current_time + 1000
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

// Diagonal colision (to prevent tp glitch)
if place_meeting(x+hspd, y+vspd, oWall) {
	print("hspd: " + string(hspd))
	while place_meeting(x+sign(hspd), y, oWall) {
		x += sign(hspd)
		print("x: " + string(x))
	}
	while place_meeting(x, y+sign(vspd), oWall) {
		y += sign(vspd)
		print("y: " + string(y))
	}
	while place_meeting(x, y, oWall) {
		x -= sign(hspd)
		y -= sign(vspd)
	}
	hspd = 0
	vspd = 0
	show_debug_message("diagonal colision!")
}

if place_meeting(x, y, oEnemy) {
	life -= 1
}

if life == 0 {
	instance_destroy(self)
}


if mouse_check_button(1) {
	x = mouse_x
	y = mouse_y
}



vspeed = vspd
hspeed = hspd

// Gravity
if vspd < 12 {
	vspd += g
} else {
	vspd = 12
}

// Friction
if hspd != 0 {
	// get friction of what's touching
	var _friction_touching = 0
	if place_meeting(x, y+1, oWall) {
		_friction_touching = oWall.friction
	} else {
		_friction_touching = 0.1
	}
	if hspd > 0 {
		hspd -= _friction_touching
	} else {
		hspd += _friction_touching
	}
	hspd = roundTo(hspd, 0.1)
	print("Friction: " + string(_friction_touching))
}