var _escala = 3;
var _guia = display_get_height();
var _spra = sprite_get_height(spr_hud) * _escala;
var _huda = _guia - _spra;

var _vida = obj_jogador.vida;
var _maxvida = obj_jogador.max_vida[obj_jogador.level];

var _stamina = obj_jogador.stamina;
var _maxstamina = obj_jogador.max_stamina[obj_jogador.level];


var _xp = obj_jogador.xp;
var _maxxp = obj_jogador.max_xp[obj_jogador.level];
var _xpa = sprite_get_height(spr_barra_hud);





//barra de vida
draw_sprite_ext(spr_barra_vida, 0, 0, _huda, (_vida/_maxvida)*_escala, _escala, 0, c_white, 1);

//barra de stamina
draw_sprite_ext(spr_barra_stamina, 0, 0, _huda + 24, (_stamina/_maxstamina)* _escala, _escala, 0 , c_white, 1);

//hud
draw_sprite_ext(spr_hud, 0, 0, _huda, _escala, _escala, 0, c_white, 1);

//barra de xp
draw_sprite_ext(spr_barra_hud, 0, 0, _guia - _xpa, _escala, _escala, 0, c_white, 1);
draw_sprite_ext(spr_barra_exp, 0, 9, _guia - _xpa + 9,(_xp/_maxxp) * _escala, _escala, 0, c_white, 1);

//vida boss
var _gl = display_get_width();
if instance_exists(obj_par_chefe){
 var _sprw = sprite_get_width(spr_boss_hud)* _escala;
 
draw_sprite_ext(spr_boss_hud, 0, _gl/2 - _sprw/2, 100, _escala, _escala, 0 , c_white, 1);
draw_sprite_ext(spr_boss_vida, 0, _gl/2 - _sprw/2, 100, (obj_boss.vida/obj_boss.vida_max)* _escala, _escala, 0 , c_white, 1);
 
}