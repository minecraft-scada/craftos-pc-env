-- get path
local file = fs.open("_path.txt", "r")
local path = file.readAll()
file.close()

-- set ID
---@diagnostic disable-next-line: undefined-field
os.setComputerLabel("RTU Gateway")

-- mount peripherals
periphemu.create("rtu", "modem")

-- mount directories
mounter.mount("rtu", path .. "/rtu/", true)
mounter.mount("scada-common", path .. "/scada-common/", true)
mounter.mount("graphics", path .. "/graphics/", true)
mounter.mount("lockbox", path .. "/lockbox/", true)
