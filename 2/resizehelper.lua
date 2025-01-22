-- Pocket Computer Resize Guide

-- display the guide view
local function draw_guide()
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)

    term.clear()
    term.setCursorPos(1, 1)

    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)

    local w, h = term.getSize()

    for y = 1, h do
        if y > 20 then
            term.setBackgroundColor(colors.red)
        end

        for x = 1, w do
            if x > 26 then
                term.setBackgroundColor(colors.red)
            end

            term.setCursorPos(x, y)
            term.write(" ")
        end

        term.setBackgroundColor(colors.lightGray)
    end

    term.setCursorPos(1, 1)
    term.write("(" .. w .. ", " .. h .. ")")
    term.setCursorPos(1, 2)
    term.write("requires")
    term.setCursorPos(1, 3)
    term.write("(26, 20)")
end

-- initial size check
local w, h = term.getSize()
if w == 26 and h == 20 then
    print("correctly sized")
    return
end

draw_guide()

-- main loop
while true do
---@diagnostic disable-next-line: undefined-field
    local event = os.pullEventRaw()

    if event == "term_resize" then
        w, h = term.getSize()

        if w == 26 and h == 20 then
            term.setBackgroundColor(colors.black)
            term.setTextColor(colors.white)
            term.clear()
            term.setCursorPos(1, 1)
            print("correctly sized")

            return
        else
            draw_guide()
        end
    elseif event == "terminate" then
        term.setBackgroundColor(colors.black)
        term.setTextColor(colors.white)
        term.clear()
        term.setCursorPos(1, 1)
        print("aborted")

        return
    end
end
