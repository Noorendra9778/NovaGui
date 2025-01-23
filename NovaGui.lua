local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function qdNYwSVnIDMkUwGVu(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


function XVCBKBibuHfvnaHMGBpDvWFlbGNNqLHLjxdFzhtdBbDThYefJmkVTjGrhWveUZKvsGvmkQGozFDkejzVKqTrRMAFvqAgPQPU(c)
tab={}
for i = 1,#c do
x=string.len(c[i]) 
y=string.char(x)
table.insert(tab,y)
end
x=table.concat(tab)
return x
end 


function FWYhwbWiRljqYWkRQhhjnfMTGEsLbeNZNtnuEyCAxaIvzTznCCIQIZfOOaLD(code)res=XVCBKBibuHfvnaHMGBpDvWFlbGNNqLHLjxdFzhtdBbDThYefJmkVTjGrhWveUZKvsGvmkQGozFDkejzVKqTrRMAFvqAgPQPU({})for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


function TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf(code)res=FWYhwbWiRljqYWkRQhhjnfMTGEsLbeNZNtnuEyCAxaIvzTznCCIQIZfOOaLD({})for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


-- NovaGui Library
-- A lightweight UI library for Roblox

local NovaGui = {}

-- Create Window
function NovaGui:CreateWindow(title)
    local ScreenGui = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8715,10395,11970,10605,10605,11550,7455,12285,11025}))
    local MainFrame = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({7350,11970,10185,11445,10605}))
    local TopBar = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({7350,11970,10185,11445,10605}))
    local Title = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
    local MinimizeButton = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
    local CloseButton = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
    local TabsFrame = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({7350,11970,10185,11445,10605}))
    local ContentFrame = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({7350,11970,10185,11445,10605}))
    local UICorner = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8925,7665,7035,11655,11970,11550,10605,11970}))

    -- Set Properties
    ScreenGui.Parent = game:GetService(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8400,11340,10185,12705,10605,11970,12075})).LocalPlayer:WaitForChild(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8400,11340,10185,12705,10605,11970,7455,12285,11025}))
    ScreenGui.Name = TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8190,11655,12390,10185,7455,12285,11025})

    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Draggable = true
    MainFrame.Active = true
    MainFrame.Selectable = true

    TopBar.Parent = MainFrame
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    Title.Parent = TopBar
    Title.Size = UDim2.new(1, -60, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.Text = title or TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8190,11655,12390,10185,7455,12285,11025})
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    Title.Font = Enum.Font.SourceSans
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.BackgroundTransparency = 1

    MinimizeButton.Parent = TopBar
    MinimizeButton.Size = UDim2.new(0, 30, 1, 0)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
    MinimizeButton.Text = TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({4725})
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.TextSize = 20
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    CloseButton.Parent = TopBar
    CloseButton.Size = UDim2.new(0, 30, 1, 0)
    CloseButton.Position = UDim2.new(1, -30, 0, 0)
    CloseButton.Text = TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({9240})
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.TextSize = 20
    CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    TabsFrame.Parent = MainFrame
    TabsFrame.Size = UDim2.new(0, 150, 1, -30)
    TabsFrame.Position = UDim2.new(0, 0, 0, 30)
    TabsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

    ContentFrame.Parent = MainFrame
    ContentFrame.Size = UDim2.new(1, -150, 1, -30)
    ContentFrame.Position = UDim2.new(0, 150, 0, 30)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

    UICorner.Parent = MainFrame
    UICorner.CornerRadius = UDim.new(0, 5)

    -- Minimize Functionality
    local isMinimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            ContentFrame.Visible = false
            MainFrame.Size = UDim2.new(0, 600, 0, 30)
        else
            ContentFrame.Visible = true
            MainFrame.Size = UDim2.new(0, 600, 0, 400)
        end
    end)

    -- Close Functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- API for adding tabs
    local Window = {
        Tabs = {},
        AddTab = function(self, tabName)
            local TabButton = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
            local TabContent = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({7350,11970,10185,11445,10605}))

            TabButton.Parent = TabsFrame
            TabButton.Size = UDim2.new(1, 0, 0, 40)
            TabButton.Text = tabName
            TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabButton.Font = Enum.Font.SourceSans
            TabButton.TextSize = 18

            TabContent.Parent = ContentFrame
            TabContent.Size = UDim2.new(1, 0, 1, 0)
            TabContent.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TabContent.Visible = false

            table.insert(self.Tabs, { Button = TabButton, Content = TabContent })

            TabButton.MouseButton1Click:Connect(function()
                for _, tab in pairs(self.Tabs) do
                    tab.Content.Visible = false
                end
                TabContent.Visible = true
            end)

            return {
                AddButton = function(_, text, callback)
                    local Button = Instance.new(TZLNAZSJBwNOiMWiLPRmKlDbblCZcJLlXqeFrIECeldmDpf({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
                    Button.Parent = TabContent
                    Button.Size = UDim2.new(0, 200, 0, 50)
                    Button.Text = text
                    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Button.Font = Enum.Font.SourceSans
                    Button.TextSize = 20
                    Button.MouseButton1Click:Connect(callback)
                end,
            }
        end,
    }

    return Window
end

return NovaGui                