// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print(_text){
	show_debug_message(_text)
}

function roundTo(_value, _round){
	return round(_value * (1/_round)) * _round
}