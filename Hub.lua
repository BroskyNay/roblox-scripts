--====================================================
--  CUSTOM HUB  |  Rejoin + Auto Buy Seed (Carrot)
--====================================================

--// Services
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

--// Root GUI
local HubGui = Instance.new("ScreenGui")
HubGui.Name = "TutorialHubUI"
HubGui.ResetOnSpawn = false
if syn and syn.protect_gui then syn.protect_gui(HubGui) end
HubGui.Parent = CoreGui

--// Main Window
local Main = Instance.new("Frame", HubGui)
Main.Size = UDim2.new(0, 600, 0, 350)
Main.Position = UDim2.new(0.5, -300, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

-- Title Bar
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "TEST SC GAG"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold

-- Close Button
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -30, 0, 0)
Close.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.Font = Enum.Font.SourceSansBold
Close.TextSize = 18
Close.MouseButton1Click:Connect(function()
    HubGui:Destroy()
end)

-- Sidebar
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, -30)
Side.Position = UDim2.new(0, 0, 0, 30)
Side.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

-- Content Area
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -140, 1, -30)
Content.Position = UDim2.new(0, 140, 0, 30)
Content.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

-- Tab Button Logic
AutoBtn.MouseButton1Click:Connect(function()
    Content.Visible = true
end)
