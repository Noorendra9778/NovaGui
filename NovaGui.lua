-- NovaGui UI Library
local NovaGui = {}

-- Main UI creation
function NovaGui:CreateWindow(windowName)
    local UI = {}
    local dragging, dragInput, dragStart, startPos
    local UIS = game:GetService("UserInputService")
    
    -- ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NovaGui"
    ScreenGui.Parent = game.CoreGui

    -- MainFrame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

    -- TitleBar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TitleBar.Size = UDim2.new(1, 0, 0, 30)

    -- TitleLabel
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TitleBar
    TitleLabel.Text = windowName
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 14
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, 0, 1, 0)

    -- MinimizeButton
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = TitleBar
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 14
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
    MinimizeButton.AnchorPoint = Vector2.new(1, 0)

    -- DestroyButton
    local DestroyButton = Instance.new("TextButton")
    DestroyButton.Name = "DestroyButton"
    DestroyButton.Parent = TitleBar
    DestroyButton.Text = "X"
    DestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DestroyButton.TextSize = 14
    DestroyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    DestroyButton.Size = UDim2.new(0, 30, 0, 30)
    DestroyButton.Position = UDim2.new(1, -30, 0, 0)
    DestroyButton.AnchorPoint = Vector2.new(1, 0)

    -- TabsFrame
    local TabsFrame = Instance.new("Frame")
    TabsFrame.Name = "TabsFrame"
    TabsFrame.Parent = MainFrame
    TabsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabsFrame.Size = UDim2.new(0, 100, 1, -30)
    TabsFrame.Position = UDim2.new(0, 0, 0, 30)

    -- TabContent
    local TabContent = Instance.new("Frame")
    TabContent.Name = "TabContent"
    TabContent.Parent = MainFrame
    TabContent.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabContent.Size = UDim2.new(1, -100, 1, -30)
    TabContent.Position = UDim2.new(0, 100, 0, 30)

    -- Dragging functionality
    TitleBar.InputBegan:Connect(function(input)
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

    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Minimize functionality
    local minimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            for _, v in pairs(MainFrame:GetChildren()) do
                if v ~= TitleBar then
                    v.Visible = false
                end
            end
            MainFrame.Size = UDim2.new(0, 400, 0, 30)
        else
            for _, v in pairs(MainFrame:GetChildren()) do
                v.Visible = true
            end
            MainFrame.Size = UDim2.new(0, 400, 0, 300)
        end
    end)

    -- Destroy functionality
    DestroyButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- AddTab function
    function UI:AddTab(tabName)
        local Tab = {}
        
        -- TabButton
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Button"
        TabButton.Parent = TabsFrame
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 14
        TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        
        -- TabContentFrame
        local TabContentFrame = Instance.new("Frame")
        TabContentFrame.Name = tabName .. "Content"
        TabContentFrame.Parent = TabContent
        TabContentFrame.BackgroundTransparency = 1
        TabContentFrame.Size = UDim2.new(1, 0, 1, 0)
        TabContentFrame.Visible = false

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(TabContent:GetChildren()) do
                v.Visible = false
            end
            TabContentFrame.Visible = true
        end)

        -- AddButton function
        function Tab:AddButton(buttonText, callback)
            local Button = Instance.new("TextButton")
            Button.Name = buttonText .. "Button"
            Button.Parent = TabContentFrame
            Button.Text = buttonText
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Button.Size = UDim2.new(0, 200, 0, 30)
            Button.MouseButton1Click:Connect(callback)
        end

        -- AddSlider function
        function Tab:AddSlider(sliderName, minValue, maxValue, callback)
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Name = sliderName .. "Slider"
            SliderFrame.Parent = TabContentFrame
            SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            SliderFrame.Size = UDim2.new(0, 200, 0, 50)
            
            local SliderBar = Instance.new("Frame")
            SliderBar.Name = "SliderBar"
            SliderBar.Parent = SliderFrame
            SliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SliderBar.Size = UDim2.new(0, 180, 0, 10)
            SliderBar.Position = UDim2.new(0, 10, 0.5, -5)

            local SliderButton = Instance.new("Frame")
            SliderButton.Name = "SliderButton"
            SliderButton.Parent = SliderBar
            SliderButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            SliderButton.Size = UDim2.new(0, 20, 1, 0)

            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Name = "ValueLabel"
            ValueLabel.Parent = SliderFrame
            ValueLabel.Text = tostring(minValue)
            ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Size = UDim2.new(1, 0, 0, 20)
            ValueLabel.Position = UDim2.new(0, 0, 0, 0)

            local dragging = false

            SliderButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)

            SliderButton.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)

            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    local scale = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                    SliderButton.Position = UDim2.new(scale, -10, 0, 0)
                    local value = math.floor(scale * (maxValue - minValue) + minValue)
                    ValueLabel.Text = tostring(value)
                    if callback then
                        callback(value)
                    end
                end
            end)
        end

        return Tab
    end

    return UI
end

return NovaGui
