
-- 🧠 Services
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

---------------------------------------------------------
-- 🟡 1. OrionLib UI Section
---------------------------------------------------------
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local OrionWindow = OrionLib:MakeWindow({
    Name = "Orion Hub | Rejoin Test",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "RejoinTest1"
})

local RejoinTab = OrionWindow:MakeTab({
    Name = "Rejoin",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

RejoinTab:AddButton({
    Name = "🔁 Rejoin Game (OrionLib)",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, player)
    end
})

OrionLib:Init()

---------------------------------------------------------
-- 🟢 2. Custom UI Section (No Library)
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomUI"
ScreenGui.ResetOnSpawn = false
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = game:GetService("CoreGui")

-- Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 420, 0, 180)
Main.Position = UDim2.new(0.5, -210, 0.5, -90)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

-- TopBar
local TopBar = Instance.new("TextLabel", Main)
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TopBar.Text = "Custom UI | Rejoin Test"
TopBar.Font = Enum.Font.SourceSansBold
TopBar.TextColor3 = Color3.new(1, 1, 1)
TopBar.TextSize = 18

-- Button
local RejoinButton = Instance.new("TextButton", Main)
RejoinButton.Size = UDim2.new(0, 180, 0, 40)
RejoinButton.Position = UDim2.new(0.5, -90, 0.5, -20)
RejoinButton.Text = "🔁 Rejoin Game (Custom)"
RejoinButton.BackgroundColor3 = Color3.fromRGB(40, 100, 200)
RejoinButton.TextColor3 = Color3.new(1, 1, 1)
RejoinButton.Font = Enum.Font.SourceSansBold
RejoinButton.TextSize = 18
RejoinButton.BorderSizePixel = 0

-- Function
RejoinButton.MouseButton1Click:Connect(function()
    TeleportService:Teleport(game.PlaceId, player)
end)
