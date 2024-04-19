shader_set(shader);
shader_set_uniform_f(shader_get_uniform(whiteFlash_sh,"alpha"),image_alpha)
draw_self();
shader_reset();