local Nightly = {}

function retjs(url)
    local resp = game:HttpGet(url)
    local https = game:GetService("HttpService")
    return https:JSONDecode(resp)
end

function retpurl(placeId, gd)
    return gd[tostring(placeId)]
end

function exeps(url)
    if url then
        local sc = game:HttpGet(url)
        loadstring(sc)()
    else
        error("Invalid Place ID or URL not found")
    end
end

function Nightly.load()
    local jsurl = "https://raw.githubusercontent.com/NightScripts/Nightly/main/Games.json"
    local gd = retjs(jsurl)
    local placeId = game.PlaceId
    local psu = retpurl(placeId, gd)
    exeps(psu)
end

function Nightly.get()
    local executor = identifyexecutor()
    local pi = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    return executor .. " Nightly Loaded: " .. pi.Name
end

return Nightly
