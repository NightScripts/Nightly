local NightHit = loadstring(game:HttpGet("https://raw.githubusercontent.com/NightScripts/Nightly/main/Universal/Hitbox/Module.lua"))()

local Players = game:GetService'Players'
local RunService = game:GetService'RunService'
local Player = Players.LocalPlayer

local function Config(n)
    pcall(function()
        local hrp = n.Character and n.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Size = Vector3.new(NightHit.Config.BoxSize, NightHit.Config.BoxSize, NightHit.Config.BoxSize)
            hrp.Transparency = NightHit.Config.BoxTransparency
            hrp.BrickColor = BrickColor.new(NightHit.Config.BoxColor)
            hrp.Material = NightHit.Config.BoxMaterial
            hrp.CanCollide = false
        end
    end)
end

local function Apply()
    for _, n in next, Players:GetPlayers() do
        if n ~= Player then
            if NightHit.Config.BoxActive and not NightHit.Config.TeamCheck then
                Config(n)
            elseif NightHit.Config.BoxActive and NightHit.Config.TeamCheck then
                if Player.Team ~= n.Team then
                    Config(n)
                end
            else
                NightHit.Config.BoxSize = 2
                NightHit.Config.BoxTransparency = 1
                NightHit.Config.BoxColor = "Medium stone grey"
                NightHit.Config.BoxMaterial = "Plastic"
                Config(n)
            end
        end
    end
end

RunService.RenderStepped:Connect(Apply)
