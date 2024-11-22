if (ds_map_find_value(async_load, "id") == global.funnyip)
{
    if (ds_map_find_value(async_load, "status") == 0)
        ip = ds_map_find_value(async_load, "result")
}
