meta = {
    name = "DebugPack",
    version = "3.0.0",
    author = "Nitroxy",
    description = "Debug extention",
    online_safe = true
}

local debug = require "debug_pack.lua"

exports = debug

--[[ Changes:
debug.active:
- When false, all prints get disabled
function additions:
- added q.draw_list()
- added better_print()
- added print_once()
- added reverse_enum()
misc:
- added once (table)
- added readme.txt
]]