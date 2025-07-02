-- تصميم Made By Team EVIL
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local introGui = Instance.new("ScreenGui", CoreGui)
introGui.Name = "IntroGuiByTeamEVIL"
introGui.ResetOnSpawn = false

local circle = Instance.new("ImageLabel", introGui)
circle.Size = UDim2.new(0, 200, 0, 200)
circle.Position = UDim2.new(1, -220, 0.5, -100)
circle.AnchorPoint = Vector2.new(0.5, 0.5)
circle.BackgroundTransparency = 1
circle.Image = "rbxassetid://13762329803" -- دائرة جاهزة

local text = Instance.new("TextLabel", circle)
text.Size = UDim2.new(1, 0, 1, 0)
text.BackgroundTransparency = 1
text.Text = "Made By Team EVIL"
text.TextScaled = true
text.Font = Enum.Font.GothamBold
text.TextColor3 = Color3.fromRGB(255, 0, 0)

local spinning = true
task.spawn(function()
	while spinning do
		circle.Rotation = circle.Rotation + 5
		task.wait(0.01)
	end
end)

TweenService:Create(circle, TweenInfo.new(1, Enum.EasingStyle.Back), {
	Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

wait(2)
spinning = false

TweenService:Create(circle, TweenInfo.new(1, Enum.EasingStyle.Sine), {
	Position = UDim2.new(0.5, 0, 1.5, 0)
}):Play()

wait(1.2)
introGui:Destroy()

-- =========================
-- زر نقل الكرة (Teleport Ball) دائري فوق يمين الشاشة
-- =========================

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
