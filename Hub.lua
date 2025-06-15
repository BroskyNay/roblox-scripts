--====================================================
--  CUSTOM HUB  |  now with a Rejoin button in content
--====================================================

--// Services
local Players          = game:GetService("Players")
local TeleportService  = game:GetService("TeleportService")
local LocalPlayer      = Players.LocalPlayer
local CoreGui          = game:GetService("CoreGui")

--// Root GUI ------------------------------------------------
local HubGui = Instance.new("ScreenGui")
HubGui.Name = "TutorialHubUI"
HubGui.ResetOnSpawn = false
if syn and syn.protect_gui then syn.protect_gui(HubGui) end
HubGui.Parent = CoreGui   -- put straight into CoreGui so every executor sees it

--// Main draggable window -----------------------------------
local Main = Instance.new("Frame", HubGui)
Main.Size = UDim2.new(0, 600, 0, 350)
Main.Position = UDim2.new(0.5, -300, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

--// Title bar -----------------------------------------------
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "TEST SC GAG"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold

-- Close “X” button
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

--// Sidebar -------------------------------------------------
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, -30)
Side.Position = UDim2.new(0, 0, 0, 30)
Side.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

-- Sidebar button (your icon + label)
local AutoBtn = Instance.new("TextButton", Side)
AutoBtn.Size = UDim2.new(1, 0, 0, 40)
AutoBtn.Position = UDim2.new(0, 0, 0, 10)
AutoBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoBtn.Text = "⚙️  Auto Rejoin"
AutoBtn.TextColor3 = Color3.new(1,1,1)
AutoBtn.Font = Enum.Font.SourceSansBold
AutoBtn.TextSize = 16

--// Content area --------------------------------------------
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -140, 1, -30)
Content.Position = UDim2.new(0, 140, 0, 30)
Content.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

----------------------------------------------------------------
--  NEW ▸ Rejoin button INSIDE the content panel
----------------------------------------------------------------
local RejoinBtn = Instance.new("TextButton", Content)
RejoinBtn.Size = UDim2.new(0, 150, 0, 45)
RejoinBtn.Position = UDim2.new(0, 20, 0, 20)
RejoinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
RejoinBtn.BorderSizePixel   = 0
RejoinBtn.Text              = "🔁  REJOIN"
RejoinBtn.TextColor3        = Color3.new(1,1,1)
RejoinBtn.TextSize          = 20
RejoinBtn.Font              = Enum.Font.SourceSansBold
RejoinBtn.Active            = true

RejoinBtn.MouseButton1Click:Connect(function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

-- Auto Buy Seed button
local BuySeedBtn = Instance.new("TextButton", Side)
BuySeedBtn.Size = UDim2.new(1, 0, 0, 40)
BuySeedBtn.Position = UDim2.new(0, 0, 0, 60) -- below Auto Rejoin
BuySeedBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BuySeedBtn.Text = "🌱 Auto Buy Seed"
BuySeedBtn.TextColor3 = Color3.new(1, 1, 1)
BuySeedBtn.Font = Enum.Font.SourceSansBold
BuySeedBtn.TextSize = 16

-- Auto Buy Logic (toggle on/off)
local buying = false

BuySeedBtn.MouseButton1Click:Connect(function()
    buying = not buying
    BuySeedBtn.Text = buying and "✅ Buying Seeds..." or "🌱 Auto Buy Seed"
    
    if buying then
        -- Start a coroutine so it doesn't freeze the UI
        coroutine.wrap(function()
            while buying do
                pcall(function()
                    -- EDIT THIS: Replace with the actual Remote path and args
                    local remote = game:GetService("ReplicatedStorage"):WaitForChild("BuySeed")
                    remote:FireServer("Tomato", 1) -- (seedName, amount)
                end)
                wait(2) -- Adjust delay as needed
            end
        end)()
    end
end)

----------------------------------------------------------------
--  OPTIONAL ▸ hook sidebar button to open this page
----------------------------------------------------------------
AutoBtn.MouseButton1Click:Connect(function()
    -- if you add more pages later, toggle them here
    Content.Visible = true
end)
