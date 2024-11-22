if (spamtimer <= 0)
{
    if (spamcount >= 3)
        spamming = 1
    spamtimer = 15
    spamcount = 0
}
if keyboard_check_pressed(vk_f11)
    fullscreen = (fullscreen ? 0 : 1)
window_set_fullscreen(fullscreen)
if (spamtimer > 0)
    spamtimer -= 0.5
if (spamming == 1)
    room_goto(jumpsacreo)
if keyboard_check_pressed(ord("C"))
    spamcount += 1
if global.pause
    return;
if (floor(image_index) == 1 && (!audio_is_playing(sound_parry1)))
{
    audio_play_sound(sound_parry1, 1, false)
    audio_stop_sound(sound_parry2)
    shake = 1
    shakeamount = (4 * (image_speed * 2))
}
if (image_index >= 37 && image_index <= 42)
{
    if keyboard_check_pressed(ord("C"))
    {
        if ((!audio_is_playing(sound_parry2)) && dead == 0)
        {
            audio_play_sound(sound_parry2, 1, false)
            parries += 1
            audio_stop_sound(sound_parry1)
            shake = 1
            shakeamount = (4 * (image_speed * 2))
            combo += 1
            comboalpha = 1
            alarm[1] = 30
        }
    }
    else if (image_index >= 41 && (!audio_is_playing(sound_parry2)) && dead == 0)
    {
        shake = 1
        shakeamount = (11 * (image_speed * 2))
        image_index = 41
        dead = 1
        alarm[0] = 40
        combo = 0
        audio_play_sound(sfx_hit, 0, false)
    }
}
if (floor(image_index) == 44)
    image_speed += 0.03
if (shakeamount > 0)
{
    shakeamount -= (_shakeamountspeed * image_speed)
    _shakeamountspeed += 0.005
}
if (shakeamount <= 0)
{
    shake = 0
    _shakeamountspeed = 0.1
}
var _shakex = 0
var _shakey = 0
if (shake == 1)
{
    _shakex = (random_range(-1, 1) * shakeamount)
    _shakey = (random_range(-1, 1) * shakeamount)
}
window_set_position((windowx + _shakex), (windowy + _shakey))
if (dead == 1)
    image_index = 40
if (!(vsp == 0))
    vsp += 0.3
windowx += hsp
windowy += vsp
if (flash > 0)
    flash -= 0.1
if (vsp >= 10 && _lives != 0)
{
    vsp = 0
    audio_play_sound(breakmetal, 1, false)
    hsp = 0
    flash = 1
    image_index = 47
    dead = 0
}
if (window_get_y() >= 1200 || window_get_x() >= 1950 || window_get_x() <= -1950)
    game_end()
if (combofade == 1)
{
    if (comboalpha > 0)
        comboalpha -= 0.1
    else
        combofade = 0
}

