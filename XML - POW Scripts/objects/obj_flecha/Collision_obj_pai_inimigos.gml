var _dano = 2;
var _dir = point_direction(x, y, other.x, other.y);

other.empurrar_dir = _dir;
other.empurrar_spd = 6;
other.hit = true;
other.alarm[1] = 5
other.estado = scr_slime_hit;
other.life -= _dano;

instance_destroy();
