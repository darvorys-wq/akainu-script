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
MainFrame.Size = UDim2.new(0, 240, 0, 255)
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

local function createBox(pos, text)
    local box = Instance.new("TextBox", MainFrame)
    box.Size = UDim2.new(0.8, 0, 0, 30)
    box.Position = pos
    box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.Text = text
    box.ClearTextOnFocus = true
    return box
end

-- الثلاث قوائم (صناديق إدخال الأرقام)
local HourBox = createBox(UDim2.new(0.1, 0, 0.18, 0), "88")
local MinuteBox = createBox(UDim2.new(0.1, 0, 0.34, 0), "6")
local SecondBox = createBox(UDim2.new(0.1, 0, 0.50, 0), "5")

local ApplyButton = Instance.new("TextButton", MainFrame)
ApplyButton.Size = UDim2.new(0.8, 0, 0, 35)
ApplyButton.Position = UDim2.new(0.1, 0, 0.75, 0)
ApplyButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyButton.Text = "Apply Custom Info"
ApplyButton.Font = Enum.Font.SourceSansBold
ApplyButton.TextSize = 16

-- نظام التزوير والمراقبة لصيغة الوقت الرقمي
local startHours = 88
local startMinutes = 6
local startSeconds = 5
local totalSeconds = (startHours * 3600) + (startMinutes * 60) + startSeconds
local startTime = os.clock()
local isActivated = false 

local function formatAndApply(child)
    if not isActivated then return end 
    local elapsedTime = os.clock() - startTime
    local currentTime = totalSeconds + math.floor(elapsedTime)
    local hours = math.floor(currentTime / 3600)
    local minutes = math.floor((currentTime % 3600) / 60)
    local seconds = currentTime % 60
    child.Text = string.format("%d:%02d:%02d", hours, minutes, seconds)
end

local function watchGui(parent)
    pcall(function()
        for _, child in pairs(parent:GetChildren()) do
            if child:IsA("TextLabel") then
                if string.find(child.Text, "^%d+:%d+:%d+$") or child.Name == "Time" then
                    formatAndApply(child)
                    child:GetPropertyChangedSignal("Text"):Connect(function()
                        formatAndApply(child)
                    end)
                end
            end
            watchGui(child)
