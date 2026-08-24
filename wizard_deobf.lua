-- [[ Wizard Library - Completely Fixed ]]
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Mouse = Players.LocalPlayer:GetMouse()

-- Clean up existing GUI
local existingGui = CoreGui:FindFirstChild("WizardLibrary")
if existingGui then
    existingGui:Destroy()
end

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WizardLibrary"
screenGui.Parent = CoreGui
screenGui.ResetOnSpawn = false

local container = Instance.new("Frame")
container.Name = "Container"
container.Parent = screenGui
container.BackgroundTransparency = 1
container.Size = UDim2.new(1, 0, 1, 0)

-- Global state
local LibraryEnabled = true

-- Toggle with Right Control
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        LibraryEnabled = not LibraryEnabled
        screenGui.Visible = LibraryEnabled
    end
end)

-- Make frame draggable
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
        if dragging and dragStart then
            local delta = Mouse.Position - dragStart
            frame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
        end
    end)
end

-- Return library
return {
    NewWindow = function(name, title)
        name = name or "Window"
        title = title or "Window"
        
        local windowFrame = Instance.new("ImageLabel")
        windowFrame.Name = name .. "Window"
        windowFrame.Parent = screenGui
        windowFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        windowFrame.BackgroundTransparency = 1
        windowFrame.Position = UDim2.new(0, 20, 0, 20)
        windowFrame.Size = UDim2.new(0, 170, 0, 30)
        windowFrame.ZIndex = 2
        windowFrame.Image = "rbxassetid://3570695787"
        windowFrame.ImageColor3 = Color3.fromRGB(25, 25, 25)
        windowFrame.ScaleType = Enum.ScaleType.Slice
        windowFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        windowFrame.SliceScale = 0.05

        -- Topbar
        local topbar = Instance.new("Frame")
        topbar.Name = "Topbar"
        topbar.Parent = windowFrame
        topbar.BackgroundTransparency = 1
        topbar.BorderSizePixel = 0
        topbar.Size = UDim2.new(0, 170, 0, 30)
        topbar.ZIndex = 3

        -- Title
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "Title"
        titleLabel.Parent = topbar
        titleLabel.BackgroundTransparency = 1
        titleLabel.Size = UDim2.new(0, 140, 0, 30)
        titleLabel.ZIndex = 3
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.Text = title
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLabel.TextSize = 14

        -- Toggle button
        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Name = "Toggle"
        toggleBtn.Parent = topbar
        toggleBtn.BackgroundTransparency = 1
        toggleBtn.Position = UDim2.new(0.8, 0, 0, 0)
        toggleBtn.Size = UDim2.new(0, 30, 0, 30)
        toggleBtn.ZIndex = 3
        toggleBtn.Font = Enum.Font.GothamBold
        toggleBtn.Text = "-"
        toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleBtn.TextSize = 20

        -- Body
        local bodyFrame = Instance.new("ImageLabel")
        bodyFrame.Name = "Body"
        bodyFrame.Parent = windowFrame
        bodyFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        bodyFrame.BackgroundTransparency = 1
        bodyFrame.ClipsDescendants = true
        bodyFrame.Size = UDim2.new(0, 170, 0, 0)
        bodyFrame.Image = "rbxassetid://3570695787"
        bodyFrame.ImageColor3 = Color3.fromRGB(35, 35, 35)
        bodyFrame.ScaleType = Enum.ScaleType.Slice
        bodyFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        bodyFrame.SliceScale = 0.05

        local listLayout = Instance.new("UIListLayout")
        listLayout.Parent = bodyFrame
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder
        listLayout.Padding = UDim.new(0, 0)

        local isExpanded = false
        local currentHeight = 0

        local function expandBody()
            isExpanded = true
            toggleBtn.Text = "-"
            bodyFrame.Visible = true
            bodyFrame.Size = UDim2.new(0, 170, 0, currentHeight)
        end

        local function collapseBody()
            isExpanded = false
            toggleBtn.Text = "v"
            bodyFrame.Size = UDim2.new(0, 170, 0, 0)
        end

        toggleBtn.MouseButton1Down:Connect(function()
            if isExpanded then
                collapseBody()
            else
                expandBody()
            end
        end)

        listLayout.ChildAdded:Connect(function()
            currentHeight = listLayout.AbsoluteContentSize.Y
            if isExpanded then
                bodyFrame.Size = UDim2.new(0, 170, 0, currentHeight)
            end
        end)

        makeDraggable(windowFrame)

        return {
            NewSection = function(name, title)
                name = name or "Section"
                title = title or "Section"

                local sectionFrame = Instance.new("Frame")
                sectionFrame.Name = name .. "Section"
                sectionFrame.Parent = bodyFrame
                sectionFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                sectionFrame.BorderSizePixel = 0
                sectionFrame.Size = UDim2.new(0, 170, 0, 0)
                sectionFrame.LayoutOrder = 1

                local sectionLayout = Instance.new("UIListLayout")
                sectionLayout.Parent = sectionFrame
                sectionLayout.SortOrder = Enum.SortOrder.LayoutOrder

                return {
                    CreateToggle = function(name, label, default, callback)
                        name = name or "Toggle"
                        label = label or "Toggle"
                        callback = callback or function() end

                        local toggleContainer = Instance.new("Frame")
                        toggleContainer.Name = name
                        toggleContainer.Parent = sectionFrame
                        toggleContainer.BackgroundTransparency = 1
                        toggleContainer.Size = UDim2.new(1, 0, 0, 30)
                        toggleContainer.LayoutOrder = sectionLayout.ChildAdded:Wait() and 1 or 1

                        local label_text = Instance.new("TextLabel")
                        label_text.Parent = toggleContainer
                        label_text.BackgroundTransparency = 1
                        label_text.Size = UDim2.new(0, 130, 0, 30)
                        label_text.Font = Enum.Font.Gotham
                        label_text.Text = label
                        label_text.TextColor3 = Color3.fromRGB(200, 200, 200)
                        label_text.TextSize = 13
                        label_text.TextXAlignment = Enum.TextXAlignment.Left

                        local toggleBox = Instance.new("TextButton")
                        toggleBox.Parent = toggleContainer
                        toggleBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        toggleBox.BorderSizePixel = 0
                        toggleBox.Position = UDim2.new(0.76, 0, 0.3, 0)
                        toggleBox.Size = UDim2.new(0, 30, 0, 15)
                        toggleBox.Font = Enum.Font.GothamBold
                        toggleBox.Text = ""
                        toggleBox.AutoButtonColor = false

                        local indicator = Instance.new("Frame")
                        indicator.Parent = toggleBox
                        indicator.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                        indicator.BorderSizePixel = 0
                        indicator.Position = UDim2.new(0.1, 0, 0.15, 0)
                        indicator.Size = UDim2.new(0, 8, 0, 8)

                        local toggleState = default or false

                        local function updateToggle()
                            if toggleState then
                                indicator.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
                                indicator.Position = UDim2.new(0.55, 0, 0.15, 0)
                            else
                                indicator.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                                indicator.Position = UDim2.new(0.1, 0, 0.15, 0)
                            end
                        end

                        updateToggle()

                        toggleBox.MouseButton1Down:Connect(function()
                            toggleState = not toggleState
                            updateToggle()
                            callback(toggleState)
                        end)

                        return toggleState
                    end,

                    CreateButton = function(name, label, callback)
                        name = name or "Button"
                        label = label or "Button"
                        callback = callback or function() end

                        local buttonContainer = Instance.new("Frame")
                        buttonContainer.Name = name
                        buttonContainer.Parent = sectionFrame
                        buttonContainer.BackgroundTransparency = 1
                        buttonContainer.Size = UDim2.new(1, 0, 0, 30)

                        local button = Instance.new("TextButton")
                        button.Parent = buttonContainer
                        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        button.BorderSizePixel = 0
                        button.Position = UDim2.new(0.05, 0, 0.15, 0)
                        button.Size = UDim2.new(0.9, 0, 0.7, 0)
                        button.Font = Enum.Font.GothamBold
                        button.Text = label
                        button.TextColor3 = Color3.fromRGB(200, 200, 200)
                        button.TextSize = 13

                        button.MouseButton1Down:Connect(function()
                            callback()
                        end)

                        button.MouseEnter:Connect(function()
                            button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                        end)

                        button.MouseLeave:Connect(function()
                            button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        end)

                        return button
                    end,

                    CreateSlider = function(name, label, min, max, default, callback)
                        name = name or "Slider"
                        label = label or "Slider"
                        callback = callback or function() end
                        default = default or min

                        local sliderContainer = Instance.new("Frame")
                        sliderContainer.Name = name
                        sliderContainer.Parent = sectionFrame
                        sliderContainer.BackgroundTransparency = 1
                        sliderContainer.Size = UDim2.new(1, 0, 0, 40)

                        local label_text = Instance.new("TextLabel")
                        label_text.Parent = sliderContainer
                        label_text.BackgroundTransparency = 1
                        label_text.Size = UDim2.new(1, 0, 0, 15)
                        label_text.Font = Enum.Font.Gotham
                        label_text.Text = label .. ": " .. tostring(default)
                        label_text.TextColor3 = Color3.fromRGB(200, 200, 200)
                        label_text.TextSize = 12
                        label_text.TextXAlignment = Enum.TextXAlignment.Left

                        local sliderBg = Instance.new("Frame")
                        sliderBg.Parent = sliderContainer
                        sliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                        sliderBg.BorderSizePixel = 0
                        sliderBg.Position = UDim2.new(0.05, 0, 0.5, 0)
                        sliderBg.Size = UDim2.new(0.9, 0, 0, 8)

                        local sliderButton = Instance.new("Frame")
                        sliderButton.Parent = sliderBg
                        sliderButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
                        sliderButton.BorderSizePixel = 0
                        sliderButton.Size = UDim2.new(((default - min) / (max - min)), 0, 1, 0)

                        local isDragging = false

                        local function updateSlider(x)
                            local relative = math.clamp((x - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                            sliderButton.Size = UDim2.new(relative, 0, 1, 0)
                            local value = math.floor(relative * (max - min) + min)
                            label_text.Text = label .. ": " .. tostring(value)
                            callback(value)
                        end

                        sliderBg.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                isDragging = true
                                updateSlider(Mouse.X)
                            end
                        end)

                        sliderBg.InputEnded:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                isDragging = false
                            end
                        end)

                        Mouse.Move:Connect(function()
                            if isDragging then
                                updateSlider(Mouse.X)
                            end
                        end)

                        return default
                    end,
                }
            end,
        }
    end,
}
