if keyboard_check_pressed(vk_escape)
{
    if (global.pause == 0)
    {
        var buff = buffer_create(((surface_get_width(application_surface) * surface_get_height(application_surface)) * 4), buffer_grow, 1)
        buffer_get_surface(buff, application_surface, 0)
        buffer_save(buff, "gameplay_surface.buf")
        global.pause = 1
        _speed = obj_catgame.image_speed
        obj_catgame.image_speed = 0
        buffer_delete(buff)
    }
    else
    {
        global.pause = 0
        obj_catgame.image_speed = _speed
    }
}
