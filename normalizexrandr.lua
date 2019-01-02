#!/usr/bin/env lua

local line = io.read("*l")
local lastNonIndent = ""

while line ~= nil do
    local firstSpace = string.find(line, "%s")

    if firstSpace ~= 1 then
        lastNonIndent = string.match(line, "%w+")
    else
        local trimLine = string.match(line, "%s+(.+)")
        io.write(lastNonIndent, " → ", trimLine, "\n")
    end    

    line = io.read("*l")
end
