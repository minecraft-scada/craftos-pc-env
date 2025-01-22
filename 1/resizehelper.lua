-- Coordinator Monitor Resize Guide

local border_0x5 = { x = 3, y = 2 }
local size_0x5 = { w = 15 + (2 * border_0x5.x), h = 10 + (2 * border_0x5.y) }

local monitors = {}
local names = peripheral.getNames()

-- display the guide view
local function draw_guide(monitor, name)
    monitor.clear()
    monitor.setTextScale(0.5)

    local w, h = monitor.getSize()

    print(name .. " => w: " .. w .. " h: " .. h)

    local min_w = math.floor(math.min(8, (w + (2 * border_0x5.x)) / size_0x5.w))
    local min_h = math.floor(math.min(6, (h + (2 * border_0x5.y)) / size_0x5.h))

    local alternator = false
    local monitor_color = colors.lightBlue

    local edge_mon_w = (size_0x5.w - border_0x5.x)
    local edge_mon_h = (size_0x5.h - border_0x5.y)

    local x_offset_bordered = edge_mon_w + 1
    local y_offset_bordered = edge_mon_h + 1

    local ending_x = false  ---@type false|integer
    local ending_y = false  ---@type false|integer

    local color_a = colors.white
    local color_b = colors.blue
    local color_ends = colors.lightBlue

    for ry = 1, h do
        monitor.setCursorPos(1, ry)

        if ending_y ~= false or ry > 80 then
            -- do nothing
        elseif ry <= edge_mon_h then
            color_ends = colors.green
            color_a = colors.lightBlue
            color_b = colors.cyan
        elseif (ry - y_offset_bordered) % size_0x5.h == 0 then
            if ry + edge_mon_h + size_0x5.h - 1 > math.min(80, h) then
                ending_y = ry + edge_mon_h
                color_ends = colors.green
                color_a = colors.lightBlue
                color_b = colors.cyan
            elseif color_ends == colors.lightBlue then
                color_ends = colors.cyan
                color_a = colors.blue
                color_b = colors.white
            else
                color_ends = colors.lightBlue
                color_a = colors.white
                color_b = colors.blue
            end
        end

        for rx = 1, w do
            if (ending_x ~= false and rx >= ending_x) or (ending_y ~= false and ry >= ending_y) then
                monitor_color = colors.yellow
            elseif rx <= edge_mon_w then
                monitor_color = color_ends
            elseif (rx - x_offset_bordered) % size_0x5.w == 0 then
                if rx + edge_mon_w + size_0x5.w - 1 > math.min(162, w) then
                    ending_x = rx + edge_mon_w
                    monitor_color = color_ends
                elseif monitor_color == color_a then
                    monitor_color = color_b
                else
                    monitor_color = color_a
                end
            end

            alternator = not alternator
            if alternator then
                monitor.setBackgroundColor(monitor_color)
            else
                monitor.setBackgroundColor(colors.black)
            end
            monitor.write(" ")
        end
        if w % 2 == 0 then alternator = not alternator end
    end

    local need_s = "                     "
    local need_w = "   " .. min_w .. " monitors wide   "
    local need_h = "   " .. min_h .. " monitors tall   "
    local pad_l = (w - string.len(need_s)) / 2
    local pad_t = (h - 4) / 2

    monitor.setBackgroundColor(colors.lightGray)
    monitor.setTextColor(colors.black)

    monitor.setCursorPos(pad_l, pad_t)
    monitor.write(need_s)

    monitor.setCursorPos(pad_l, pad_t + 1)
    monitor.write(need_w)

    monitor.setCursorPos(pad_l, pad_t + 2)
    monitor.write(need_h)

    monitor.setCursorPos(pad_l, pad_t + 3)
    monitor.write(need_s)
end

-- get all monitors
for i = 1, #names do
    if peripheral.getType(names[i]) == "monitor" then
        monitors[names[i]] = peripheral.wrap(names[i])
        draw_guide(monitors[names[i]], names[i])
    end
end

-- main loop
while true do
---@diagnostic disable-next-line: undefined-field
    local event, id = os.pullEvent()

    if event == "monitor_resize" then
        draw_guide(monitors[id], id)
    end
end
