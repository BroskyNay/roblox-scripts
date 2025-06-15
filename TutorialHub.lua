local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TEST SC GAG"
ScreenGui.ResetOnSpawn = false
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = CoreGui

-- Main Window Frame
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 500, 0, 300)
Main.Position = UDim2.new(0.5, -250, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui
Main.Active = true
Main.Draggable = true

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "TEST SC GAG"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Main

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 18
CloseBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
CloseBtn.Parent = Main

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Left Tab (Side Panel)
local SidePanel = Instance.new("Frame")
SidePanel.Size = UDim2.new(0, 120, 1, -30)
SidePanel.Position = UDim2.new(0, 0, 0, 30)
SidePanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SidePanel.Parent = Main

-- Main Panel
local ContentPanel = Instance.new("Frame")
ContentPanel.Size = UDim2.new(1, -120, 1, -30)
ContentPanel.Position = UDim2.new(0, 120, 0, 30)
ContentPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ContentPanel.Parent = Main

-- AutoFarm Button in Side Panel
local AutoFarm = Instance.new("TextButton")
AutoFarm.Size = UDim2.new(1, 0, 0, 40)
AutoFarm.Position = UDim2.new(0, 0, 0, 10)
AutoFarm.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoFarm.Text = "⚙️ AutoFarm"
AutoFarm.TextColor3 = Color3.new(1, 1, 1)
AutoFarm.Font = Enum.Font.SourceSansBold
AutoFarm.TextSize = 16
AutoFarm.Parent = SidePanel

-- Functionality Placeholder
AutoFarm.MouseButton1Click:Connect(function()
    warn("AutoFarm button clicked!")
    -- your autofarm logic can go here
end)
