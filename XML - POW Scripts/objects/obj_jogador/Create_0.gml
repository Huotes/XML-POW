//armas
enum armas{
espada = 0,
arco = 1,
altura = 2
}

//direções
direita = -1
cima = -1
esquerda = -1
baixo = -1
dir = 0;

//velocidade
hspd = 0;
vspd = 0;
spd = 2;

//dash
dash_dir = -1;
dash_spd = 5;

//estado
estado = scr_jogador_andando;

//combate
level = 1;
xp = 0;
max_xp[1] = 100;
max_xp[2] = 120;
max_xp[3] = 150;
max_xp[4] = 200;
max_xp[5] = 285;

//hud
max_stamina[1] = 10;
max_stamina[2] = 15;
max_stamina[3] = 35;
max_stamina[4] = 60;
max_stamina[5] = 80;


stamina = max_stamina[level];


max_vida[1] = 20;
max_vida[2] = 30;
max_vida[3] = 42;
max_vida[4] = 60;
max_vida[5] = 80;
vida = max_vida[level];

tomardano = true;
empurrar_dir = 0;


dano[1] = 1;
dano[2] = 2;
dano[3] = 4;
dano[4] = 7;
dano[5] = 10;
	
arma = 0;
atacar = false;
dano_alpha = -1;
