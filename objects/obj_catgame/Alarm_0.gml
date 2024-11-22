shake = 0
shakeamount = 0
_shakeamountspeed = 0
vsp = -5
randomise()
image_speed -= 0.05
_lives -= 1
if (_lives <= 0)
    alarm[2] = 200
var _xscale = irandom_range(-1, 1)
if (_xscale == 0)
    _xscale = 1
hsp = random_range((7 * _xscale), (10 * _xscale))
show_debug_message(_xscale)
audio_play_sound(sfx_dispatch, 1, false)
