-- get path
local file = fs.open("_path.txt", "r")
local path = file.readAll()
file.close()

-- set ID
---@diagnostic disable-next-line: undefined-field
os.setComputerLabel("pocket")

-- mount peripherals
periphemu.create("back", "modem")

-- mount directories
mounter.mount("pocket", path .. "/pocket/", true)
mounter.mount("scada-common", path .. "/scada-common/", true)
mounter.mount("graphics", path .. "/graphics/", true)
mounter.mount("lockbox", path .. "/lockbox/", true)

-- have the user adjust the computer size to a pocket size
shell.execute("resizehelper")
