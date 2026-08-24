-- [[ Wizard Library - Fixed Version ]]
-- Fixed obfuscated GUI library with proper variable bindings and logic

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Mouse = Players.LocalPlayer:GetMouse()

-- Clean up any existing instance
local existingGui = CoreGui:FindFirstChild("WizardLibrary")
if existingGui then
    existingGui:Destroy()
end

-- Create main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WizardLibrary"
screenGui.Parent = CoreGui

local container = Instance.new("Frame")
container.Name = "Container"
container.Parent = screenGui
container.BackgroundColor3 = Color3.new(1, 1, 1)
container.BackgroundTransparency = 1
container.Size = UDim2.new(0, 100, 0, 100)

-- Global state
local Library = {}
Library.Enabled = true

-- Input handling for toggle
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightControl then
        Library.Enabled = not Library.Enabled
        screenGui.Visible = Library.Enabled
    end
end)

-- Dragging function
local function makeDraggable(frame)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = Mouse.Position
            startPos = frame.Position
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    Mouse.Move:Connect(function()
        if dragging then
            local delta = Mouse.Position - dragStart
            frame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
        end
    end)
end

-- String utility
local function removeSpaces(str)
    return str:gsub(" ", "")
end

-- Animation helper
local function animateSize(object, targetSize, callback)
    local tweenInfo = TweenInfo.new(
        0.3,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(object, tweenInfo, {Size = targetSize})
    tween:Play()
    if callback then
        tween.Completed:Connect(callback)
    end
end

-- Main library table
return {
    NewWindow = function(title, description)
        local windowSize = 0
        
        local windowFrame = Instance.new("ImageLabel")
        windowFrame.Name = removeSpaces(description) .. "Window"
        windowFrame.Parent = screenGui
        windowFrame.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
        windowFrame.BackgroundTransparency = 1
        windowFrame.Position = UDim2.new(0, -100, 3, -265)
        windowFrame.Size = UDim2.new(0, 170, 0, 30)
        windowFrame.ZIndex = 2
        windowFrame.Image = "rbxassetid://3570695787"
        windowFrame.ImageColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
        windowFrame.ScaleType = Enum.ScaleType.Slice
        windowFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        windowFrame.SliceScale = 0.05

        -- Topbar
        local topbar = Instance.new("Frame")
        topbar.Name = "Topbar"
        topbar.Parent = windowFrame
        topbar.BackgroundColor3 = Color3.new(1, 1, 1)
        topbar.BackgroundTransparency = 1
        topbar.BorderSizePixel = 0
        topbar.Size = UDim2.new(0, 170, 0, 30)
        topbar.ZIndex = 2

        -- Window title
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "WindowTitle"
        titleLabel.Parent = topbar
        titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Size = UDim2.new(0, 170, 0, 30)
        titleLabel.ZIndex = 2
        titleLabel.Font = Enum.Font.SourceSansBold
        titleLabel.Text = description
        titleLabel.TextColor3 = Color3.new(1, 1, 1)
        titleLabel.TextSize = 17

        -- Window toggle button
        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Name = "WindowToggle"
        toggleBtn.Parent = topbar
        toggleBtn.BackgroundColor3 = Color3.new(1, 1, 1)
        toggleBtn.BackgroundTransparency = 1
        toggleBtn.Position = UDim2.new(0.822450161, 0, 0, 0)
        toggleBtn.Size = UDim2.new(0, 30, 0, 30)
        toggleBtn.ZIndex = 2
        toggleBtn.Font = Enum.Font.SourceSansSemibold
        toggleBtn.Text = "-"
        toggleBtn.TextColor3 = Color3.new(1, 1, 1)
        toggleBtn.TextSize = 20
        toggleBtn.TextWrapped = true

        local isExpanded = true

        toggleBtn.MouseButton1Down:Connect(function()
            isExpanded = not isExpanded
            
            if isExpanded then
                toggleBtn.Text = "-"
                toggleBtn.TextSize = 20
                bodyFrame.Visible = true
            else
                toggleBtn.Text = "v"
                toggleBtn.TextSize = 14
                bodyFrame.Visible = false
            end
        end)

        -- Body frame
        local bodyFrame = Instance.new("ImageLabel")
        bodyFrame.Name = "Body"
        bodyFrame.Parent = windowFrame
        bodyFrame.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        bodyFrame.BackgroundTransparency = 1
        bodyFrame.ClipsDescendants = true
        bodyFrame.Size = UDim2.new(0, 170, 0, 35)
        bodyFrame.Image = "rbxassetid://3570695787"
        bodyFrame.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
        bodyFrame.ScaleType = Enum.ScaleType.Slice
        bodyFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        bodyFrame.SliceScale = 0.05

        -- Layout
        local listLayout = Instance.new("UIListLayout")
        listLayout.Name = "Sorter"
        listLayout.Parent = bodyFrame
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local topbarCover = Instance.new("Frame")
        topbarCover.Name = "TopbarBodyCover"
        topbarCover.Parent = bodyFrame
        topbarCover.BackgroundColor3 = Color3.new(1, 1, 1)
        topbarCover.BackgroundTransparency = 1
        topbarCover.BorderSizePixel = 0
        topbarCover.Size = UDim2.new(0, 170, 0, 30)

        makeDraggable(windowFrame)

        -- Return window API
        return {
            NewSection = function(sectionTitle, sectionDesc)
                local sectionFrame = Instance.new("Frame")
                sectionFrame.Name = removeSpaces(sectionDesc) .. "Section"
                sectionFrame.Parent = bodyFrame
                sectionFrame.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
                sectionFrame.BorderSizePixel = 0
                sectionFrame.ClipsDescendants = true
                sectionFrame.Size = UDim2.new(0, 170, 0, 30)

                local sectionInfo = Instance.new("Frame")
                sectionInfo.Name = "SectionInfo"
                sectionInfo.Parent = sectionFrame
                sectionInfo.BackgroundColor3 = Color3.new(1, 1, 1)
                sectionInfo.BackgroundTransparency = 1
                sectionInfo.Size = UDim2.new(0, 170, 0, 30)

                local sectionToggle = Instance.new("TextButton")
                sectionToggle.Name = "SectionToggle"
                sectionToggle.Parent = sectionInfo
                sectionToggle.BackgroundColor3 = Color3.new(1, 1, 1)
                sectionToggle.BackgroundTransparency = 1
                sectionToggle.Position = UDim2.new(0.822450161, 0, 0, 0)
                sectionToggle.Size = UDim2.new(0, 30, 0, 30)
                sectionToggle.ZIndex = 2
                sectionToggle.Font = Enum.Font.SourceSansSemibold
                sectionToggle.Text = "v"
                sectionToggle.TextColor3 = Color3.new(1, 1, 1)
                sectionToggle.TextSize = 14

                local sectionTitle = Instance.new("TextLabel")
                sectionTitle.Name = "SectionTitle"
                sectionTitle.Parent = sectionInfo
                sectionTitle.BackgroundColor3 = Color3.new(1, 1, 1)
                sectionTitle.BackgroundTransparency = 1
                sectionTitle.BorderSizePixel = 0
                sectionTitle.Position = UDim2.new(0.052941177, 0, 0, 0)
                sectionTitle.Size = UDim2.new(0, 125, 0, 30)
                sectionTitle.Font = Enum.Font.SourceSansBold
                sectionTitle.Text = sectionDesc
                sectionTitle.TextColor3 = Color3.new(1, 1, 1)
                sectionTitle.TextSize = 17
                sectionTitle.TextXAlignment = Enum.TextXAlignment.Left

                local sectionLayout = Instance.new("UIListLayout")
                sectionLayout.Name = "Layout"
                sectionLayout.Parent = sectionFrame
                sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder

                local sectionExpanded = true

                sectionToggle.MouseButton1Down:Connect(function()
                    sectionExpanded = not sectionExpanded
                    sectionToggle.Text = sectionExpanded and "v" or "-"
                end)

                return {
                    CreateToggle = function(toggleName, toggleDesc, callback)
                        local toggleHolder = Instance.new("Frame")
                        toggleHolder.Name = removeSpaces(toggleDesc) .. "ToggleHolder"
                        toggleHolder.Parent = sectionFrame
                        toggleHolder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
                        toggleHolder.BorderSizePixel = 0
                        toggleHolder.Size = UDim2.new(0, 170, 0, 30)

                        local toggleLabel = Instance.new("TextLabel")
                        toggleLabel.Name = "ToggleTitle"
                        toggleLabel.Parent = toggleHolder
                        toggleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                        toggleLabel.BackgroundTransparency = 1
                        toggleLabel.BorderSizePixel = 0
                        toggleLabel.Position = UDim2.new(0.052941177, 0, 0, 0)
                        toggleLabel.Size = UDim2.new(0, 125, 0, 30)
                        toggleLabel.Font = Enum.Font.SourceSansBold
                        toggleLabel.Text = toggleDesc
                        toggleLabel.TextColor3 = Color3.new(1, 1, 1)
                        toggleLabel.TextSize = 17
                        toggleLabel.TextXAlignment = Enum.TextXAlignment.Left

                        local toggleBg = Instance.new("ImageLabel")
                        toggleBg.Name = "ToggleBackground"
                        toggleBg.Parent = toggleHolder
                        toggleBg.BackgroundColor3 = Color3.new(1, 1, 1)
                        toggleBg.BackgroundTransparency = 1
                        toggleBg.BorderSizePixel = 0
                        toggleBg.Position = UDim2.new(0.847058833, 0, 0.166666672, 0)
                        toggleBg.Size = UDim2.new(0, 20, 0, 20)
                        toggleBg.Image = "rbxassetid://3570695787"
                        toggleBg.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)

                        local toggleButton = Instance.new("ImageButton")
                        toggleButton.Name = "ToggleButton"
                        toggleButton.Parent = toggleBg
                        toggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
                        toggleButton.BackgroundTransparency = 1
                        toggleButton.Position = UDim2.new(0, 2, 0, 2)
                        toggleButton.Size = UDim2.new(0, 16, 0, 16)
                        toggleButton.Image = "rbxassetid://3570695787"
                        toggleButton.ImageColor3 = Color3.new(1, 0.341176, 0.341176)
                        toggleButton.ImageTransparency = 1

                        local toggleState = false

                        toggleButton.MouseButton1Down:Connect(function()
                            toggleState = not toggleState
                            
                            local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                            local tween = TweenService:Create(toggleButton, tweenInfo, {
                                ImageTransparency = toggleState and 0 or 1
                            })
                            tween:Play()

                            if callback then
                                callback(toggleState)
                            end
                        end)

                        return toggleState
                    end,

                    CreateSlider = function(sliderName, sliderDesc, minVal, maxVal, defaultVal, precision, callback)
                        local sliderHolder = Instance.new("Frame")
                        sliderHolder.Name = removeSpaces(sliderDesc) .. "SliderHolder"
                        sliderHolder.Parent = sectionFrame
                        sliderHolder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
                        sliderHolder.BorderSizePixel = 0
                        sliderHolder.Size = UDim2.new(0, 170, 0, 30)

                        local sliderLabel = Instance.new("TextLabel")
                        sliderLabel.Name = "SliderTitle"
                        sliderLabel.Parent = sliderHolder
                        sliderLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                        sliderLabel.BackgroundTransparency = 1
                        sliderLabel.BorderSizePixel = 0
                        sliderLabel.Position = UDim2.new(0.052941177, 0, 0, 0)
                        sliderLabel.Size = UDim2.new(0, 125, 0, 15)
                        sliderLabel.Font = Enum.Font.SourceSansSemibold
                        sliderLabel.Text = sliderDesc
                        sliderLabel.TextColor3 = Color3.new(1, 1, 1)
                        sliderLabel.TextSize = 17
                        sliderLabel.TextXAlignment = Enum.TextXAlignment.Left

                        local valueDisplay = Instance.new("TextLabel")
                        valueDisplay.Name = "SliderValue"
                        valueDisplay.Parent = sliderHolder
                        valueDisplay.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
                        valueDisplay.BackgroundTransparency = 1
                        valueDisplay.Position = UDim2.new(0.747058809, 0, 0, 0)
                        valueDisplay.Size = UDim2.new(0, 35, 0, 15)
                        valueDisplay.Font = Enum.Font.SourceSansSemibold
                        valueDisplay.Text = tostring(math.floor(defaultVal or minVal))
                        valueDisplay.TextColor3 = Color3.new(1, 1, 1)
                        valueDisplay.TextSize = 14

                        local sliderBg = Instance.new("ImageLabel")
                        sliderBg.Name = "SliderBackground"
                        sliderBg.Parent = sliderHolder
                        sliderBg.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
                        sliderBg.BackgroundTransparency = 1
                        sliderBg.Position = UDim2.new(0.0529999994, 0, 0.649999976, 0)
                        sliderBg.Selectable = true
                        sliderBg.Size = UDim2.new(0, 153, 0, 5)
                        sliderBg.Image = "rbxassetid://3570695787"
                        sliderBg.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)
                        sliderBg.ImageTransparency = 0.5
                        sliderBg.ScaleType = Enum.ScaleType.Slice
                        sliderBg.SliceCenter = Rect.new(100, 100, 100, 100)
                        sliderBg.ClipsDescendants = true
                        sliderBg.SliceScale = 0.02

                        local slider = Instance.new("ImageLabel")
                        slider.Name = "Slider"
                        slider.Parent = sliderBg
                        slider.BackgroundColor3 = Color3.new(1, 1, 1)
                        slider.BackgroundTransparency = 1
                        slider.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
                        slider.Image = "rbxassetid://3570695787"
                        slider.ScaleType = Enum.ScaleType.Slice
                        slider.SliceCenter = Rect.new(100, 100, 100, 100)
                        slider.SliceScale = 0.02

                        local isDragging = false

                        local function updateSlider(input)
                            if not isDragging then return end
                            
                            local relativeX = math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                            local newValue = math.floor(relativeX * (maxVal - minVal) + minVal)
                            
                            slider.Size = UDim2.new(relativeX, 0, 1, 0)
                            valueDisplay.Text = tostring(newValue)
                            
                            if callback then
                                callback(newValue)
                            end
                        end

                        sliderBg.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                isDragging = true
                                updateSlider(input)
                            end
                        end)

                        sliderBg.InputEnded:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                isDragging = false
                            end
                        end)

                        Mouse.Move:Connect(function()
                            if isDragging then
                                updateSlider({Position = Mouse.Hit.Position})
                            end
                        end)

                        return defaultVal or minVal
                    end,

                    CreateButton = function(buttonName, buttonDesc, callback)
                        local buttonHolder = Instance.new("Frame")
                        buttonHolder.Name = removeSpaces(buttonDesc) .. "ButtonHolder"
                        buttonHolder.Parent = sectionFrame
                        buttonHolder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
                        buttonHolder.BorderSizePixel = 0
                        buttonHolder.Size = UDim2.new(0, 170, 0, 30)

                        local button = Instance.new("TextButton")
                        button.Name = "Button"
                        button.Parent = buttonHolder
                        button.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
                        button.BackgroundTransparency = 1
                        button.BorderSizePixel = 0
                        button.Position = UDim2.new(0.052941177, 0, 0, 0)
                        button.Size = UDim2.new(0, 153, 0, 24)
                        button.ZIndex = 2
                        button.AutoButtonColor = false
                        button.Font = Enum.Font.SourceSansBold
                        button.Text = buttonDesc
                        button.TextColor3 = Color3.new(1, 1, 1)
                        button.TextSize = 14

                        button.MouseButton1Down:Connect(function()
                            if callback then
                                callback()
                            end
                        end)

                        return button
                    end,

                    CreateTextbox = function(boxName, boxDesc, callback)
                        local boxHolder = Instance.new("Frame")
                        boxHolder.Name = removeSpaces(boxDesc) .. "TextBoxHolder"
                        boxHolder.Parent = sectionFrame
                        boxHolder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
                        boxHolder.BorderSizePixel = 0
                        boxHolder.Size = UDim2.new(0, 170, 0, 30)

                        local textbox = Instance.new("TextBox")
                        textbox.Parent = boxHolder
                        textbox.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
                        textbox.BackgroundTransparency = 1
                        textbox.ClipsDescendants = true
                        textbox.Position = UDim2.new(0.0529999994, 0, 0, 0)
                        textbox.Size = UDim2.new(0, 153, 0, 24)
                        textbox.ZIndex = 2
                        textbox.Font = Enum.Font.SourceSansBold
                        textbox.PlaceholderText = boxDesc
                        textbox.Text = ""
                        textbox.TextColor3 = Color3.new(1, 1, 1)
                        textbox.TextSize = 14

                        textbox.FocusLost:Connect(function(enterPressed)
                            if enterPressed and callback then
                                callback(textbox.Text)
                            end
                        end)

                        return textbox
                    end,
                }
            end,
        }
    end,
}
