x+=camera_o.hsp*radius/30
y+=camera_o.vsp*radius/30
image_alpha_targ-=0.0001
if image_alpha<image_alpha_targ image_alpha += 0.0001
else image_alpha -= 0.0001
if image_alpha_targ <= 0 and image_alpha<=0.0001 instance_destroy()