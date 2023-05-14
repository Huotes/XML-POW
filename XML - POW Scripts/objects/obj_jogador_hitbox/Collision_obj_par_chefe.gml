other.vida -= obj_jogador.dano[obj_jogador.level];
other.alarm[1] = 5;
other.hit = true;
var _inst = instance_create_layer(x, y, "Instances", obj_dano);
_inst.alvo = other;
_inst.dano = obj_jogador.dano[obj_jogador.level];
