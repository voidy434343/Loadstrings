-- i hate this script

fuwwyon = true

local replaceWords = {
    ["hi"] = "hai",
    ["hello"] = "hai",
    ["furry"] = "fuwwy",
    ["hate"] = "hwte",
    ["no"] = "nwo",
    ["well"] = "wewll",
    ["hell"] = "hewll",
    ["heck"] = "hewk",
    ["better"] = "bwtter",
    ["ill"] = "iwll",
    ["dude"] = "duwd",
    ["guys"] = "guwys",
    ["cool"] = "coowl",
    ["new"] = "nwew",
    ["cute"] = "cwte",
    ["shut"] = "shwt",
    ["up"] = "uwp",
    ["pup"] = "puwp",
    ["puppy"] = "puppwy",
    ["why"] = "whwy",
    ["what"] = "whwt",
    ["and"] = "awnd",
    ["help"] = "hewlp",
    ["like"] = "liwke",
    ["speak"] = "spweak",
    ["here"] = "hewe",
    ["favorite"] = "favworite",
    ["duck"] = "duwk",
    ["cat"] = "cwt",
    ["fur"] = "fuwr",
    ["fursuit"] = "fuwrsuwit",
    ["suit"] = "suwit",
    ["like"] = "liwke",
    ["you"] = "yowu",
    ["run"] = "ruwn",
    [":D"] = ":3",
    [">:)"] = ">:3",
    ["your"] = "yowur",
    ["youre"] = "yowure",
    ["little"] = "liwtle",
    ["aww"] = "aww :3",
    ["aw"] = "aw :3",
    ["back"] = "bwck"
}

oldnc = hookmetamethod(game,"__namecall",function(...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" and tostring(args[1]) == "SayMessageRequest" then
        local a = string.sub(args[2],1,1)
        local oldstring = string.sub(args[2],2)
        oldstring = a:upper()..oldstring
        args[2] = oldstring
        local new = string.split(args[2]," ")
        for i, v in pairs(new) do
            pcall(function() -- pcall so roblox doesnt cry
            local v = v:lower()
            if replaceWords[v] then
                if new[i] == new[1] then
                    local word = replaceWords[v]
                    local a = string.sub(word,1,1)
                    local old = string.sub(word,2)
                    
                    new[i] = a:upper()..old
                    else
                    new[i] = replaceWords[v]
                end
            end
        end)
        end

        local string = ""
        for i, v in pairs(new) do
            if new[i] == new[1] then
                string = string..v
                else
                string = string.." "..v
            end
            
        end
        local last = string.sub(string,string.len(string),string.len(string)) 
            args[2] = string..""
            local rng = math.random(1,4)
            if rng == 1 then
                args[2] = string..". Uwu!"
            end
            if rng == 2 then
                args[2] = string..". owo!"
            end
        
        return oldnc(unpack(args))
    end
    return oldnc(...)
end)