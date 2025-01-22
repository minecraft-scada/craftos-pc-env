-- get path
local file = fs.open("_path.txt", "r")
local path = file.readAll()
file.close()

-- set ID
---@diagnostic disable-next-line: undefined-field
os.setComputerLabel("Reactor PLC")

-- mount peripherals
periphemu.create("back", "modem")

-- mount directories
mounter.mount("reactor-plc", path .. "/reactor-plc/", true)
mounter.mount("scada-common", path .. "/scada-common/", true)
mounter.mount("graphics", path .. "/graphics/", true)
mounter.mount("lockbox", path .. "/lockbox/", true)
