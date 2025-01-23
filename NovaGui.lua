-- NovaGui Library
local NovaGui = {}

function NovaGui:CreateWindow(Title)
    -- Main UI Frame
    local MainUI = Instance.new("ScreenGui")
    MainUI.Name = "NovaGui"
    MainUI.Parent = game:GetService("CoreGui")
    MainUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MainUI
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    MainFrame.Size = UDim2.new(0, 400, 0, 300)

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = MainFrame

    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0, 30)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TitleBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, 0, 1, 0)
    TitleLabel.Font = Enum.Font.SourceSans
    TitleLabel.Text = Title or "NovaGui"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 18

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = TitleBar
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 5)
    MinimizeButton.Size = UDim2.new(0, 50, 0, 20)
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 18

    local DestroyButton = Instance.new("TextButton")
    DestroyButton.Name = "DestroyButton"
    DestroyButton.Parent = TitleBar
    DestroyButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    DestroyButton.Position = UDim2.new(1, -115, 0, 5)
    DestroyButton.Size = UDim2.new(0, 50, 0, 20)
    DestroyButton.Font = Enum.Font.SourceSans
    DestroyButton.Text = "X"
    DestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DestroyButton.TextSize = 18

    -- Container for Tabs
    local Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Parent = MainFrame
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(1, 0, 1, -30)
    Container.Position = UDim2.new(0, 0, 0, 30)

    -- Minimize Logic
    local minimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            for _, child in ipairs(MainFrame:GetChildren()) do
                if child ~= TitleBar then
                    child.Visible = false
                end
            end
            MainFrame.Size = UDim2.new(0, 400, 0, 30)
        else
            for _, child in ipairs(MainFrame:GetChildren()) do
                child.Visible = true
            end
            MainFrame.Size = UDim2.new(0, 400, 0, 300)
        end
    end)

    -- Destroy Logic
    DestroyButton.MouseButton1Click:Connect(function()
        MainUI:Destroy()
    end)

    -- Draggable Frame
    local UIS = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    local Library = {}

    function Library:AddTab(Name)
        local Tab = Instance.new("Frame")
        Tab.Name = Name
        Tab.Parent = Container
        Tab.BackgroundTransparency = 1
        Tab.Size = UDim2.new(1, 0, 1, 0)
        Tab.Visible = false

        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = TitleBar
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.Size = UDim2.new(0, 100, 0, 20)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = Name
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 18

        TabButton.MouseButton1Click:Connect(function()
            for _, child in ipairs(Container:GetChildren()) do
                child.Visible = false
            end
            Tab.Visible = true
        end)

        local TabLibrary = {}

        function TabLibrary:AddButton(Text, Callback)
            local Button = Instance.new("TextButton")
            Button.Name = Text
            Button.Parent = Tab
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Button.Size = UDim2.new(0, 200, 0, 30)
            Button.Font = Enum.Font.SourceSans
            Button.Text = Text
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 18

            Button.MouseButton1Click:Connect(Callback)
        end

        function TabLibrary:AddSlider(Text, Min, Max, Default, Callback)
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Name = Text
            SliderFrame.Parent = Tab
            SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SliderFrame.Size = UDim2.new(0, 200, 0, 50)

            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Parent = SliderFrame
            SliderLabel.Text = Text
            SliderLabel.Font = Enum.Font.SourceSans
            SliderLabel.TextSize = 16
            SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.Size = UDim2.new(1, 0, 0.5, 0)

            local SliderInput = Instance.new("TextBox")
            SliderInput.Parent = SliderFrame
            SliderInput.Text = tostring(Default)
            SliderInput.Font = Enum.Font.SourceSans
            SliderInput.TextSize = 16
            SliderInput.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderInput.Size = UDim2.new(1, 0, 0.5, -10)
            SliderInput.Position = UDim2.new(0, 0, 0.5, 0)

            SliderInput.FocusLost:Connect(function()
                local Value = tonumber(SliderInput.Text)
                if Value then
                    Value = math.clamp(Value, Min, Max)
                    Callback(Value)
                end
            end)
        end

        return TabLibrary
    end

    return Library
end

return NovaGui
