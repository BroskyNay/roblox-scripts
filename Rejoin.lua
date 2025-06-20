-- Services
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "RejoinUI"

local Button = Instance.new("TextButton", ScreenGui)
Button.Size = UDim2.new(0, 120, 0, 40)
Button.Position = UDim2.new(0.5, -60, 0.9, 0)
Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Button.Text = "🔁 REJOIN"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 20
Button.BorderSizePixel = 0
Button.Active = true
Button.Draggable = true

-- Rejoin Logic
Button.MouseButton1Click:Connect(function()
	TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)
