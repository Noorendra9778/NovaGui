-- NovaGui Library with Mobile-Friendly Adjustments
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
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0) -- Adjusted for smaller UI
    MainFrame.Size = UDim2.new(0, 300, 0, 250) -- Reduced size for mobile

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame

    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0, 30)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TitleBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, -80, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = Title or "NovaGui"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = TitleBar
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MinimizeButton.Position = UDim2.new(1, -70, 0.1, 0)
    MinimizeButton.Size = UDim2.new(0, 25, 0, 20)
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 18

    local DestroyButton = Instance.new("TextButton")
    DestroyButton.Name = "DestroyButton"
    DestroyButton.Parent = TitleBar
    DestroyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    DestroyButton.Position = UDim2.new(1, -35, 0.1, 0)
    DestroyButton.Size = UDim2.new(0, 25, 0, 20)
    DestroyButton.Font = Enum.Font.SourceSans
    DestroyButton.Text = "X"
    DestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DestroyButton.TextSize = 18

    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabContainer.Size = UDim2.new(0, 100, 1, -30)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabContainer

    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = MainFrame
    ContentContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ContentContainer.Size = UDim2.new(1, -100, 1, -30)
    ContentContainer.Position = UDim2.new(0, 100, 0, 30)

    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 8)
    ContentCorner.Parent = ContentContainer

    -- Minimize Logic
    local minimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            TabContainer.Visible = false
            ContentContainer.Visible = false
            MainFrame.Size = UDim2.new(0, 300, 0, 30)
        else
            TabContainer.Visible = true
            ContentContainer.Visible = true
            MainFrame.Size = UDim2.new(0, 300, 0, 250)
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
        local TabButton = Instance.new("TextButton")
        TabButton.Name = Name
        TabButton.Parent = TabContainer
        TabButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        TabButton.Size = UDim2.new(0.9, 0, 0, 25)
        TabButton.Position = UDim2.new(0.05, 0, (#TabContainer:GetChildren() - 1) * 30, 0)
        TabButton.Font = Enum.Font.GothamBold
        TabButton.Text = Name
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 14
        TabButton.TextXAlignment = Enum.TextXAlignment.Center

        local Tab = Instance.new("Frame")
        Tab.Name = Name
        Tab.Parent = ContentContainer
        Tab.BackgroundTransparency = 1
        Tab.Size = UDim2.new(1, 0, 1, 0)
        Tab.Visible = false

        TabButton.MouseButton1Click:Connect(function()
            for _, child in pairs(ContentContainer:GetChildren()) do
                child.Visible = false
            end
            Tab.Visible = true
        end)

        local TabLibrary = {}

        function TabLibrary:AddButton(Text, Callback)
            local Button = Instance.new("TextButton")
            Button.Name = Text
            Button.Parent = Tab
            Button.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
            Button.Size = UDim2.new(0, 120, 0, 30)
            Button.Position = UDim2.new(0, 10, 0, (#Tab:GetChildren() - 1) * 35)
            Button.Font = Enum.Font.Gotham
            Button.Text = Text
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14

            Button.MouseButton1Click:Connect(Callback)
        end

        return TabLibrary
    end

    return Library
end

return NovaGui
