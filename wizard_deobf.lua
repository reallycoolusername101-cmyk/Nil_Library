local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Existing = nil

pcall(function()
    Existing = game:GetService("CoreGui"):FindFirstChild("WizardLibrary")
end)

if Existing then
    Existing:Destroy()
end

local Library = {}

local function getParent()
    local ok, coreGui = pcall(function()
        return game:GetService("CoreGui")
    end)

    if ok and coreGui then
        return coreGui
    end

    return Player:WaitForChild("PlayerGui")
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WizardLibrary"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ok = pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)

if not ok or not ScreenGui.Parent then
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
end

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.BackgroundTransparency = 1
Container.Size = UDim2.fromOffset(0, 0)
Container.Position = UDim2.fromOffset(0, 0)
Container.Parent = ScreenGui

local windows = {}

local function cleanName(name)
    name = tostring(name or "Item")
    name = name:gsub("[^%w_]", "")
    return name ~= "" and name or "Item"
end

local function tween(object, info, properties)
    local animation = TweenService:Create(object, info, properties)
    animation:Play()
    return animation
end

local function roundFrame(parent, size, color, transparency)
    local frame = Instance.new("ImageLabel")
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.Size = size
    frame.Image = "rbxassetid://3570695787"
    frame.ImageColor3 = color
    frame.ImageTransparency = transparency or 0
    frame.ScaleType = Enum.ScaleType.Slice
    frame.SliceCenter = Rect.new(100, 100, 100, 100)
    frame.SliceScale = 0.04
    frame.Parent = parent
    return frame
end

local function drag(gui, handle)
    local dragging = false
    local dragInput
    local dragStart
    local startPosition

    handle = handle or gui

    handle.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1
            and input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end

        dragging = true
        dragStart = input.Position
        startPosition = gui.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging or input ~= dragInput then
            return
        end

        local delta = input.Position - dragStart
        gui.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end)
end

local function setupSectionLayout(window)
    window.BodyLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        local contentHeight = window.BodyLayout.AbsoluteContentSize.Y
        if contentHeight < 30 then
            contentHeight = 30
        end

        if not window.WindowCollapsed then
            tween(window.Window, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(170, contentHeight + 30)
            })
        end
    end)
end

local function makeControlHolder(section, name, height)
    local holder = Instance.new("Frame")
    holder.Name = cleanName(name) .. "Holder"
    holder.Size = UDim2.new(1, 0, 0, height)
    holder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    holder.BorderSizePixel = 0
    holder.Parent = section.Body
    return holder
end

function Library:NewWindow(title)
    local window = Instance.new("ImageLabel")
    window.Name = cleanName(title) .. "Window"
    window.Size = UDim2.fromOffset(170, 30)
    window.Position = UDim2.new(0, 20 + (#windows * 180), 0, 80)
    window.BackgroundTransparency = 1
    window.Image = "rbxassetid://3570695787"
    window.ImageColor3 = Color3.fromRGB(25, 25, 25)
    window.ScaleType = Enum.ScaleType.Slice
    window.SliceCenter = Rect.new(100, 100, 100, 100)
    window.SliceScale = 0.05
    window.ZIndex = 2
    window.Parent = Container

    table.insert(windows, window)

    local topbar = Instance.new("Frame")
    topbar.Name = "Topbar"
    topbar.Size = UDim2.fromOffset(170, 30)
    topbar.BackgroundTransparency = 1
    topbar.Parent = window

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "WindowTitle"
    titleLabel.Size = UDim2.fromOffset(135, 30)
    titleLabel.Position = UDim2.fromOffset(5, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Text = tostring(title or "Window")
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextSize = 17
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = topbar

    local toggle = Instance.new("TextButton")
    toggle.Name = "WindowToggle"
    toggle.Size = UDim2.fromOffset(30, 30)
    toggle.Position = UDim2.fromOffset(140, 0)
    toggle.BackgroundTransparency = 1
    toggle.Font = Enum.Font.SourceSansSemibold
    toggle.Text = "-"
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.TextSize = 20
    toggle.Parent = topbar

    local bottomCover = Instance.new("Frame")
    bottomCover.Name = "BottomRoundCover"
    bottomCover.Size = UDim2.fromOffset(170, 5)
    bottomCover.Position = UDim2.fromOffset(0, 25)
    bottomCover.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    bottomCover.BorderSizePixel = 0
    bottomCover.Parent = topbar

    local body = Instance.new("Frame")
    body.Name = "Body"
    body.Size = UDim2.fromOffset(170, 30)
    body.Position = UDim2.fromOffset(0, 30)
    body.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    body.BorderSizePixel = 0
    body.ClipsDescendants = true
    body.Parent = window

    local bodyLayout = Instance.new("UIListLayout")
    bodyLayout.Name = "Sorter"
    bodyLayout.SortOrder = Enum.SortOrder.LayoutOrder
    bodyLayout.Padding = UDim.new(0, 0)
    bodyLayout.Parent = body

    local windowObject = {
        Window = window,
        Body = body,
        BodyLayout = bodyLayout,
        WindowCollapsed = false
    }

    setupSectionLayout(windowObject)
    drag(window, topbar)

    toggle.MouseButton1Click:Connect(function()
        windowObject.WindowCollapsed = not windowObject.WindowCollapsed

        if windowObject.WindowCollapsed then
            toggle.Text = "v"
            tween(window, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(170, 30)
            })
            body.Visible = false
        else
            toggle.Text = "-"
            body.Visible = true

            local contentHeight = bodyLayout.AbsoluteContentSize.Y
            if contentHeight < 30 then
                contentHeight = 30
            end

            tween(window, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(170, contentHeight + 30)
            })
        end
    end)

    function windowObject:NewSection(sectionTitle)
        local section = {
            Body = nil,
            Open = true
        }

        local holder = Instance.new("Frame")
        holder.Name = cleanName(sectionTitle) .. "Section"
        holder.Size = UDim2.new(1, 0, 0, 30)
        holder.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        holder.BorderSizePixel = 0
        holder.ClipsDescendants = true
        holder.Parent = body

        local header = Instance.new("Frame")
        header.Name = "SectionInfo"
        header.Size = UDim2.fromOffset(170, 30)
        header.BackgroundTransparency = 1
        header.Parent = holder

        local sectionTitleLabel = Instance.new("TextLabel")
        sectionTitleLabel.Name = "SectionTitle"
        sectionTitleLabel.Size = UDim2.fromOffset(125, 30)
        sectionTitleLabel.Position = UDim2.fromOffset(9, 0)
        sectionTitleLabel.BackgroundTransparency = 1
        sectionTitleLabel.Font = Enum.Font.SourceSansBold
        sectionTitleLabel.Text = tostring(sectionTitle or "Section")
        sectionTitleLabel.TextColor3 = Color3.new(1, 1, 1)
        sectionTitleLabel.TextSize = 17
        sectionTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
        sectionTitleLabel.Parent = header

        local sectionToggle = Instance.new("TextButton")
        sectionToggle.Name = "SectionToggle"
        sectionToggle.Size = UDim2.fromOffset(30, 30)
        sectionToggle.Position = UDim2.fromOffset(140, 0)
        sectionToggle.BackgroundTransparency = 1
        sectionToggle.Font = Enum.Font.SourceSansSemibold
        sectionToggle.Text = "v"
        sectionToggle.TextColor3 = Color3.new(1, 1, 1)
        sectionToggle.TextSize = 14
        sectionToggle.Parent = header

        local controls = Instance.new("Frame")
        controls.Name = "Controls"
        controls.Position = UDim2.fromOffset(0, 30)
        controls.Size = UDim2.new(1, 0, 0, 0)
        controls.BackgroundTransparency = 1
        controls.Parent = holder

        local controlsLayout = Instance.new("UIListLayout")
        controlsLayout.SortOrder = Enum.SortOrder.LayoutOrder
        controlsLayout.Parent = controls

        section.Body = controls

        local function updateSectionSize()
            local height = section.Open and (30 + controlsLayout.AbsoluteContentSize.Y) or 30
            tween(holder, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(170, height)
            })
        end

        controlsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSectionSize)

        sectionToggle.MouseButton1Click:Connect(function()
            section.Open = not section.Open
            sectionToggle.Text = section.Open and "v" or "-"

            if section.Open then
                controls.Visible = true
                updateSectionSize()
            else
                tween(holder, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.fromOffset(170, 30)
                })
                task.delay(0.2, function()
                    if not section.Open then
                        controls.Visible = false
                    end
                end)
            end
        end)

        function section:CreateToggle(name, callback)
            local holder = makeControlHolder(self, name, 30)

            local label = Instance.new("TextLabel")
            label.Size = UDim2.fromOffset(125, 30)
            label.Position = UDim2.fromOffset(9, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.SourceSansBold
            label.Text = tostring(name)
            label.TextColor3 = Color3.new(1, 1, 1)
            label.TextSize = 17
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = holder

            local background = roundFrame(holder, UDim2.fromOffset(20, 20), Color3.fromRGB(65, 65, 65), 0)
            background.Position = UDim2.new(1, -28, 0.5, -10)

            local indicator = roundFrame(background, UDim2.fromOffset(16, 16), Color3.fromRGB(255, 87, 87), 1)
            indicator.Position = UDim2.fromOffset(2, 2)

            local button = Instance.new("ImageButton")
            button.Size = UDim2.fromScale(1, 1)
            button.BackgroundTransparency = 1
            button.Parent = background

            local state = false

            local function setState(value, fire)
                state = value == true
                tween(indicator, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    ImageTransparency = state and 0 or 1
                })

                if fire and callback then
                    callback(state)
                end
            end

            button.MouseButton1Click:Connect(function()
                setState(not state, true)
            end)

            return {
                Set = setState,
                Get = function()
                    return state
                end
            }
        end

        function section:CreateSlider(name, minimum, maximum, default, round, callback)
            minimum = tonumber(minimum) or 0
            maximum = tonumber(maximum) or 100
            default = tonumber(default)
            if default == nil then
                default = minimum
            end

            if maximum < minimum then
                minimum, maximum = maximum, minimum
            end

            default = math.clamp(default, minimum, maximum)

            local holder = makeControlHolder(self, name, 40)

            local label = Instance.new("TextLabel")
            label.Size = UDim2.fromOffset(125, 18)
            label.Position = UDim2.fromOffset(9, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.SourceSansSemibold
            label.Text = tostring(name)
            label.TextColor3 = Color3.new(1, 1, 1)
            label.TextSize = 16
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = holder

            local valueLabel = Instance.new("TextLabel")
            valueLabel.Size = UDim2.fromOffset(35, 18)
            valueLabel.Position = UDim2.fromOffset(127, 0)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Font = Enum.Font.SourceSansSemibold
            valueLabel.TextColor3 = Color3.new(1, 1, 1)
            valueLabel.TextSize = 14
            valueLabel.TextXAlignment = Enum.TextXAlignment.Right
            valueLabel.Parent = holder

            local bar = roundFrame(holder, UDim2.fromOffset(153, 5), Color3.fromRGB(65, 65, 65), 0)
            bar.Position = UDim2.fromOffset(9, 24)

            local fill = roundFrame(bar, UDim2.new(0, 0, 1, 0), Color3.fromRGB(120, 120, 120), 0)
            fill.Size = UDim2.new((default - minimum) / math.max(maximum - minimum, 1), 0, 1, 0)

            local hitbox = Instance.new("TextButton")
            hitbox.Size = UDim2.fromScale(1, 1)
            hitbox.BackgroundTransparency = 1
            hitbox.Text = ""
            hitbox.AutoButtonColor = false
            hitbox.Parent = bar

            local current = default
            local draggingSlider = false

            local function formatValue(value)
                if round == true then
                    return math.floor(value + 0.5)
                end

                return tonumber(string.format("%.2f", value)) or value
            end

            local function setValue(value, fire)
                value = math.clamp(tonumber(value) or minimum, minimum, maximum)
                local scale = (value - minimum) / math.max(maximum - minimum, 1)
                current = formatValue(value)

                tween(fill, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.new(scale, 0, 1, 0)
                })

                valueLabel.Text = tostring(current)

                if fire and callback then
                    callback(current)
                end
            end

            local function updateFromPosition(position)
                local x = math.clamp(
                    position.X - bar.AbsolutePosition.X,
                    0,
                    bar.AbsoluteSize.X
                )

                local scale = x / math.max(bar.AbsoluteSize.X, 1)
                local value = minimum + ((maximum - minimum) * scale)
                setValue(value, true)
            end

            local function updateFromInput(input)
                updateFromPosition(input.Position)
            end

            hitbox.MouseButton1Down:Connect(function()
                draggingSlider = true
                updateFromPosition(UserInputService:GetMouseLocation())
            end)

            UserInputService.InputChanged:Connect(function(input)
                if not draggingSlider then
                    return
                end

                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateFromInput(input)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    draggingSlider = false
                end
            end)

            setValue(default, false)

            return {
                Set = setValue,
                Get = function()
                    return current
                end
            }
        end

        function section:CreateColorPicker(name, initialColor, callback)
            initialColor = typeof(initialColor) == "Color3" and initialColor or Color3.new(1, 1, 1)

            local holder = makeControlHolder(self, name, 30)
            holder.ClipsDescendants = true

            local label = Instance.new("TextLabel")
            label.Size = UDim2.fromOffset(125, 30)
            label.Position = UDim2.fromOffset(9, 0)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.SourceSansBold
            label.Text = tostring(name)
            label.TextColor3 = Color3.new(1, 1, 1)
            label.TextSize = 17
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = holder

            local colorButton = roundFrame(holder, UDim2.fromOffset(22, 20), initialColor, 0)
            colorButton.Position = UDim2.new(1, -30, 0.5, -10)
            colorButton.Active = true

            local picker = Instance.new("Frame")
            picker.Name = "ColorPicker"
            picker.Size = UDim2.fromOffset(171, 175)
            picker.Position = UDim2.new(1, -171, 1, 0)
            picker.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            picker.BorderSizePixel = 0
            picker.Visible = false
            picker.ZIndex = 10
            picker.Parent = holder

            local pickerCorner = Instance.new("UICorner")
            pickerCorner.CornerRadius = UDim.new(0, 5)
            pickerCorner.Parent = picker

            local saturation = Instance.new("Frame")
            saturation.Size = UDim2.fromOffset(122, 114)
            saturation.Position = UDim2.fromOffset(7, 6)
            saturation.BorderSizePixel = 0
            saturation.BackgroundColor3 = Color3.fromHSV(initialColor:ToHSV())
            saturation.ZIndex = 11
            saturation.Parent = picker

            local saturationGradient = Instance.new("UIGradient")
            saturationGradient.Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 1))
            saturationGradient.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
            saturationGradient.Parent = saturation

            local darkGradient = Instance.new("UIGradient")
            darkGradient.Rotation = 90
            darkGradient.Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))
            darkGradient.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(1, 0)
            })
            darkGradient.Parent = saturation

            local satButton = Instance.new("TextButton")
            satButton.Size = UDim2.fromScale(1, 1)
            satButton.BackgroundTransparency = 1
            satButton.Text = ""
            satButton.AutoButtonColor = false
            satButton.ZIndex = 14
            satButton.Parent = saturation

            local hueBar = Instance.new("Frame")
            hueBar.Size = UDim2.fromOffset(28, 114)
            hueBar.Position = UDim2.fromOffset(136, 6)
            hueBar.BorderSizePixel = 0
            hueBar.ZIndex = 11
            hueBar.Parent = picker

            local hueGradient = Instance.new("UIGradient")
            hueGradient.Rotation = 90
            hueGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.166, Color3.fromRGB(255, 0, 255)),
                ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.666, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
            })
            hueGradient.Parent = hueBar

            local hueButton = Instance.new("TextButton")
            hueButton.Size = UDim2.fromScale(1, 1)
            hueButton.BackgroundTransparency = 1
            hueButton.Text = ""
            hueButton.AutoButtonColor = false
            hueButton.ZIndex = 14
            hueButton.Parent = hueBar

            local rainbowToggle = Instance.new("TextButton")
            rainbowToggle.Size = UDim2.fromOffset(20, 20)
            rainbowToggle.Position = UDim2.fromOffset(7, 128)
            rainbowToggle.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            rainbowToggle.Text = ""
            rainbowToggle.AutoButtonColor = false
            rainbowToggle.ZIndex = 11
            rainbowToggle.Parent = picker

            local rainbowLabel = Instance.new("TextLabel")
            rainbowLabel.Size = UDim2.fromOffset(90, 20)
            rainbowLabel.Position = UDim2.fromOffset(30, 128)
            rainbowLabel.BackgroundTransparency = 1
            rainbowLabel.Font = Enum.Font.SourceSansBold
            rainbowLabel.Text = "Rainbow"
            rainbowLabel.TextColor3 = Color3.new(1, 1, 1)
            rainbowLabel.TextSize = 14
            rainbowLabel.TextXAlignment = Enum.TextXAlignment.Left
            rainbowLabel.ZIndex = 11
            rainbowLabel.Parent = picker

            local rLabel = Instance.new("TextLabel")
            rLabel.Size = UDim2.fromOffset(50, 16)
            rLabel.Position = UDim2.fromOffset(7, 150)
            rLabel.BackgroundTransparency = 1
            rLabel.Font = Enum.Font.SourceSansBold
            rLabel.TextColor3 = Color3.new(1, 1, 1)
            rLabel.TextSize = 12
            rLabel.ZIndex = 11
            rLabel.Parent = picker

            local gLabel = rLabel:Clone()
            gLabel.Position = UDim2.fromOffset(60, 150)
            gLabel.Parent = picker

            local bLabel = rLabel:Clone()
            bLabel.Position = UDim2.fromOffset(114, 150)
            bLabel.Parent = picker

            local hue, saturationValue, value = initialColor:ToHSV()
            local rainbow = false
            local rainbowConnection

            local function updateLabels(color)
                rLabel.Text = "R: " .. math.floor(color.R * 255)
                gLabel.Text = "G: " .. math.floor(color.G * 255)
                bLabel.Text = "B: " .. math.floor(color.B * 255)
            end

            local function updateColor(fire)
                local color = Color3.fromHSV(hue, saturationValue, value)
                colorButton.ImageColor3 = color
                saturation.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
                updateLabels(color)

                if fire and callback then
                    callback(color)
                end
            end

            local function setColor(color, fire)
                if typeof(color) ~= "Color3" then
                    return
                end

                hue, saturationValue, value = color:ToHSV()
                updateColor(fire)
            end

            local function updateSaturation(input)
                local x = math.clamp(input.Position.X - saturation.AbsolutePosition.X, 0, saturation.AbsoluteSize.X)
                local y = math.clamp(input.Position.Y - saturation.AbsolutePosition.Y, 0, saturation.AbsoluteSize.Y)

                saturationValue = x / math.max(saturation.AbsoluteSize.X, 1)
                value = 1 - (y / math.max(saturation.AbsoluteSize.Y, 1))
                updateColor(true)
            end

            local function updateHue(input)
                local y = math.clamp(input.Position.Y - hueBar.AbsolutePosition.Y, 0, hueBar.AbsoluteSize.Y)
                hue = y / math.max(hueBar.AbsoluteSize.Y, 1)
                updateColor(true)
            end

            local pickingSaturation = false
            local pickingHue = false

            satButton.MouseButton1Down:Connect(function()
                pickingSaturation = true
                updateSaturation({Position = UserInputService:GetMouseLocation()})
            end)

            hueButton.MouseButton1Down:Connect(function()
                pickingHue = true
                updateHue({Position = UserInputService:GetMouseLocation()})
            end)

            UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseMovement then
                    return
                end

                if pickingSaturation then
                    updateSaturation(input)
                elseif pickingHue then
                    updateHue(input)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    pickingSaturation = false
                    pickingHue = false
                end
            end)

            local function setPickerOpen(value)
                picker.Visible = value

                if value then
                    tween(holder, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        Size = UDim2.fromOffset(170, 205)
                    })
                else
                    tween(holder, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        Size = UDim2.fromOffset(170, 30)
                    })
                end
            end

            colorButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    setPickerOpen(not picker.Visible)
                end
            end)

            rainbowToggle.MouseButton1Click:Connect(function()
                rainbow = not rainbow

                if rainbow then
                    rainbowToggle.BackgroundColor3 = Color3.fromRGB(120, 120, 120)

                    if rainbowConnection then
                        rainbowConnection:Disconnect()
                    end

                    local rotation = hue

                    rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
                        rotation = (rotation + deltaTime * 0.2) % 1
                        hue = rotation
                        updateColor(true)
                    end)
                else
                    rainbowToggle.BackgroundColor3 = Color3.fromRGB(65, 65, 65)

                    if rainbowConnection then
                        rainbowConnection:Disconnect()
                        rainbowConnection = nil
                    end
                end
            end)

            updateColor(false)

            return {
                Set = setColor,
                Get = function()
                    return Color3.fromHSV(hue, saturationValue, value)
                end
            }
        end

        function section:CreateButton(name, callback)
            local holder = makeControlHolder(self, name, 30)

            local button = Instance.new("TextButton")
            button.Name = "Button"
            button.Size = UDim2.fromOffset(153, 24)
            button.Position = UDim2.fromOffset(9, 3)
            button.BackgroundTransparency = 1
            button.AutoButtonColor = false
            button.Font = Enum.Font.SourceSansBold
            button.Text = tostring(name)
            button.TextColor3 = Color3.new(1, 1, 1)
            button.TextSize = 14
            button.ZIndex = 2
            button.Parent = holder

            local background = roundFrame(button, UDim2.fromScale(1, 1), Color3.fromRGB(65, 65, 65), 0.3)

            button.MouseEnter:Connect(function()
                tween(background, TweenInfo.new(0.12), {ImageTransparency = 0})
            end)

            button.MouseLeave:Connect(function()
                tween(background, TweenInfo.new(0.12), {ImageTransparency = 0.3})
            end)

            button.MouseButton1Click:Connect(function()
                if callback then
                    callback()
                end
            end)

            return button
        end

        function section:CreateTextbox(placeholder, callback)
            local holder = makeControlHolder(self, placeholder, 30)

            local box = Instance.new("TextBox")
            box.Name = "TextBox"
            box.Size = UDim2.fromOffset(153, 24)
            box.Position = UDim2.fromOffset(9, 3)
            box.BackgroundTransparency = 1
            box.ClipsDescendants = true
            box.Font = Enum.Font.SourceSansBold
            box.PlaceholderText = tostring(placeholder or "")
            box.Text = ""
            box.TextColor3 = Color3.new(1, 1, 1)
            box.TextSize = 14
            box.ClearTextOnFocus = false
            box.Parent = holder

            local background = roundFrame(box, UDim2.fromScale(1, 1), Color3.fromRGB(65, 65, 65), 0.2)

            box.FocusLost:Connect(function()
                if callback then
                    callback(box.Text)
                end
            end)

            return box
        end

        function section:CreateDropdown(name, options, defaultIndex, callback)
            options = options or {}

            local holder = makeControlHolder(self, name, 30)
            holder.ClipsDescendants = true

            local title = Instance.new("TextLabel")
            title.Size = UDim2.fromOffset(125, 24)
            title.Position = UDim2.fromOffset(9, 3)
            title.BackgroundTransparency = 1
            title.Font = Enum.Font.SourceSansBold
            title.TextColor3 = Color3.new(1, 1, 1)
            title.TextSize = 14
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Parent = holder

            local toggle = Instance.new("TextButton")
            toggle.Size = UDim2.fromOffset(28, 24)
            toggle.Position = UDim2.fromOffset(138, 3)
            toggle.BackgroundTransparency = 1
            toggle.Font = Enum.Font.SourceSansBold
            toggle.Text = ">"
            toggle.TextColor3 = Color3.new(1, 1, 1)
            toggle.TextSize = 15
            toggle.AutoButtonColor = false
            toggle.Parent = holder

            local background = roundFrame(holder, UDim2.fromOffset(153, 24), Color3.fromRGB(65, 65, 65), 0.15)
            background.Position = UDim2.fromOffset(9, 3)
            background.ZIndex = 0

            title.ZIndex = 2
            toggle.ZIndex = 3

            local listHolder = Instance.new("Frame")
            listHolder.Size = UDim2.fromOffset(153, 0)
            listHolder.Position = UDim2.fromOffset(9, 30)
            listHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            listHolder.BorderSizePixel = 0
            listHolder.ClipsDescendants = true
            listHolder.Visible = false
            listHolder.ZIndex = 10
            listHolder.Parent = holder

            local list = Instance.new("ScrollingFrame")
            list.Size = UDim2.fromScale(1, 1)
            list.BackgroundTransparency = 1
            list.BorderSizePixel = 0
            list.ScrollBarThickness = 3
            list.ScrollBarImageTransparency = 1
            list.CanvasSize = UDim2.new(0, 0, 0, #options * 25)
            list.ZIndex = 11
            list.Parent = listHolder

            local layout = Instance.new("UIListLayout")
            layout.SortOrder = Enum.SortOrder.LayoutOrder
            layout.Parent = list

            local selectedIndex = tonumber(defaultIndex) or 1
            selectedIndex = math.clamp(selectedIndex, 1, math.max(#options, 1))
            local open = false

            local function selectedValue()
                return options[selectedIndex]
            end

            local function close()
                open = false
                toggle.Text = ">"
                local height = math.min(#options * 25, 125)
                tween(listHolder, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.fromOffset(153, 0)
                })
                tween(holder, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.fromOffset(170, 30)
                })
                task.delay(0.15, function()
                    if not open then
                        listHolder.Visible = false
                    end
                end)
            end

            local function openList()
                open = true
                toggle.Text = "<"
                listHolder.Visible = true
                local height = math.min(#options * 25, 125)
                tween(listHolder, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.fromOffset(153, height)
                })
                tween(holder, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Size = UDim2.fromOffset(170, 30 + height)
                })
                tween(list, TweenInfo.new(0.15), {
                    ScrollBarImageTransparency = 0
                })
            end

            for index, option in ipairs(options) do
                local optionButton = Instance.new("TextButton")
                optionButton.Name = cleanName(option) .. "Button"
                optionButton.Size = UDim2.new(1, 0, 0, 25)
                optionButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                optionButton.BackgroundTransparency = 1
                optionButton.BorderSizePixel = 0
                optionButton.AutoButtonColor = false
                optionButton.Font = Enum.Font.SourceSansBold
                optionButton.Text = tostring(option)
                optionButton.TextColor3 = Color3.new(1, 1, 1)
                optionButton.TextSize = 14
                optionButton.ZIndex = 12
                optionButton.Parent = list

                optionButton.MouseEnter:Connect(function()
                    tween(optionButton, TweenInfo.new(0.1), {BackgroundTransparency = 0.5})
                end)

                optionButton.MouseLeave:Connect(function()
                    tween(optionButton, TweenInfo.new(0.1), {BackgroundTransparency = 1})
                end)

                optionButton.MouseButton1Click:Connect(function()
                    selectedIndex = index
                    title.Text = tostring(option)
                    close()

                    if callback then
                        callback(option, index)
                    end
                end)
            end

            title.Text = tostring(selectedValue() or "")

            toggle.MouseButton1Click:Connect(function()
                if open then
                    close()
                else
                    openList()
                end
            end)

            local result = {}

            function result:Set(index, fire)
                index = tonumber(index) or 1
                index = math.clamp(index, 1, math.max(#options, 1))

                if #options == 0 then
                    selectedIndex = 0
                    title.Text = ""
                    return
                end

                selectedIndex = index
                title.Text = tostring(options[index])

                if fire and callback then
                    callback(options[index], index)
                end
            end

            function result:Get()
                return selectedValue(), selectedIndex
            end

            return result
        end

        return section
    end

    return windowObject
end

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then
        return
    end

    if input.KeyCode == Enum.KeyCode.RightControl then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

return Library
