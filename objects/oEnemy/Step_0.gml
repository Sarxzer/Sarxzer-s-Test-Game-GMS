if (place_meeting(x, y, oPlayer) || place_meeting(x+1, y, oPlayer) || place_meeting(x-1, y, oPlayer) || place_meeting(x, y+1, oPlayer) || place_meeting(x, y-1, oPlayer)) && cooldown<=current_time {
	oPlayer.life -= damage
	
	cooldown = current_time + damage_cooldown
	print("dammage")
}
