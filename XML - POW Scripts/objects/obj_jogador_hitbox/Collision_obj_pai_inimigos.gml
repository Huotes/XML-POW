other.life -= obj_jogador.dano[obj_jogador.level];
var _dir = point_direction(obj_jogador.x,obj_jogador.y,other.x,other.y);
other.empurrar_dir = _dir;
other.empurrar_spd = 4;
other.alarm[1] = 5;
other.hit = true;
other.estado=scr_slime_hit;

var _inst = instance_create_layer(x, y, "Instances", obj_dano);
_inst.alvo = other;
_inst.dano = obj_jogador.dano[obj_jogador.level];
