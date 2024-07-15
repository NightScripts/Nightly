function loadNightly()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/NightScripts/Nightly/main/Module.lua"))()
end

function init()
    local module = loadNightly()
    module.load()
    print("Loaded:", module.get())
end

init()
