// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print(_text){
	show_debug_message(_text)
}

function roundTo(_value, _round){
	return round(_value * (1/_round)) * _round
}

var _damage_text

function draw_damage_text(_text, _alive=1) {
    draw_set_color(c_white);
    draw_text_transformed(x, y, string(_text), 1, 1, 0);
	oAll.damage_text += [_text, current_time + _alive]
}