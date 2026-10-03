local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local OldGui = CoreGui:FindFirstChild("WizardLibrary")

if OldGui then
	OldGui:Destroy()
end

local WizardLibrary = {}
local Gui = Instance.new("ScreenGui")
local Container = Instance.new("Frame")

Gui.Name = "WizardLibrary"
Gui.ResetOnSpawn = false

local ok = pcall(function()
	Gui.Parent = CoreGui
end)

if not ok or not Gui.Parent then
	Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

Container.Name = "Container"
Container.Parent = Gui
Container.BackgroundColor3 = Color3.new(1, 1, 1)
Container.BackgroundTransparency = 1
Container.Size = UDim2.new(0, 100, 0, 100)

local Windows = {}

local function CleanName(text)
	return tostring(text):gsub("[^%w_]", "")
end

local function Tween(object, properties, time)
	local animation = TweenService:Create(object, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), properties)
	animation:Play()
	return animation
end

local function Dragging(object)
	local dragging = false
	local dragStart
	local startPosition
	local dragInput

	object.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		dragging = true
		dragStart = input.Position
		startPosition = object.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end)

	object.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not dragging or input ~= dragInput then
			return
		end

		local delta = input.Position - dragStart
		object.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
	end)
end

local function Round(parent, name, size, position, color, transparency)
	local image = Instance.new("ImageLabel")
	image.Name = name
	image.Parent = parent
	image.Active = true
	image.AnchorPoint = Vector2.new(0.5, 0.5)
	image.BackgroundColor3 = Color3.new(1, 1, 1)
	image.BackgroundTransparency = 1
	image.BorderSizePixel = 0
	image.Position = position
	image.Size = size
	image.Image = "rbxassetid://3570695787"
	image.ImageColor3 = color
	image.ImageTransparency = transparency or 0
	image.ScaleType = Enum.ScaleType.Slice
	image.SliceCenter = Rect.new(100, 100, 100, 100)
	image.SliceScale = 0.04
	return image
end

function WizardLibrary:NewWindow(title)
	local window = Instance.new("ImageLabel")
	local topbar = Instance.new("Frame")
	local windowToggle = Instance.new("TextButton")
	local windowTitle = Instance.new("TextLabel")
	local bottomRoundCover = Instance.new("Frame")
	local body = Instance.new("ImageLabel")
	local sorter = Instance.new("UIListLayout")
	local topbarBodyCover = Instance.new("Frame")

	window.Name = CleanName(title) .. "Window"
	window.Parent = Container
	window.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
	window.BackgroundTransparency = 1
	window.Position = UDim2.new(0, 100 + (#Windows * 180), 0, 100)
	window.Size = UDim2.new(0, 170, 0, 30)
	window.ZIndex = 2
	window.Image = "rbxassetid://3570695787"
	window.ImageColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
	window.ScaleType = Enum.ScaleType.Slice
	window.SliceCenter = Rect.new(100, 100, 100, 100)
	window.SliceScale = 0.05

	topbar.Name = "Topbar"
	topbar.Parent = window
	topbar.BackgroundColor3 = Color3.new(1, 1, 1)
	topbar.BackgroundTransparency = 1
	topbar.BorderSizePixel = 0
	topbar.Size = UDim2.new(0, 170, 0, 30)
	topbar.ZIndex = 2

	windowToggle.Name = "WindowToggle"
	windowToggle.Parent = topbar
	windowToggle.BackgroundColor3 = Color3.new(1, 1, 1)
	windowToggle.BackgroundTransparency = 1
	windowToggle.Position = UDim2.new(0.822450161, 0, 0, 0)
	windowToggle.Size = UDim2.new(0, 30, 0, 30)
	windowToggle.ZIndex = 2
	windowToggle.Font = Enum.Font.SourceSansSemibold
	windowToggle.Text = "-"
	windowToggle.TextColor3 = Color3.new(1, 1, 1)
	windowToggle.TextSize = 20
	windowToggle.TextWrapped = true

	windowTitle.Name = "WindowTitle"
	windowTitle.Parent = topbar
	windowTitle.BackgroundColor3 = Color3.new(1, 1, 1)
	windowTitle.BackgroundTransparency = 1
	windowTitle.Size = UDim2.new(0, 170, 0, 30)
	windowTitle.ZIndex = 2
	windowTitle.Font = Enum.Font.SourceSansBold
	windowTitle.Text = title
	windowTitle.TextColor3 = Color3.new(1, 1, 1)
	windowTitle.TextSize = 17

	bottomRoundCover.Name = "BottomRoundCover"
	bottomRoundCover.Parent = topbar
	bottomRoundCover.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
	bottomRoundCover.BorderSizePixel = 0
	bottomRoundCover.Position = UDim2.new(0, 0, 0.833333313, 0)
	bottomRoundCover.Size = UDim2.new(0, 170, 0, 5)
	bottomRoundCover.ZIndex = 2

	body.Name = "Body"
	body.Parent = window
	body.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
	body.BackgroundTransparency = 1
	body.ClipsDescendants = true
	body.Size = UDim2.new(0, 170, 0, 35)
	body.Image = "rbxassetid://3570695787"
	body.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
	body.ScaleType = Enum.ScaleType.Slice
	body.SliceCenter = Rect.new(100, 100, 100, 100)
	body.SliceScale = 0.05

	sorter.Name = "Sorter"
	sorter.Parent = body
	sorter.SortOrder = Enum.SortOrder.LayoutOrder

	topbarBodyCover.Name = "TopbarBodyCover"
	topbarBodyCover.Parent = body
	topbarBodyCover.BackgroundColor3 = Color3.new(1, 1, 1)
	topbarBodyCover.BackgroundTransparency = 1
	topbarBodyCover.BorderSizePixel = 0
	topbarBodyCover.Size = UDim2.new(0, 170, 0, 30)

	local windowData = {
		Window = window,
		Body = body,
		Layout = sorter,
		Collapsed = false,
		Height = 0,
		Sections = {}
	}

	table.insert(Windows, windowData)

	local function UpdateWindow()
		local height = 30 + windowData.Height
		if height < 30 then
			height = 30
		end

		if not windowData.Collapsed then
			Tween(window, {Size = UDim2.new(0, 170, 0, height)})
		end
	end

	windowData.Update = UpdateWindow

	windowToggle.MouseButton1Down:Connect(function()
		if windowData.Collapsed then
			windowData.Collapsed = false
			windowToggle.Text = "-"
			body.Visible = true
			UpdateWindow()
		else
			windowData.Collapsed = true
			windowToggle.Text = "v"
			body.Visible = false
			Tween(window, {Size = UDim2.new(0, 170, 0, 30)})
		end
	end)

	Dragging(window)

	function windowData:NewSection(sectionTitle)
		local section = Instance.new("Frame")
		local sectionInfo = Instance.new("Frame")
		local sectionToggle = Instance.new("TextButton")
		local sectionTitleLabel = Instance.new("TextLabel")
		local layout = Instance.new("UIListLayout")

		section.Name = CleanName(sectionTitle) .. "Section"
		section.Parent = body
		section.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
		section.BorderSizePixel = 0
		section.ClipsDescendants = true
		section.Size = UDim2.new(0, 170, 0, 30)

		sectionInfo.Name = "SectionInfo"
		sectionInfo.Parent = section
		sectionInfo.BackgroundColor3 = Color3.new(1, 1, 1)
		sectionInfo.BackgroundTransparency = 1
		sectionInfo.Size = UDim2.new(0, 170, 0, 30)

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
		sectionToggle.TextWrapped = true

		sectionTitleLabel.Name = "SectionTitle"
		sectionTitleLabel.Parent = sectionInfo
		sectionTitleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
		sectionTitleLabel.BackgroundTransparency = 1
		sectionTitleLabel.BorderSizePixel = 0
		sectionTitleLabel.Position = UDim2.new(0.052941177, 0, 0, 0)
		sectionTitleLabel.Size = UDim2.new(0, 125, 0, 30)
		sectionTitleLabel.Font = Enum.Font.SourceSansBold
		sectionTitleLabel.Text = sectionTitle
		sectionTitleLabel.TextColor3 = Color3.new(1, 1, 1)
		sectionTitleLabel.TextSize = 17
		sectionTitleLabel.TextXAlignment = Enum.TextXAlignment.Left

		layout.Name = "Layout"
		layout.Parent = section
		layout.SortOrder = Enum.SortOrder.LayoutOrder

		local sectionData = {
			Frame = section,
			Body = section,
			Open = true,
			Height = 0
		}

		table.insert(windowData.Sections, sectionData)

		local function UpdateSection()
			local size = sectionData.Open and (30 + sectionData.Height) or 30
			Tween(section, {Size = UDim2.new(0, 170, 0, size)})

			local total = 0
			for _, other in ipairs(windowData.Sections) do
				total += other.Open and (30 + other.Height) or 30
			end
			windowData.Height = total
			UpdateWindow()
		end

		sectionData.Update = UpdateSection

		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			sectionData.Height = math.max(0, layout.AbsoluteContentSize.Y - 30)
			UpdateSection()
		end)

		sectionToggle.MouseButton1Down:Connect(function()
			sectionData.Open = not sectionData.Open
			sectionToggle.Text = sectionData.Open and "v" or "-"
			UpdateSection()
		end)

		local function AddHeight(amount)
			sectionData.Height += amount
			UpdateSection()
		end

		function sectionData:CreateToggle(name, callback)
			local holder = Instance.new("Frame")
			local titleLabel = Instance.new("TextLabel")
			local toggleBackground = Instance.new("ImageLabel")
			local toggleButton = Instance.new("ImageButton")

			holder.Name = CleanName(name) .. "ToggleHolder"
			holder.Parent = section
			holder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			holder.BorderSizePixel = 0
			holder.Size = UDim2.new(0, 170, 0, 30)

			titleLabel.Name = "ToggleTitle"
			titleLabel.Parent = holder
			titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			titleLabel.BackgroundTransparency = 1
			titleLabel.BorderSizePixel = 0
			titleLabel.Position = UDim2.new(0.052941177, 0, 0, 0)
			titleLabel.Size = UDim2.new(0, 125, 0, 30)
			titleLabel.Font = Enum.Font.SourceSansBold
			titleLabel.Text = name
			titleLabel.TextColor3 = Color3.new(1, 1, 1)
			titleLabel.TextSize = 17
			titleLabel.TextXAlignment = Enum.TextXAlignment.Left

		toggleBackground.Name = "ToggleBackground"
		toggleBackground.Parent = holder
		toggleBackground.BackgroundColor3 = Color3.new(1, 1, 1)
		toggleBackground.BackgroundTransparency = 1
		toggleBackground.BorderSizePixel = 0
		toggleBackground.Position = UDim2.new(0.847058833, 0, 0.166666672, 0)
		toggleBackground.Size = UDim2.new(0, 20, 0, 20)
		toggleBackground.Image = "rbxassetid://3570695787"
		toggleBackground.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)

		toggleButton.Name = "ToggleButton"
		toggleButton.Parent = toggleBackground
		toggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
		toggleButton.BackgroundTransparency = 1
		toggleButton.Position = UDim2.new(0, 2, 0, 2)
		toggleButton.Size = UDim2.new(0, 16, 0, 16)
		toggleButton.Image = "rbxassetid://3570695787"
		toggleButton.ImageColor3 = Color3.new(1, 0.341176, 0.341176)
		toggleButton.ImageTransparency = 1

		local state = false
		toggleButton.MouseButton1Down:Connect(function()
			state = not state
			Tween(toggleButton, {ImageTransparency = state and 0 or 1})
			if callback then
				callback(state)
			end
		end)

		AddHeight(30)

		return {
			Set = function(_, value, fire)
				state = value == true
				Tween(toggleButton, {ImageTransparency = state and 0 or 1})
				if fire and callback then
					callback(state)
				end
			end,
			Get = function()
				return state
			end
		}
		end

		function sectionData:CreateSlider(name, minimum, maximum, defaultValue, roundValue, callback)
			local holder = Instance.new("Frame")
			local titleLabel = Instance.new("TextLabel")
			local valueHolder = Instance.new("ImageLabel")
			local valueLabel = Instance.new("TextLabel")
			local sliderBackground = Instance.new("ImageLabel")
			local slider = Instance.new("ImageLabel")

			minimum = tonumber(minimum) or 0
			maximum = tonumber(maximum) or 100
			defaultValue = tonumber(defaultValue) or minimum
			if maximum == minimum then
				maximum = minimum + 1
			end

			holder.Name = CleanName(name) .. "SliderHolder"
			holder.Parent = section
			holder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			holder.BorderSizePixel = 0
			holder.Size = UDim2.new(0, 170, 0, 30)

			titleLabel.Name = "SliderTitle"
			titleLabel.Parent = holder
			titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			titleLabel.BackgroundTransparency = 1
			titleLabel.BorderSizePixel = 0
			titleLabel.Position = UDim2.new(0.052941177, 0, 0, 0)
			titleLabel.Size = UDim2.new(0, 125, 0, 15)
			titleLabel.Font = Enum.Font.SourceSansSemibold
			titleLabel.Text = name
			titleLabel.TextColor3 = Color3.new(1, 1, 1)
			titleLabel.TextSize = 17
			titleLabel.TextXAlignment = Enum.TextXAlignment.Left

			valueHolder.Name = "SliderValueHolder"
			valueHolder.Parent = holder
			valueHolder.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			valueHolder.BackgroundTransparency = 1
			valueHolder.Position = UDim2.new(0.747058809, 0, 0, 0)
			valueHolder.Size = UDim2.new(0, 35, 0, 15)
			valueHolder.Image = "rbxassetid://3570695787"
			valueHolder.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			valueHolder.ImageTransparency = 0.5
			valueHolder.ScaleType = Enum.ScaleType.Slice
			valueHolder.SliceCenter = Rect.new(100, 100, 100, 100)
			valueHolder.SliceScale = 0.02

			valueLabel.Name = "SliderValue"
			valueLabel.Parent = valueHolder
			valueLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			valueLabel.BackgroundTransparency = 1
			valueLabel.Size = UDim2.new(0, 35, 0, 15)
			valueLabel.Font = Enum.Font.SourceSansSemibold
			valueLabel.TextColor3 = Color3.new(1, 1, 1)
			valueLabel.TextSize = 14

			sliderBackground.Name = "SliderBackground"
			sliderBackground.Parent = holder
			sliderBackground.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			sliderBackground.BackgroundTransparency = 1
			sliderBackground.Position = UDim2.new(0.0529999994, 0, 0.649999976, 0)
			sliderBackground.Selectable = true
			sliderBackground.Size = UDim2.new(0, 153, 0, 5)
			sliderBackground.Image = "rbxassetid://3570695787"
			sliderBackground.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			sliderBackground.ImageTransparency = 0.5
			sliderBackground.ScaleType = Enum.ScaleType.Slice
			sliderBackground.SliceCenter = Rect.new(100, 100, 100, 100)
			sliderBackground.ClipsDescendants = true
			sliderBackground.SliceScale = 0.02

			slider.Name = "Slider"
			slider.Parent = sliderBackground
		slider.BackgroundColor3 = Color3.new(1, 1, 1)
			slider.BackgroundTransparency = 1
			slider.Size = UDim2.new(0, 0, 0, 5)
			slider.Image = "rbxassetid://3570695787"
			slider.ScaleType = Enum.ScaleType.Slice
			slider.SliceCenter = Rect.new(100, 100, 100, 100)
			slider.SliceScale = 0.02

			local value = defaultValue
			local dragging = false

			local function formatValue(number)
				if roundValue then
					return math.floor(number)
				end
				return tonumber(string.format("%.2f", number))
			end

			local function SetValue(number, fire)
				number = math.clamp(tonumber(number) or minimum, minimum, maximum)
				local ratio = (number - minimum) / (maximum - minimum)
				value = formatValue(number)
				slider.Size = UDim2.new(ratio, 0, 1.15, 0)
				valueLabel.Text = tostring(value)
				if fire and callback then
					callback(value)
				end
			end

			local function Update(input)
				local ratio = math.clamp((input.Position.X - sliderBackground.AbsolutePosition.X) / math.max(sliderBackground.AbsoluteSize.X, 1), 0, 1)
				SetValue(minimum + ratio * (maximum - minimum), true)
			end

			sliderBackground.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					Update(input)
				end
			end)

			sliderBackground.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					Update(input)
				end
			end)

			SetValue(value, false)
			AddHeight(30)

			return {
				Set = function(_, number, fire)
					SetValue(number, fire)
				end,
				Get = function()
					return value
				end
			}
		end

		function sectionData:CreateColorPicker(name, color, callback)
			local holder = Instance.new("Frame")
			local titleLabel = Instance.new("TextLabel")
			local colorToggle = Instance.new("ImageButton")
			local colorMain = Instance.new("ImageLabel")
			local rainbowToggleHolder = Instance.new("Frame")
			local rainbowTitle = Instance.new("TextLabel")
			local rainbowBackground = Instance.new("ImageLabel")
			local rainbowToggleButton = Instance.new("ImageButton")
			local colorValueR = Instance.new("TextLabel")
			local colorValueRRound = Instance.new("ImageButton")
			local colorValueG = Instance.new("TextLabel")
			local colorValueGRound = Instance.new("ImageButton")
			local colorValueB = Instance.new("TextLabel")
			local colorValueBRound = Instance.new("ImageButton")
			local roundHueHolder = Instance.new("ImageLabel")
			local colorHue = Instance.new("ImageLabel")
			local hueMarker = Instance.new("Frame")
			local roundSaturationHolder = Instance.new("ImageLabel")
			local colorSelector = Instance.new("ImageLabel")
			local saturationMarker = Instance.new("ImageLabel")

			color = typeof(color) == "Color3" and color or Color3.new(1, 1, 1)
			local hue, saturation, value = color:ToHSV()
			local opened = false
			local rainbow = false
			local hueConnection

			holder.Name = CleanName(name) .. "ColorPickerHolder"
			holder.Parent = section
			holder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			holder.BorderSizePixel = 0
			holder.Size = UDim2.new(0, 170, 0, 30)
			holder.ClipsDescendants = false

			titleLabel.Name = "ColorPickerTitle"
			titleLabel.Parent = holder
			titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			titleLabel.BackgroundTransparency = 1
			titleLabel.BorderSizePixel = 0
			titleLabel.Position = UDim2.new(0.052941177, 0, 0, 0)
			titleLabel.Size = UDim2.new(0, 125, 0, 30)
			titleLabel.Font = Enum.Font.SourceSansBold
			titleLabel.Text = name
			titleLabel.TextColor3 = Color3.new(1, 1, 1)
			titleLabel.TextSize = 17
			titleLabel.TextXAlignment = Enum.TextXAlignment.Left

			colorToggle.Name = "ColorPickerToggle"
			colorToggle.Parent = holder
			colorToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			colorToggle.BackgroundTransparency = 1
			colorToggle.Position = UDim2.new(0.822000027, 0, 0.166999996, 0)
			colorToggle.Size = UDim2.new(0, 22, 0, 20)
			colorToggle.Image = "rbxassetid://3570695787"
			colorToggle.ImageColor3 = color
			colorToggle.ScaleType = Enum.ScaleType.Slice
			colorToggle.SliceCenter = Rect.new(100, 100, 100, 100)
			colorToggle.SliceScale = 0.04

			colorMain.Name = "ColorPickerMain"
			colorMain.Parent = holder
			colorMain.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			colorMain.BackgroundTransparency = 1
			colorMain.ClipsDescendants = true
			colorMain.BorderSizePixel = 0
			colorMain.Position = UDim2.new(1.04705882, 0, -1.36666667, 0)
			colorMain.Size = UDim2.new(0, 0, 0, 175)
			colorMain.Image = "rbxassetid://3570695787"
			colorMain.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			colorMain.ScaleType = Enum.ScaleType.Slice
			colorMain.SliceCenter = Rect.new(100, 100, 100, 100)
			colorMain.SliceScale = 0.05
			colorMain.ZIndex = 1

			rainbowToggleHolder.Name = "RainbowToggleHolder"
			rainbowToggleHolder.Parent = colorMain
			rainbowToggleHolder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			rainbowToggleHolder.BackgroundTransparency = 1
			rainbowToggleHolder.BorderSizePixel = 0
			rainbowToggleHolder.Position = UDim2.new(0, 0, 0.819999993, 0)
			rainbowToggleHolder.Size = UDim2.new(0, 170, 0, 30)
			rainbowToggleHolder.ZIndex = 2

			rainbowTitle.Name = "RainbowTitle"
			rainbowTitle.Parent = rainbowToggleHolder
			rainbowTitle.BackgroundColor3 = Color3.new(1, 1, 1)
			rainbowTitle.BackgroundTransparency = 1
			rainbowTitle.BorderSizePixel = 0
			rainbowTitle.Position = UDim2.new(0.052941177, 0, 0, 0)
			rainbowTitle.Size = UDim2.new(0, 125, 0, 30)
			rainbowTitle.Font = Enum.Font.SourceSansBold
			rainbowTitle.Text = "Rainbow"
			rainbowTitle.TextColor3 = Color3.new(1, 1, 1)
			rainbowTitle.TextSize = 17
			rainbowTitle.TextXAlignment = Enum.TextXAlignment.Left
			rainbowTitle.ZIndex = 2

			rainbowBackground.Name = "RainbowBackground"
			rainbowBackground.Parent = rainbowToggleHolder
			rainbowBackground.BackgroundColor3 = Color3.new(1, 1, 1)
			rainbowBackground.BackgroundTransparency = 1
			rainbowBackground.BorderSizePixel = 0
			rainbowBackground.Position = UDim2.new(0.847058833, 0, 0.166666672, 0)
			rainbowBackground.Size = UDim2.new(0, 20, 0, 20)
			rainbowBackground.Image = "rbxassetid://3570695787"
			rainbowBackground.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			rainbowBackground.ZIndex = 2

			rainbowToggleButton.Name = "RainbowToggleButton"
			rainbowToggleButton.Parent = rainbowBackground
			rainbowToggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
			rainbowToggleButton.BackgroundTransparency = 1
			rainbowToggleButton.Position = UDim2.new(0, 2, 0, 2)
			rainbowToggleButton.Size = UDim2.new(0, 16, 0, 16)
			rainbowToggleButton.Image = "rbxassetid://3570695787"
			rainbowToggleButton.ImageColor3 = Color3.new(1, 0.341176, 0.341176)
		rainbowToggleButton.ImageTransparency = 1
		rainbowToggleButton.ZIndex = 2

		colorValueR.Name = "ColorValueR"
		colorValueR.Parent = colorMain
		colorValueR.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
		colorValueR.BackgroundTransparency = 1
		colorValueR.BorderSizePixel = 0
		colorValueR.ClipsDescendants = true
		colorValueR.Position = UDim2.new(0, 7, 0, 127)
		colorValueR.Size = UDim2.new(0, 50, 0, 16)
		colorValueR.ZIndex = 3
		colorValueR.Font = Enum.Font.SourceSansBold
		colorValueR.TextColor3 = Color3.new(1, 1, 1)
		colorValueR.TextSize = 14

		colorValueRRound.Name = "ColorValueRRound"
		colorValueRRound.Parent = colorValueR
		colorValueRRound.Active = true
		colorValueRRound.AnchorPoint = Vector2.new(0.5, 0.5)
		colorValueRRound.BackgroundColor3 = Color3.new(1, 1, 1)
		colorValueRRound.BackgroundTransparency = 1
		colorValueRRound.Position = UDim2.new(0.5, 0, 0.5, 0)
		colorValueRRound.Selectable = true
		colorValueRRound.Size = UDim2.new(1, 0, 1, 0)
		colorValueRRound.Image = "rbxassetid://3570695787"
		colorValueRRound.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)
		colorValueRRound.ScaleType = Enum.ScaleType.Slice
		colorValueRRound.SliceCenter = Rect.new(100, 100, 100, 100)
		colorValueRRound.SliceScale = 0.04
		colorValueRRound.ZIndex = 2

		colorValueG = colorValueR:Clone()
		colorValueG.ColorValueRRound:Destroy()
		colorValueG.Name = "ColorValueG"
		colorValueG.Position = UDim2.new(0, 60, 0, 127)
		colorValueG.Parent = colorMain
		colorValueG.Text = "G: 000"

		colorValueGRound = colorValueRRound:Clone()
		colorValueGRound.Name = "ColorValueGRound"
		colorValueGRound.Parent = colorValueG

		colorValueB = colorValueR:Clone()
		colorValueB.ColorValueRRound:Destroy()
		colorValueB.Name = "ColorValueB"
		colorValueB.Position = UDim2.new(0, 114, 0, 127)
		colorValueB.Parent = colorMain
		colorValueB.Text = "B: 000"

		colorValueBRound = colorValueRRound:Clone()
		colorValueBRound.Name = "ColorValueBRound"
		colorValueBRound.Parent = colorValueB

		roundHueHolder.Name = "RoundHueHolder"
		roundHueHolder.Parent = colorMain
		roundHueHolder.BackgroundColor3 = Color3.new(1, 1, 1)
		roundHueHolder.BackgroundTransparency = 1
		roundHueHolder.ClipsDescendants = true
		roundHueHolder.Position = UDim2.new(0, 136, 0, 6)
		roundHueHolder.Size = UDim2.new(0, 28, 0, 114)
		roundHueHolder.ZIndex = 3
		roundHueHolder.Image = "rbxassetid://4695575676"
		roundHueHolder.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
		roundHueHolder.ScaleType = Enum.ScaleType.Slice
		roundHueHolder.SliceCenter = Rect.new(128, 128, 128, 128)
		roundHueHolder.SliceScale = 0.05

		colorHue.Name = "ColorHue"
		colorHue.Parent = roundHueHolder
		colorHue.BackgroundColor3 = Color3.new(1, 1, 1)
		colorHue.BackgroundTransparency = 1
		colorHue.BorderSizePixel = 0
		colorHue.Size = UDim2.new(0, 28, 0, 114)
		colorHue.Image = "http://www.roblox.com/asset/?id=4801885250"
		colorHue.ScaleType = Enum.ScaleType.Crop
		colorHue.ZIndex = 2

		hueMarker.Name = "HueMarker"
		hueMarker.Parent = roundHueHolder
		hueMarker.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
		hueMarker.BorderSizePixel = 0
		hueMarker.Position = UDim2.new(-0.25, 0, 0, 0)
		hueMarker.Size = UDim2.new(0, 42, 0, 5)
		hueMarker.ZIndex = 2

		roundSaturationHolder.Name = "RoundSaturationHolder"
		roundSaturationHolder.Parent = colorMain
		roundSaturationHolder.BackgroundColor3 = Color3.new(1, 1, 1)
		roundSaturationHolder.BackgroundTransparency = 1
		roundSaturationHolder.ClipsDescendants = true
		roundSaturationHolder.Position = UDim2.new(0, 7, 0, 6)
		roundSaturationHolder.Size = UDim2.new(0, 122, 0, 114)
		roundSaturationHolder.ZIndex = 3
		roundSaturationHolder.Image = "rbxassetid://4695575676"
		roundSaturationHolder.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
		roundSaturationHolder.ScaleType = Enum.ScaleType.Slice
		roundSaturationHolder.SliceCenter = Rect.new(128, 128, 128, 128)
		roundSaturationHolder.SliceScale = 0.05

		colorSelector.Name = "ColorSelector"
		colorSelector.Parent = roundSaturationHolder
		colorSelector.BackgroundColor3 = color
		colorSelector.BorderSizePixel = 0
		colorSelector.Size = UDim2.new(0, 122, 0, 114)
		colorSelector.Image = "rbxassetid://4805274903"
		colorSelector.ZIndex = 2

		saturationMarker.Name = "SaturationMarker"
		saturationMarker.Parent = roundSaturationHolder
		saturationMarker.BackgroundColor3 = Color3.new(1, 1, 1)
		saturationMarker.BackgroundTransparency = 1
		saturationMarker.Size = UDim2.new(0, 0, 0, 0)
		saturationMarker.Image = "http://www.roblox.com/asset/?id=4805639000"
		saturationMarker.ZIndex = 2

		local saturationDrag = false
		local hueDrag = false

		local function UpdateColor(fire)
			local newColor = Color3.fromHSV(hue, saturation, value)
			colorToggle.ImageColor3 = newColor
			colorSelector.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
			colorValueR.Text = "R: " .. math.floor(newColor.R * 255)
			colorValueG.Text = "G: " .. math.floor(newColor.G * 255)
			colorValueB.Text = "B: " .. math.floor(newColor.B * 255)

			saturationMarker.Position = UDim2.new(saturation, 0, 1 - value, 0)
			hueMarker.Position = UDim2.new(-0.25, 0, hue, -2)

			if callback and fire then
				callback(newColor)
			end
		end

		local function UpdateSaturation(input)
			local x = math.clamp(input.Position.X - roundSaturationHolder.AbsolutePosition.X, 0, roundSaturationHolder.AbsoluteSize.X)
			local y = math.clamp(input.Position.Y - roundSaturationHolder.AbsolutePosition.Y, 0, roundSaturationHolder.AbsoluteSize.Y)
			saturation = x / math.max(roundSaturationHolder.AbsoluteSize.X, 1)
			value = 1 - (y / math.max(roundSaturationHolder.AbsoluteSize.Y, 1))
			UpdateColor(true)
		end

		local function UpdateHue(input)
			local y = math.clamp(input.Position.Y - roundHueHolder.AbsolutePosition.Y, 0, roundHueHolder.AbsoluteSize.Y)
			hue = y / math.max(roundHueHolder.AbsoluteSize.Y, 1)
			UpdateColor(true)
		end

		colorToggle.MouseButton1Down:Connect(function()
			opened = not opened
			Tween(colorMain, {Size = opened and UDim2.new(0, 171, 0, 175) or UDim2.new(0, 0, 0, 175)})
		end)

		local hueInput = Instance.new("TextButton")
		hueInput.BackgroundTransparency = 1
		hueInput.Size = UDim2.fromScale(1, 1)
		hueInput.Text = ""
		hueInput.ZIndex = 10
		hueInput.Parent = roundHueHolder

		local satInput = Instance.new("TextButton")
		satInput.BackgroundTransparency = 1
		satInput.Size = UDim2.fromScale(1, 1)
		satInput.Text = ""
		satInput.ZIndex = 10
		satInput.Parent = roundSaturationHolder

		satInput.MouseButton1Down:Connect(function()
			saturationDrag = true
			UpdateSaturation({Position = UserInputService:GetMouseLocation()})
		end)

		hueInput.MouseButton1Down:Connect(function()
			hueDrag = true
			UpdateHue({Position = UserInputService:GetMouseLocation()})
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseMovement then
				return
			end
			if saturationDrag then
				UpdateSaturation(input)
			elseif hueDrag then
				UpdateHue(input)
			end
		end)

		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				saturationDrag = false
				hueDrag = false
			end
		end)

		rainbowToggleButton.MouseButton1Down:Connect(function()
			rainbow = not rainbow
			Tween(rainbowToggleButton, {ImageTransparency = rainbow and 0 or 1})

			if hueConnection then
				hueConnection:Disconnect()
				hueConnection = nil
			end

			if rainbow then
				hueConnection = RunService.RenderStepped:Connect(function(deltaTime)
					hue = (hue + deltaTime * 0.2) % 1
					UpdateColor(true)
				end)
			end
		end)

		UpdateColor(false)
		AddHeight(30)

		return {
			Set = function(_, newColor, fire)
				if typeof(newColor) ~= "Color3" then
					return
				end
				hue, saturation, value = newColor:ToHSV()
				UpdateColor(fire)
			end,
			Get = function()
				return Color3.fromHSV(hue, saturation, value)
			end
		}
		end

		function sectionData:CreateButton(name, callback)
			local holder = Instance.new("Frame")
			local button = Instance.new("TextButton")
			local round = Instance.new("ImageLabel")

			holder.Name = CleanName(name) .. "ButtonHolder"
			holder.Parent = section
			holder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			holder.BorderSizePixel = 0
			holder.Size = UDim2.new(0, 170, 0, 30)

			button.Name = "Button"
			button.Parent = holder
			button.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			button.BackgroundTransparency = 1
			button.BorderSizePixel = 0
			button.Position = UDim2.new(0.052941177, 0, 0, 0)
			button.Size = UDim2.new(0, 153, 0, 24)
			button.ZIndex = 2
			button.AutoButtonColor = false
			button.Font = Enum.Font.SourceSansBold
			button.Text = name
			button.TextColor3 = Color3.new(1, 1, 1)
			button.TextSize = 14

			round.Name = "ButtonRound"
			round.Parent = button
			round.Active = true
			round.AnchorPoint = Vector2.new(0.5, 0.5)
			round.BackgroundColor3 = Color3.new(1, 1, 1)
			round.BackgroundTransparency = 1
			round.BorderSizePixel = 0
			round.ClipsDescendants = true
			round.Position = UDim2.new(0.5, 0, 0.5, 0)
			round.Selectable = true
			round.Size = UDim2.new(1, 0, 1, 0)
			round.Image = "rbxassetid://3570695787"
			round.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			round.ScaleType = Enum.ScaleType.Slice
			round.SliceCenter = Rect.new(100, 100, 100, 100)
			round.SliceScale = 0.04

			button.MouseButton1Down:Connect(function()
				if callback then
					callback()
				end
			end)

			AddHeight(30)
			return button
		end

		function sectionData:CreateTextbox(name, callback)
			local holder = Instance.new("Frame")
			local textbox = Instance.new("TextBox")
			local round = Instance.new("ImageLabel")

			holder.Name = CleanName(name) .. "TextBoxHolder"
			holder.Parent = section
			holder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			holder.BorderSizePixel = 0
			holder.Size = UDim2.new(0, 170, 0, 30)

			textbox.Parent = holder
			textbox.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			textbox.BackgroundTransparency = 1
			textbox.ClipsDescendants = true
			textbox.Position = UDim2.new(0.0529999994, 0, 0, 0)
			textbox.Size = UDim2.new(0, 153, 0, 24)
			textbox.ZIndex = 2
			textbox.Font = Enum.Font.SourceSansBold
			textbox.PlaceholderText = name
			textbox.Text = ""
			textbox.TextColor3 = Color3.new(1, 1, 1)
			textbox.TextSize = 14

			round.Name = "TextBoxRound"
			round.Parent = textbox
			round.Active = true
			round.AnchorPoint = Vector2.new(0.5, 0.5)
			round.BackgroundColor3 = Color3.new(1, 1, 1)
			round.BackgroundTransparency = 1
			round.BorderSizePixel = 0
			round.ClipsDescendants = true
			round.Position = UDim2.new(0.5, 0, 0.5, 0)
			round.Selectable = true
			round.Size = UDim2.new(1, 0, 1, 0)
			round.Image = "rbxassetid://3570695787"
			round.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			round.ScaleType = Enum.ScaleType.Slice
			round.SliceCenter = Rect.new(100, 100, 100, 100)
			round.SliceScale = 0.04

			textbox.FocusLost:Connect(function()
				if callback then
					callback(textbox.Text)
				end
			end)

			AddHeight(30)
			return textbox
		end

		function sectionData:CreateDropdown(name, options, defaultIndex, callback)
			options = options or {}
			local holder = Instance.new("Frame")
			local titleLabel = Instance.new("TextLabel")
			local dropdownRound = Instance.new("ImageLabel")
			local dropdownToggle = Instance.new("TextButton")
			local dropdownMain = Instance.new("ImageLabel")
			local scrolling = Instance.new("ScrollingFrame")
			local buttonLayout = Instance.new("UIListLayout")

			holder.Name = CleanName(name) .. "DropdownHolder"
			holder.Parent = section
			holder.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			holder.BorderSizePixel = 0
			holder.Size = UDim2.new(0, 170, 0, 30)
			holder.ClipsDescendants = false

			titleLabel.Name = "DropdownTitle"
			titleLabel.Parent = holder
			titleLabel.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			titleLabel.BackgroundTransparency = 1
			titleLabel.BorderSizePixel = 0
			titleLabel.Position = UDim2.new(0.0529999994, 0, 0, 0)
			titleLabel.Size = UDim2.new(0, 153, 0, 24)
			titleLabel.ZIndex = 2
			titleLabel.Font = Enum.Font.SourceSansBold
			titleLabel.TextColor3 = Color3.new(1, 1, 1)
			titleLabel.TextSize = 14

			dropdownRound.Name = "DropdownRound"
			dropdownRound.Parent = titleLabel
			dropdownRound.Active = true
			dropdownRound.AnchorPoint = Vector2.new(0.5, 0.5)
			dropdownRound.BackgroundColor3 = Color3.new(1, 1, 1)
			dropdownRound.BackgroundTransparency = 1
			dropdownRound.BorderSizePixel = 0
			dropdownRound.ClipsDescendants = true
			dropdownRound.Position = UDim2.new(0.5, 0, 0.5, 0)
			dropdownRound.Selectable = true
			dropdownRound.Size = UDim2.new(1, 0, 1, 0)
			dropdownRound.Image = "rbxassetid://3570695787"
			dropdownRound.ImageColor3 = Color3.new(0.254902, 0.254902, 0.254902)
			dropdownRound.ScaleType = Enum.ScaleType.Slice
			dropdownRound.SliceCenter = Rect.new(100, 100, 100, 100)
			dropdownRound.SliceScale = 0.04

			dropdownToggle.Name = "DropdownToggle"
			dropdownToggle.Parent = titleLabel
			dropdownToggle.BackgroundColor3 = Color3.new(1, 1, 1)
			dropdownToggle.BackgroundTransparency = 1
			dropdownToggle.Position = UDim2.new(0.816928029, 0, 0, 0)
			dropdownToggle.Size = UDim2.new(0, 28, 0, 24)
			dropdownToggle.AutoButtonColor = false
			dropdownToggle.Font = Enum.Font.SourceSansBold
			dropdownToggle.Text = ">"
			dropdownToggle.TextColor3 = Color3.new(1, 1, 1)
			dropdownToggle.TextSize = 15
			dropdownToggle.ZIndex = 3

			dropdownMain.Name = "DropdownMain"
			dropdownMain.Parent = titleLabel
			dropdownMain.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
			dropdownMain.BackgroundTransparency = 1
			dropdownMain.ClipsDescendants = true
			dropdownMain.Position = UDim2.new(1.09275186, 0, -0.0336658955, 0)
			dropdownMain.Size = UDim2.new(0, 0, 0, 0)
		dropdownMain.Image = "rbxassetid://3570695787"
		dropdownMain.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
		dropdownMain.ScaleType = Enum.ScaleType.Slice
		dropdownMain.SliceCenter = Rect.new(100, 100, 100, 100)
		dropdownMain.SliceScale = 0.04

		scrolling.Parent = dropdownMain
		scrolling.BackgroundColor3 = Color3.new(1, 1, 1)
		scrolling.BackgroundTransparency = 1
		scrolling.BorderSizePixel = 0
		scrolling.Size = UDim2.new(0, 153, 0, 0)
		scrolling.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		scrolling.CanvasSize = UDim2.new(0, 0, 1, 0)
		scrolling.ScrollBarThickness = 3
		scrolling.ScrollBarImageTransparency = 1
		scrolling.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		scrolling.ScrollingDirection = Enum.ScrollingDirection.Y

		buttonLayout.Name = "ButtonLayout"
		buttonLayout.Parent = scrolling
		buttonLayout.SortOrder = Enum.SortOrder.LayoutOrder

		local selected = tonumber(defaultIndex) or 1
		selected = math.clamp(selected, 1, math.max(#options, 1))
		local open = false
		local itemHeight = 25
		local visibleHeight = math.min(#options * itemHeight, 100)
		titleLabel.Text = tostring(options[selected] or "")

		for index, option in ipairs(options) do
			local optionButton = Instance.new("TextButton")
			optionButton.Name = CleanName(option) .. "Button"
			optionButton.Parent = scrolling
			optionButton.BackgroundColor3 = Color3.new(0.215686, 0.215686, 0.215686)
			optionButton.BackgroundTransparency = 1
			optionButton.BorderSizePixel = 0
			optionButton.Position = UDim2.new(0, 0, 0, 0)
			optionButton.Size = UDim2.new(0, 153, 0, 25)
			optionButton.AutoButtonColor = false
			optionButton.Font = Enum.Font.SourceSansBold
			optionButton.Text = tostring(option)
			optionButton.TextColor3 = Color3.new(1, 1, 1)
			optionButton.TextSize = 14

			optionButton.MouseEnter:Connect(function()
				Tween(optionButton, {BackgroundTransparency = 0.5})
			end)

			optionButton.MouseLeave:Connect(function()
				Tween(optionButton, {BackgroundTransparency = 1})
			end)

			optionButton.MouseButton1Down:Connect(function()
				selected = index
				titleLabel.Text = tostring(option)
				open = false
				dropdownToggle.Text = ">"
				Tween(dropdownMain, {Size = UDim2.new(0, 0, 0, 0)})
				Tween(scrolling, {Size = UDim2.new(0, 153, 0, 0), ScrollBarImageTransparency = 1})
				if callback then
					callback(option, index)
				end
			end)
		end

		dropdownToggle.MouseButton1Down:Connect(function()
			if open then
				open = false
				dropdownToggle.Text = ">"
				Tween(dropdownMain, {Size = UDim2.new(0, 0, 0, 0)})
				Tween(scrolling, {Size = UDim2.new(0, 153, 0, 0), ScrollBarImageTransparency = 1})
			else
				open = true
				dropdownToggle.Text = "<"
				holder.Size = UDim2.new(0, 170, 0, 30 + visibleHeight)
				Tween(dropdownMain, {Size = UDim2.new(0, 153, 0, visibleHeight)})
				Tween(scrolling, {Size = UDim2.new(0, 153, 0, visibleHeight), ScrollBarImageTransparency = 0})
				sectionData.Height = math.max(0, layout.AbsoluteContentSize.Y - 30)
				UpdateSection()
			end
		end)

		AddHeight(30)

		return {
			Set = function(_, index, fire)
				index = tonumber(index) or 1
				if #options == 0 then
					return
				end
				selected = math.clamp(index, 1, #options)
				titleLabel.Text = tostring(options[selected])
				if fire and callback then
					callback(options[selected], selected)
				end
			end,
			Get = function()
				return options[selected], selected
			end
		}
		end

		return sectionData
	end

	return windowData
end

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.RightControl then
		Gui.Enabled = not Gui.Enabled
	end
end)

return WizardLibrary
