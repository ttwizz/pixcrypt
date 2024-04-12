--[[
    pixCrypt
    Key-based Encryption & Decryption Library
    ttwizz.su/pix

    Author: ttwiz_z (ttwizz)
    License: MIT
    GitHub: https://github.com/ttwizz/pixCrypt
]]


local pixCrypt = {}


function pixCrypt:Encrypt(Key, String)
    assert(type(Key) == "string", "Argument 1 (Key) must be a string")
    assert(type(String) == "string", "Argument 2 (String) must be a string")

    local Summand = #Key + math.pi * 4.3579
    local Result = ""

    for Character in string.gmatch(Key, ".") do
        Summand = Summand + string.byte(Character) / 1.8602
    end
    for Character in string.gmatch(String, ".") do
        Result = Result .. string.byte(Character) / 2.1748 + Summand .. "xip"
    end

    return string.gsub(string.reverse(string.sub(Result, 1, -4)), "%.", "$")
end

function pixCrypt:Decrypt(Key, String)
    assert(type(Key) == "string", "Argument 1 (Key) must be a string")
    assert(type(String) == "string", "Argument 2 (String) must be a string")

    local Summand = #Key + math.pi * 4.3579
    local Result = ""

    for Character in string.gmatch(Key, ".") do
        Summand = Summand + string.byte(Character) / 1.8602
    end
    for Character in string.gmatch(string.gsub(string.reverse(String), "%$", "."), "([^xip]+)") do
        Result = Result .. string.char(math.floor((Character - Summand) * 2.1748 + 0.5))
    end

    return Result
end


return pixCrypt
