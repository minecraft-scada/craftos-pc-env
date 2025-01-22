local BOOTLOADER_VERSION = "1.2-pc"

print("SCADA BOOTLOADER V" .. BOOTLOADER_VERSION)

--#region craftos-pc specifics
print("BOOT> SCANNING FOR MOUNTS AND CHECKING SIZE...")
local w, h = term.getSize()
if (not fs.exists("lockbox")) or w ~= 26 or h ~= 20 then
    print("BOOT> RUNNING INITPKT...")
    shell.execute("initpkt")
end
--#endregion

local exit_code

if fs.exists("reactor-plc/startup.lua") then
    print("BOOT> EXEC REACTOR PLC STARTUP")
    exit_code = shell.execute("reactor-plc/startup")
elseif fs.exists("rtu/startup.lua") then
    print("BOOT> EXEC RTU STARTUP")
    exit_code = shell.execute("rtu/startup")
elseif fs.exists("supervisor/startup.lua") then
    print("BOOT> EXEC SUPERVISOR STARTUP")
    exit_code = shell.execute("supervisor/startup")
elseif fs.exists("coordinator/startup.lua") then
    print("BOOT> EXEC COORDINATOR STARTUP")
    exit_code = shell.execute("coordinator/startup")
elseif fs.exists("pocket/startup.lua") then
    print("BOOT> EXEC POCKET STARTUP")
    exit_code = shell.execute("pocket/startup")
else
    print("BOOT> NO SCADA STARTUP FOUND")
    print("BOOT> EXIT")
    return false
end

if not exit_code then print("BOOT> APPLICATION CRASHED") end

return exit_code
