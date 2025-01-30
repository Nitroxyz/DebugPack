-- Version 1.1.2

local debug = {
    x = -0.7,   -- recommended x value
    y = 0.7,    -- recommended y value
    d = 0.1,    -- recommended delta value
    k = -0.9,   -- recommended x value for keys (in front)
    q = {}      -- quicker alternatives
}

local draw_list = {}

local prev_val = {}

-- -0.7, 0.7, 0.1

function debug.draw(id, ex, yai, thing)
    if draw_list[id] then
        clear_callback(draw_list[id])
    end
    draw_list[id] = set_callback(function(draw_ctx)
        draw_ctx = draw_ctx --[[@as GuiDrawContext]]
        local c = rgba(255, 255, 255, 255)
    
        draw_ctx:draw_text(ex, yai, 25, tostring(thing), c)
    end, ON.GUIFRAME)
end

function debug.draw_list(id, ex, yai, delta, thingies)
    if draw_list[id] then
        clear_callback(draw_list[id])
    end
    draw_list[id] = set_callback(function(draw_ctx)
        draw_ctx = draw_ctx --[[@as GuiDrawContext]]
        local c = rgba(255, 255, 255, 255)
        local yei = yai
        for index, value in ipairs(thingies) do
            draw_ctx:draw_text(ex, yei, 25, tostring(value), c)
            yei = yei - delta
        end
    end, ON.GUIFRAME)
end

function debug.draw_hash(id, ex, yai, delta, thingies)
    if draw_list[id] then
        clear_callback(draw_list[id])
    end
    draw_list[id] = set_callback(function(draw_ctx)
        draw_ctx = draw_ctx --[[@as GuiDrawContext]]
        local c = rgba(255, 255, 255, 255)
        local yei = yai
        for key, value in pairs(thingies) do
            draw_ctx:draw_text(ex, yei, 25, tostring(value), c)
            yei = yei - delta
        end
    end, ON.GUIFRAME)
end

function debug.draw_key(id, ex, yai, delta, thingies)
    if draw_list[id] then
        clear_callback(draw_list[id])
    end
    draw_list[id] = set_callback(function(draw_ctx)
        draw_ctx = draw_ctx --[[@as GuiDrawContext]]
        local c = rgba(255, 255, 255, 255)
        local yei = yai
        for key, value in pairs(thingies) do
            draw_ctx:draw_text(ex, yei, 25, tostring(key), c)
            yei = yei - delta
        end
    end, ON.GUIFRAME)
end

function debug.print_on_change(id, value)
    if prev_val[id] then
        if prev_val[id] ~= value then
            prinspect(value)
        end
    end
    prev_val[id] = value
end

-- TODO: Make strings be normal
function debug.print_if(check, value)
    if check then
        prinspect(value)
    end
end

function debug.q.draw(id, thing)
    debug.draw(id, debug.x, debug.y, thing)
end

function debug.q.draw_hash(id, things)
    debug.draw_hash(id, debug.x, debug.y, debug.d, things)
end

function debug.q.draw_key(id, things)
    debug.draw_key(id, debug.x, debug.y, debug.d, things)
end

return debug