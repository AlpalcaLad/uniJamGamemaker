direction = point_direction(other.x,other.y,target.x,target.y)+180
other.x -= hspeed
other.y -= vspeed
x += hspeed*2
y += vspeed*2
deflected = true