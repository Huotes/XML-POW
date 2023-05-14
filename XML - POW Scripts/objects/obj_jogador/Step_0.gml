script_execute(estado);

depth = -y;

if alarm[1] <= 0{
stamina += 1;	
}

stamina = clamp(stamina, 0, max_stamina[level]);
if global.maxlevel != true{
if max_vida[level] <= 80{
if xp >= max_xp[level]{
	xp = xp - max_xp[level];
	level += 1;
	
	vida = max_vida[level];
	stamina = max_stamina[level];
	
	
}
vida = clamp(vida, 0, max_vida[level]);
}
if level == 5 {global.maxlevel = true};
}

if keyboard_check_pressed(ord("Q")){
arma -= 1;	
}

if keyboard_check_pressed(ord("E")){
arma += 1;	
}

if arma >= armas.altura{
arma = 0;	
}else if arma < 0{
arma=armas.altura - 1;	
}

if vida = 0{game_end()}