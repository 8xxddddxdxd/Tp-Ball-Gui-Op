
-- Create the GUI
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")
local corner = Instance.new("UICorner") -- للدائرة

-- Properties
ScreenGui.Name = "TeleportBallGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Button.Name = "Button"
Button.Parent = ScreenGui
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.Position = UDim2.new(1, -120, 0, 20) -- فوق يمين
Button.Size = UDim2.new(0, 80, 0, 80) -- حجم متوسط
Button.Font = Enum.Font.Cartoon
Button.Text = "⚽"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.BorderSizePixel = 0
Button.Active = true
Button.Draggable = false

-- شكل دائري
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = Button

-- Script to handle button click
local function onButtonClick()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local field = game.Workspace:FindFirstChild("FootballField")

    if field then
        local ball = field:FindFirstChild("SoccerBall")

        if character and ball then
            local humRootPart = character:FindFirstChild("HumanoidRootPart")

            if humRootPart then
                local direction = humRootPart.CFrame.LookVector
                local distance = 3
                local newPosition = humRootPart.Position + (direction * distance)
                ball.CFrame = CFrame.new(newPosition)
            end
        end
    end
end

Button.MouseButton1Click:Connect(onButtonClick)
