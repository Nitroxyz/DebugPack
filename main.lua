meta = {
    name = "DebugPack",
    version = "2.1.1",
    author = "Nitroxy",
    description = "Debug extention",
    online_safe = true
}

local debug = require "debug_pack.lua"

exports = debug

--[[ Changes:
debug.active:
- When false, all prints get disabled
- added q.draw_list
]]