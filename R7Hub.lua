local UIS = game:GetService("UserInputService")
local tween = game:GetService("TweenService")
local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local rs = game:GetService("RunService")

-- GUI Framework Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "R7Hub"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 500)
Frame.Position = UDim2.new(0.5, -200, 0.5, -250)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "R7 Hub - Blox Fruits"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24

local MainTab = Instance.new("ScrollingFrame", Frame)
MainTab.Size = UDim2.new(1, 0, 1, -50)
MainTab.Position = UDim2.new(0, 0, 0, 50)
MainTab.BackgroundTransparency = 1
MainTab.ScrollBarThickness = 6

local function AddButton(name, func)
    local Button = Instance.new("TextButton", MainTab)
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 20
    Button.MouseButton1Click:Connect(func)
end

-- FEATURES

-- Auto Farm Katakuri (Dough King)
AddButton("Auto Katakuri Farm", function()
    while wait() do
        for _, v in pairs(workspace.Enemies:GetChildren()) do
            if v.Name == "Dough King" or v.Name == "Cake Prince" then
                chr.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", v)
            end
        end
    end
end)

-- Auto Bone Farm
AddButton("Auto Bone Farm", function()
    while wait() do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BoneQuest", "Start")
    end
end)

-- Kill Aura
AddButton("Kill Aura (Mobs Near)", function()
    while wait(0.1) do
        for _, v in pairs(workspace.Enemies:GetChildren()) do
            if (v.HumanoidRootPart.Position - chr.HumanoidRootPart.Position).Magnitude < 50 then
                chr.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", v)
            end
        end
    end
end)

-- Sea Events Auto-Farm
AddButton("Auto Sea Events", function()
    while wait() do
        for _, v in pairs(workspace.SeaEvents:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                chr.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Attack", v)
            end
        end
    end
end)

-- Teleport to Seas
AddButton("Teleport to Sea 1", function()
    chr.HumanoidRootPart.CFrame = CFrame.new(5000, 0, 5000)
end)

AddButton("Teleport to Sea 2", function()
    chr.HumanoidRootPart.CFrame = CFrame.new(10000, 0, 10000)
end)

AddButton("Teleport to Sea 3", function()
    chr.HumanoidRootPart.CFrame = CFrame.new(15000, 0, 15000)
end)

-- Auto Accessory Buy
AddButton("Auto Buy Accessories", function()
    local accessories = {"Bandana", "Hunter Cape", "Warrior Helmet"}
    for _, acc in pairs(accessories) do
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", acc)
    end
end)

-- Infinite Energy
AddButton("Infinite Energy", function()
    while wait() do
        chr.Energy.Value = math.huge
    end
end)

-- WalkSpeed Toggle
AddButton("Set WalkSpeed to 200", function()
    chr.Humanoid.WalkSpeed = 200
end)

-- Teleport to Mirage Island
AddButton("Teleport to Mirage Island", function()
    chr.HumanoidRootPart.CFrame = CFrame.new(30000, 0, 30000)
end)

-- Unlock Race V4
AddButton("Unlock Race V4", function()
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UnlockRaceV4")
end)
