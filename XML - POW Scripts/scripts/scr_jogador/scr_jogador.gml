function scr_jogador_colisao(){
	
	if place_meeting(x + hspd, y, obj_parede)
{
	hspd = 0;
}

if place_meeting(x, y + vspd, obj_parede)
{
	vspd = 0;
}
}

function scr_jogador_andando(){

direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

	
	//variaveis para encurtar o codigo
	xaxis = direita - esquerda;
	yaxis = baixo - cima;
	
	
	//point_direction simula um ponto em um plano cartesiano fazendo o jogador seu ponto central
	movedir = point_direction(0,0,xaxis,yaxis);
	//limita as velocidades 
	limiter = (xaxis != 0) or (yaxis != 0);

	//aplicando a velocidade de x e y
	hspd = lengthdir_x(limiter * spd,movedir);
	vspd = lengthdir_y(limiter * spd,movedir);

scr_jogador_colisao();
x += hspd;
y += vspd;

//troca de sprites

dir = floor((point_direction(x, y, mouse_x, mouse_y)+45)/90);

if hspd == 0 and vspd == 0{

switch dir{
	default:
	sprite_index = spr_parado_direita;
	break;
	case 1:
	sprite_index = spr_parado_cima;
	break;
	case 2:
	sprite_index = spr_parado_esquerda;
	break;
	
	case 3:
	sprite_index = spr_parado_baixo;
	break;
	
}
}else{switch dir{
	default:
	sprite_index = spr_personagem_correndo_direita;
	break;
	case 1:
	sprite_index = spr_personagem_correndo_cima;
	break;
	case 2:
	sprite_index = spr_personagem_correndo_esquerda;
	break;
	case 3:
	sprite_index = spr_personagem_correndo_down;
	break;
	}
}
#region dash
if stamina >= 5 {
if mouse_check_button_pressed(mb_right){
	stamina -= 5;
	alarm[1] = 240;
	alarm[0] = 8;
	dash_dir = point_direction(x,y,mouse_x,mouse_y);
	estado = scr_jogador_dash
	}
}
#endregion

if mouse_check_button_pressed(mb_left){
	if arma == armas.espada{
	image_index = 0;
	switch dir{
		default:
		sprite_index = spr_personagem_atacando_direita
		break;
		case 1:
		sprite_index = spr_personagem_atacando_cima
		break;
		case 2:
		sprite_index = spr_personagem_atacando_esquerda
		break;
		case 3:
		sprite_index = spr_personagem_atacando_baixo
		break;
	}
	estado = scr_personagem_atacando;
	}else if arma == armas.arco {
	image_index = 0;
	
	estado = scr_personagem_arco;
	
	}
	}
	
}

function scr_jogador_dash(){
	tomardano = false;
	hspd = lengthdir_x(dash_spd,dash_dir);
	vspd = lengthdir_y(dash_spd,dash_dir);
	 scr_jogador_colisao();
	x+= hspd;
	y+= vspd;
	
	var _inst = instance_create_layer(x,y,"Instances",obj_dash);
	_inst.sprite_index = sprite_index;
}
	
	

function scr_personagem_atacando(){
	if image_index >= 1{
	if atacar == false{
	switch dir{
		default:
		instance_create_layer(x+10,y,"Instances",obj_jogador_hitbox);
		break;
		case 1:
		instance_create_layer(x,y-10,"Instances",obj_jogador_hitbox);
		break;
		case 2:
		instance_create_layer(x-10,y,"Instances",obj_jogador_hitbox);
		break;
		case 3:
		instance_create_layer(x,y+10,"Instances",obj_jogador_hitbox);
		break;
	}
	atacar = true;
	}
}
 if fim_da_animacao(){
estado = scr_jogador_andando;
atacar = false;
}
}
	
function scr_jogador_hit(){
		if alarm[2] > 0{
		hspd = lengthdir_x(3, empurrar_dir);
		vspd = lengthdir_y(3, empurrar_dir);
		
		scr_jogador_colisao();
		}else{
			estado = scr_jogador_andando;
		}
}


function scr_personagem_arco(){
dir = floor((point_direction(x, y, mouse_x, mouse_y) +45)/90);

switch dir{
default:
 sprite_index = spr_personagem_arco_direita;
break;
case 1:
sprite_index = spr_personagem_arco_up;
break;
case 2:
sprite_index = spr_personagem_arco_esquerda;
break;

case 3:
sprite_index = spr_personagem_arco_down;
break;


}

if fim_da_animacao(){

image_index = 4;

}
	if mouse_check_button_released(mb_left){
	if image_index >= 4{
		var _dir = point_direction(x, y, mouse_x, mouse_y);
		var _xx = lengthdir_x(5, _dir);
		var _yy = lengthdir_y(5, _dir);
		
		var _inst = instance_create_layer(x + _xx, y + _yy, "Instances", obj_flecha);
		_inst.direction = _dir;
		_inst.image_angle = _dir;
		_inst.speed = 12;
		
		empurrar_dir = point_direction(mouse_x, mouse_y, x, y);
		alarm[2] = 5;
		estado = scr_jogador_hit;
		
	}else{
	estado = scr_jogador_andando;	
	}
		
	}
}