depth = -y
script_execute(estado);

if life <= 0{
	obj_jogador.xp += 15;
	global.allenemy += 1;
instance_destroy();	
}

