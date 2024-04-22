if hero_o.honour>hero_o.honourInit hero_o.honour=hero_o.honourInit
draw_sprite_ext(honourSprite_s,0,140,100,4,4,0,c_white,1)
draw_sprite_ext(honourIcon_s,0,150-sprite_get_width(honourSprite_s)*2 + (sprite_get_width(honourSprite_s)*4-10)*(hero_o.honour/hero_o.honourInit),124,4,4,0,c_white,1)