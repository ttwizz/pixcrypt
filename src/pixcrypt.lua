--[[
    pixcrypt
    Key-based Encryption & Decryption Library
    twix.cyou/pix

    Author: ttwiz_z (ttwizz)
    License: MIT
    GitHub: https://github.com/ttwizz/pixcrypt
]]


local pixcrypt = {Secret = 2773480762}


function pixcrypt:Encrypt(Key, String)
    assert(type(Key) == "string", "Argument 1 (Key) must be a string")
    assert(type(String) == "string", "Argument 2 (String) must be a string")

    local Summand = #Key + math.pi * 4.3579
    local Result = ""
    local Index = 1

    for Character in string.gmatch(Key, ".") do
        Summand = Summand + string.byte(Character) / 1.8602
    end
    for Character in string.gmatch(String, ".") do
        Result = Result .. string.byte(Character) / 2.1748 + Summand * (pixcrypt.Secret / Index) .. "xip"
        Index = Index + 1
    end

    return string.gsub(string.reverse(string.sub(Result, 1, -4)), "%.", "$")
end


function pixcrypt:Decrypt(Key, String)
    assert(type(Key) == "string", "Argument 1 (Key) must be a string")
    assert(type(String) == "string", "Argument 2 (String) must be a string")

    local Summand = #Key + math.pi * 4.3579
    local Result = ""
    local Index = 1

    for Character in string.gmatch(Key, ".") do
        Summand = Summand + string.byte(Character) / 1.8602
    end
    for Character in string.gmatch(string.gsub(string.reverse(String), "%$", "."), "([^xip]+)") do
        Result = Result .. string.char(math.floor((Character - Summand * (pixcrypt.Secret / Index)) * 2.1748 + 0.5))
        Index = Index + 1
    end

    return Result
end


return pixcrypt
