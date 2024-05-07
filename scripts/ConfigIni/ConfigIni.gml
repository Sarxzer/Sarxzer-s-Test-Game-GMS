function ConfigIni() {
    var filename = "settings.ini";
    if (!file_exists(filename)) {
        ini_open(filename);
        ini_write_string("Settings", "key_up", string(vk_up));
        ini_write_string("Settings", "key_down", string(vk_down));
        ini_write_string("Settings", "key_left", string(vk_left));
        ini_write_string("Settings", "key_right", string(vk_right));
        ini_close();
    }

    ini_open(filename);
    key_up = ini_read_string("Settings", "key_up", vk_up);
    if (key_up != vk_up) {
        key_up = ord(key_up);
    }
    key_down = ini_read_string("Settings", "key_down", vk_down);
    if (key_down != vk_down) {
        key_down = ord(key_down);
    }
    key_left = ini_read_string("Settings", "key_left", vk_left);
    if (key_left != vk_left) {
        key_left = ord(key_left);
    }
    key_right = ini_read_string("Settings", "key_right", vk_right);
    if (key_right != vk_right) {
        key_right = ord(key_right);
    }
    ini_close();
}