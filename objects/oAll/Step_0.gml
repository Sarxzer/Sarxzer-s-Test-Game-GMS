for (var i = 0; i < array_length_1d(damage_text); i++) {
    if (current_time > damage_text[i][1]) {
        array_delete(damage_text, i, 1)
    }
}