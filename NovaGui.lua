local NovaGui = {}

function NovaGui:CreateWindow(title)
    local Window = {}
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleBar = Instance.new("TextLabel")
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local TabHolder = Instance.new("Frame")
    local TabContainer = Instance.new("Frame")
    local Components = Instance.new("Frame")
    local TabListLayout = Instance.new("UIListLayout")

    -- ScreenGui setup
    ScreenGui.Name = "NovaGui"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    -- MainFrame setup
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.Active = true
    MainFrame.Draggable = true

    -- TitleBar setup
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.Font = Enum.Font.SourceSansBold
    TitleBar.Text = title
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextSize = 20

    -- MinimizeButton setup
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = TitleBar
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    MinimizeButton.Position = UDim2.new(0.85, 0, 0, 0)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.Font = Enum.Font.SourceSansBold
    MinimizeButton.TextSize = 20

    -- CloseButton setup
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TitleBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.TextSize = 20

    -- TabHolder setup
    TabHolder.Name = "TabHolder"
    TabHolder.Parent = MainFrame
    TabHolder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabHolder.Size = UDim2.new(0, 100, 1, -30)
    TabHolder.Position = UDim2.new(0, 0, 0, 30)

    -- TabContainer setup
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = TabHolder
    TabContainer.BackgroundTransparency = 1
    TabContainer.Size = UDim2.new(1, 0, 1, 0)

    -- TabListLayout setup
    TabListLayout.Parent = TabContainer
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Components setup
    Components.Name = "Components"
    Components.Parent = MainFrame
    Components.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Components.Size = UDim2.new(1, -100, 1, -30)
    Components.Position = UDim2.new(0, 100, 0, 30)

    -- Minimize button functionality
    local minimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        Components.Visible = not minimized
        TabHolder.Visible = not minimized
        MainFrame.Size = minimized and UDim2.new(0, 400, 0, 30) or UDim2.new(0, 400, 0, 300)
    end)

    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Function to add a tab
    function Window:AddTab(tabName)
        local Tab = {}
        local TabButton = Instance.new("TextButton")
        local TabContent = Instance.new("Frame")

        -- TabButton setup
        TabButton.Name = tabName .. "Button"
        TabButton.Parent = TabContainer
        TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.Font = Enum.Font.SourceSansBold
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 18

        -- TabContent setup
        TabContent.Name = tabName .. "Content"
        TabContent.Parent = Components
        TabContent.BackgroundTransparency = 1
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.Visible = false

        TabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(Components:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end
            TabContent.Visible = true
        end)

        -- Function to add a button
        function Tab:AddButton(buttonName, callback)
            local Button = Instance.new("TextButton")

            Button.Name = buttonName
            Button.Parent = TabContent
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Button.Size = UDim2.new(0, 200, 0, 40)
            Button.Font = Enum.Font.SourceSansBold
            Button.Text = buttonName
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 18

            Button.MouseButton1Click:Connect(function()
                pcall(callback)
            end)
        end

        -- Function to add a slider
        function Tab:AddSlider(sliderName, minValue, maxValue, callback)
            local SliderFrame = Instance.new("Frame")
            local SliderBar = Instance.new("Frame")
            local SliderButton = Instance.new("TextButton")
            local SliderValue = Instance.new("TextLabel")

            -- SliderFrame setup
            SliderFrame.Name = sliderName .. "Slider"
            SliderFrame.Parent = TabContent
            SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            SliderFrame.Size = UDim2.new(0, 300, 0, 50)
            -- SliderBar setup
            SliderBar.Name = "SliderBar"
            SliderBar.Parent = SliderFrame
            SliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            SliderBar.Size = UDim2.new(0.9, 0, 0.2, 0)
            SliderBar.Position = UDim2.new(0.05, 0, 0.5, -5)

            -- SliderButton setup
            SliderButton.Name = "SliderButton"
            SliderButton.Parent = SliderBar
            SliderButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
            SliderButton.Size = UDim2.new(0, 10, 1, 0)

            -- SliderValue setup
            SliderValue.Name = "SliderValue"
            SliderValue.Parent = SliderFrame
            SliderValue.BackgroundTransparency = 1
            SliderValue.Position = UDim2.new(0.85, 0, 0.1, 0)
            SliderValue.Size = UDim2.new(0, 40, 0, 20)
            SliderValue.Font = Enum.Font.SourceSans
            SliderValue.Text = tostring(minValue)
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 14

            -- Slider functionality
            local dragging = false
            SliderButton.MouseButton1Down:Connect(function()
                dragging = true
            end)

            game:GetService("UserInputService").InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            SliderBar.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local mousePos = game:GetService("UserInputService"):GetMouseLocation().X
                    local sliderStart = SliderBar.AbsolutePosition.X
                    local sliderEnd = sliderStart + SliderBar.AbsoluteSize.X
                    local newPos = math.clamp(mousePos, sliderStart, sliderEnd)
                    local percentage = (newPos - sliderStart) / SliderBar.AbsoluteSize.X
                    local value = math.floor(minValue + (maxValue - minValue) * percentage)

                    SliderButton.Position = UDim2.new(percentage, -5, 0, 0)
                    SliderValue.Text = tostring(value)

                    if callback then
                        callback(value)
                    end
                end
            end)
        end

        -- Function to add text input
        function Tab:AddTextInput(inputName, placeholderText, callback)
            local TextBoxFrame = Instance.new("Frame")
            local TextBox = Instance.new("TextBox")

            -- TextBoxFrame setup
            TextBoxFrame.Name = inputName .. "Frame"
            TextBoxFrame.Parent = TabContent
            TextBoxFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            TextBoxFrame.Size = UDim2.new(0, 300, 0, 50)

            -- TextBox setup
            TextBox.Name = inputName
            TextBox.Parent = TextBoxFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            TextBox.Position = UDim2.new(0.05, 0, 0.2, 0)
            TextBox.Size = UDim2.new(0.9, 0, 0.6, 0)
            TextBox.Font = Enum.Font.SourceSans
            TextBox.PlaceholderText = placeholderText
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 18

            -- TextBox functionality
            TextBox.FocusLost:Connect(function(enterPressed)
                if enterPressed and callback then
                    callback(TextBox.Text)
                end
            end)
        end

        return Tab
    end

    return Window
end

return NovaGui
