local NovaGui = {}

-- Function to create a window
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
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
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

        return Tab
    end

    return Window
end

return NovaGui
