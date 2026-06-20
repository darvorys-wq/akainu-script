local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- تنظيف القائمة القديمة لو موجودة
if PlayerGui:FindFirstChild("Akainu_Gui") then PlayerGui.Akainu_Gui:Destroy() end

-- إنشاء قائمة Akainu / اكاينو فوراً وبسرعة البرق
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "Akainu_Gui"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -120, 0.35, -120)
MainFrame.Size = UDim2.new(0, 240, 0, 160) -- تم تعديل الحجم ليناسب الزر الصافي
MainFrame.Draggable = true
MainFrame.Active = true

local TitleLabel = Instance.new("TextLabel", MainFrame)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 5)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
TitleLabel.Text = "🌋 Akainu / اكاينو 🌋"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 18

local InfoLabel = Instance.new("TextLabel", MainFrame)
InfoLabel.Size = UDim2.new(0.9, 0, 0, 40)
InfoLabel.Position = UDim2.new(0.05, 0, 0.25, 0)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoLabel.Text = "اضغط لـتشغيل إنفينيتي ييلد الصافي"
InfoLabel.Font = Enum.Font.SourceSans
InfoLabel.TextSize = 14

local ApplyButton = Instance.new("TextButton", MainFrame)
ApplyButton.Size = UDim2.new(0.8, 0, 0, 35)
ApplyButton.Position = UDim2.new(0.1, 0, 0.6, 0)
ApplyButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyButton.Text = "Run Infinite Yield"
ApplyButton.Font = Enum.Font.SourceSansBold
ApplyButton.TextSize = 16

-- عند الضغط على الزر: يشغل إنفينيتي ييلد لحاله وبس!
ApplyButton.MouseButton1Click:Connect(function()
    ApplyButton.Text = "Loading..."
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeY/infiniteyield/master/source'))()
            ApplyButton.Text = "Done! ✅"
        end)
    end)
end)
