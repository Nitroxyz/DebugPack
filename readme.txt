I am the page that explains the library (V3.0)

add the module to your mod
use
local debug = require "debug_pack.lua"
to import

then use 
debug.function()
to use functions

most of them use an id, which needs to be unique to the draw/check. 
draws/check will only be updated when run, so run them usually in ON.POST_UPDATE

q variations:
shorter versions of all functions, using a default coordinates to cut on code length.
use
debug.q.function()
to access those
recommended unless you need multiple draws

debug.active
change this to false to disable all draws and prints

LIBRARY:

Draws: 
draw a text on a certain spot
draw(id, x, y, output)
draw_list(id, x, y, delta, output) #sorted
draw_hash(id, x, y, delta, output)
draw_key(id, x, y, delta, output)

Prints:
uses the console print. Displays the strings better
print_on_change(id, value, output)
print_once(id, output)
print_if(check, output) #careful, no id!

Functions:
all around utility
if_change(id, value) #more lightweight version
reverse_enum(enum, value) #example: reverse_enum(ENT_TYPE, ENT_TYPE.ITEM_JETPACK) -> "ITEM_JETPACK"
better_print(output) #does a print! makes strings not print with ""

Q versions
see above for explanations
q.draw(id, output)
q.draw_list(id, things)
q.draw_hash(id, things)
q.draw_key(id, things)
q.print_on_change(id, value)
