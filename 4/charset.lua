-- print out the CC character set
-- this is on most computers for ease-of-access

term.clear()
term.setCursorPos(1, 1)
term.setTextColor(colors.white)
term.setBackgroundColor(colors.lightGray)
term.write(" ")
term.setCursorPos(2, 1)
term.write(" ")

local hex = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}

for i = 1, #hex do
    term.write(" " .. hex[i])
end

term.setCursorPos(1, 2)
for i = 0, 15 do
    term.setTextColor(colors.white)
    term.setBackgroundColor(colors.lightGray)
    term.write(hex[i + 1] .. "_")
    term.setBackgroundColor(colors.black)
    for j = 0, 15 do
        term.write(" " .. string.char(i * 16 + j))
    end
    term.setCursorPos(1, i + 3)
end
