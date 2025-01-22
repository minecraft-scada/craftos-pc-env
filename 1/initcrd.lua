-- get path
local file = fs.open("_path.txt", "r")
local path = file.readAll()
file.close()

-- set ID
---@diagnostic disable-next-line: undefined-field
os.setComputerLabel("Coordinator")

-- mount peripherals
periphemu.create(1, "monitor")
periphemu.create(2, "monitor")
periphemu.create(3, "monitor")
periphemu.create(4, "monitor")
periphemu.create("left", "monitor")
periphemu.create("right", "monitor")
periphemu.create("back", "modem")
periphemu.create("top", "speaker")

-- wait a sec since sometimes monitors won't setup right otherwise
---@diagnostic disable-next-line: undefined-field
os.sleep(1)

--#region resize monitors

local m = peripheral.wrap("left")
m.setBlockSize(8, 6)

local f = peripheral.wrap("right")
f.setBlockSize(8, 6)

for i = 1, 4 do
    local u = peripheral.wrap("monitor_" .. i)
    u.setBlockSize(4, 4)
end

--#endregion

-- mount directories
mounter.mount("coordinator", path .. "/coordinator/", true)
mounter.mount("scada-common", path .. "/scada-common/", true)
mounter.mount("graphics", path .. "/graphics/", true)
mounter.mount("lockbox", path .. "/lockbox/", true)
