local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/venosuity/UILibrary/main/source.lua"))()
local win = library:Window("R7 Hub - Blox Fruits", "discord.gg/r7-hub", Color3.fromRGB(20, 20, 20))

local mainTab = win:Tab("Main Farm")
local stackTab = win:Tab("Stack Auto farm")
local subFarmTab = win:Tab("Sub Farming")
local statusTab = win:Tab("Status")
local fruitTab = win:Tab("Fruit")
local localTab = win:Tab("Local Player")
local travelTab = win:Tab("Travel")

-- Main Farm Features
mainTab:Toggle("Auto Katakuri", false, function(v)
    _G.AutoKatakuri = v
    while _G.AutoKatakuri do wait()
        for _, boss in pairs(workspace.Enemies:GetChildren()) do
            if boss.Name == "Cake Prince" or boss.Name == "Dough King" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", boss)
            end
        end
    end
end)

mainTab:Toggle("Auto Bone", false, function(v)
    _G.AutoBone = v
    while _G.AutoBone do wait()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BoneQuest", "Start")
    end
end)

mainTab:Toggle("Kill Aura", false, function(v)
    _G.KillAura = v
    while _G.KillAura do wait()
        for _, mob in pairs(workspace.Enemies:GetChildren()) do
            if mob:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", mob)
            end
        end
    end
end)

mainTab:Toggle("Fully Auto Dough King", false, function(v)
    _G.AutoDoughKing = v
    while _G.AutoDoughKing do wait()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChalice")
    end
end)

-- Stack Auto Farm
stackTab:Label("Enable Stack Farming Features")
stackTab:Toggle("Stack Auto Farm", false, function(v)
    _G.StackFarm = v
end)

-- Sub Farming
subFarmTab:Toggle("Advanced Mob Farm", false, function(v)
    _G.AdvancedFarm = v
    while _G.AdvancedFarm do wait()
        for _, mob in pairs(workspace.Enemies:GetChildren()) do
            if mob:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
            end
        end
    end
end)

-- Fruit Features
fruitTab:Button("Store All Fruits", function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit")
end)

fruitTab:Button("Auto Equip Best Fruit", function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EquipFruit", "Best")
end)

-- Local Player Features
localTab:Toggle("Infinite Energy", false, function(v)
    _G.InfiniteEnergy = v
    while _G.InfiniteEnergy do wait()
        game.Players.LocalPlayer.Character.Energy.Value = math.huge
    end
end)

localTab:Slider("WalkSpeed", 16, 300, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

localTab:Slider("Jump Power", 50, 500, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

localTab:Toggle("No Clip", false, function(v)
    _G.NoClip = v
    while _G.NoClip do wait()
        for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Travel Features
travelTab:Button("Teleport to Sea 1", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5000, 0, 5000) -- Replace with Sea 1 location
end)

travelTab:Button("Teleport to Sea 2", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(10000, 0, 10000) -- Replace with Sea 2 location
end)

travelTab:Button("Teleport to Sea 3", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(15000, 0, 15000) -- Replace with Sea 3 location
end)
