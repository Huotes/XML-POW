function scr_capeta_colisao(){
if place_meeting(x + hspd, y, obj_parede){
while 	!place_meeting(x + sign(hspd), y, obj_parede){
	x += sign(hspd);
}
hspd = 0;
}
x+= hspd;

if place_meeting(x, y + vspd, obj_parede){
while 	!place_meeting(x , y + sign(vspd), obj_parede){
	y += sign(vspd);
}
vspd = 0;
}
y+= vspd;
}
	
	function scr_capeta_checar_personagem(){
	if distance_to_object(obj_jogador)<= dist_aggro{
		estado = scr_capeta_perseguindo;
	}
}

function scr_capeta_escolher_estado(){
	scr_capeta_checar_personagem();
prox_estado = choose(scr_capeta_andando, scr_capeta_parado);

if prox_estado == scr_capeta_andando{
	estado = scr_capeta_andando;
	dest_x = random_range(0,room_width);
	dest_y = random_range(0, room_height);
}else if prox_estado == scr_capeta_parado{
	estado = scr_capeta_parado;
}
}

function scr_capeta_andando(){
	scr_capeta_checar_personagem();
	
	image_speed = 1;
	if distance_to_point(dest_x,dest_y) > veloc{
	var _dir = point_direction(x,y,dest_x,dest_y);
	hspd = lengthdir_x(veloc, _dir);
	vspd = lengthdir_y(veloc, _dir);
	
	scr_capeta_colisao();
	}else{
		x = dest_x;
		y = dest_y;
	}
}

function scr_capeta_parado(){
	scr_capeta_checar_personagem();
	
	image_speed = 0.5;
}

function scr_capeta_perseguindo(){
	image_speed = 1;
	
	dest_x = obj_jogador.x;
	dest_y = obj_jogador.y;
	
	var _dir = point_direction(x,y,dest_x,dest_y);
	hspd = lengthdir_x(veloc_perseg, _dir);
	vspd = lengthdir_y(veloc_perseg, _dir);
	scr_capeta_colisao();
	
	if distance_to_object(obj_jogador) >= dist_desaggro{
		estado = scr_capeta_escolher_estado;
		alarm[0] = irandom_range(120,240);}
}
	
	function scr_slime_hit(){
		alarm[2] = 180;
		empurrar_spd = lerp(empurrar_spd, 0, 0.2);
		
		hspd = lengthdir_x(empurrar_spd, empurrar_dir);
		vspd = lengthdir_y(empurrar_spd, empurrar_dir);
		
		scr_capeta_colisao();
	}
