-- get path
local file = fs.open("_path.txt", "r")
local path = file.readAll()
file.close()

-- set ID
---@diagnostic disable-next-line: undefined-field
os.setComputerLabel("supervisor")

-- mount peripherals
periphemu.create("back", "modem")

-- mount directories
mounter.mount("supervisor", path .. "/supervisor/", true)
mounter.mount("scada-common", path .. "/scada-common/", true)
mounter.mount("graphics", path .. "/graphics/", true)
mounter.mount("lockbox", path .. "/lockbox/", true)
