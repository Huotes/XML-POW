function scr_boss_escolher_ataque(){
if alarm[0] <= 0{
var _ataque = choose(scr_boss_ataque_1, scr_boss_ataque_2);
estado = _ataque;
alarm[0] = 240;

}
}

function scr_boss_ataque_1(){
if ataques mod 2 == 1{
	
var _dir = 0;
}else{
var _dir = 22.5;	
}

if ataques > 0 {
if alarm[2] <= 0{
repeat(8){
	
var _inst = instance_create_layer(x, y, "Instances", obj_boss_projetil);
_inst.speed = 3;
_inst.direction = _dir;

_dir += 45;

}
ataques -= 1;
alarm[2] = 3;
}
}else{
estado = scr_boss_escolher_ataque;
ataques = 2;
}

}


function scr_boss_ataque_2(){

repeat(6){
	var _xx = irandom_range(x - 100, x + 100 );
	var _yy = irandom_range(y - 100, y + 100);
	
instance_create_layer(_xx, _yy, "Instances", obj_boss_ataque_1);
}
estado = scr_boss_escolher_ataque;
}