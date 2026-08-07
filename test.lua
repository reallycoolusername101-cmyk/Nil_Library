-- Wizard UI Library
-- Fully functional, draggable, supports multiple sections/tabs

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local WizardLib = {}

-- Utility: Enable Smooth Dragging
local function makeDraggable(topBar, mainFrame)
	local dragging, dragInput, dragStart, startPos
	
	topBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = mainFrame.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	topBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			mainFrame.Position = UDim2.new(
				startPos.X.Scale, 
				startPos.X.Offset + delta.X, 
				startPos.Y.Scale, 
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

-- Create Main Window
function WizardLib:CreateWindow()
	local ScreenGui = script.Parent
	
	-- Main Frame
	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "WizardMainFrame"
	MainFrame.Size = UDim2.new(0, 240, 0, 400)
	MainFrame.Position = UDim2.new(0.5, -120, 0.4, -200)
	MainFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	MainFrame.BorderSizePixel = 0
	MainFrame.Parent = ScreenGui
	
	local MainCorner = Instance.new("UICorner")
	MainCorner.CornerRadius = UDim.new(0, 4)
	MainCorner.Parent = MainFrame
	
	-- Top Header Bar (Draggable Area)
	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.Size = UDim2.new(1, 0, 0, 35)
	TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	TopBar.BorderSizePixel = 0
	TopBar.Parent = MainFrame
	
	local TopCorner = Instance.new("UICorner")
	TopCorner.CornerRadius = UDim.new(0, 4)
	TopCorner.Parent = TopBar
	
	-- Title
	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -10, 1, 0)
	Title.Position = UDim2.new(0, 10, 0, 0)
	Title.BackgroundTransparency = 1
	Title.Text = "Wizard Library"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.Font = Enum.Font.SourceSansBold
	Title.TextSize = 16
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = TopBar
	
	-- Container for elements
	local Container = Instance.new("ScrollingFrame")
	Container.Name = "Container"
	Container.Size = UDim2.new(1, -16, 1, -45)
	Container.Position = UDim2.new(0, 8, 0, 40)
	Container.BackgroundTransparency = 1
	Container.BorderSizePixel = 0
	Container.ScrollBarThickness = 3
	Container.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
	Container.CanvasSize = UDim2.new(0, 0, 0, 0)
	Container.Parent = MainFrame
	
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 6)
	UIListLayout.Parent = Container
	
	-- Dynamic resize canvas
	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Container.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
	end)
	
	makeDraggable(TopBar, MainFrame)
	
	local WindowObj = {}
	
	-- Create Section (Collapsible Category Header)
	function WindowObj:CreateSection(name)
		local SectionFrame = Instance.new("Frame")
		SectionFrame.Size = UDim2.new(1, 0, 0, 30)
		SectionFrame.BackgroundTransparency = 1
		SectionFrame.Parent = Container
		
		local SectionTitle = Instance.new("TextLabel")
		SectionTitle.Size = UDim2.new(1, -20, 1, 0)
		SectionTitle.BackgroundTransparency = 1
		SectionTitle.Text = name
		SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		SectionTitle.Font = Enum.Font.SourceSansBold
		SectionTitle.TextSize = 15
		SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
		SectionTitle.Parent = SectionFrame
		
		local Sign = Instance.new("TextLabel")
		Sign.Size = UDim2.new(0, 20, 1, 0)
		Sign.Position = UDim2.new(1, -20, 0, 0)
		Sign.BackgroundTransparency = 1
		Sign.Text = "-"
		Sign.TextColor3 = Color3.fromRGB(200, 200, 200)
		Sign.Font = Enum.Font.SourceSansBold
		Sign.TextSize = 14
		Sign.TextXAlignment = Enum.TextXAlignment.Right
		Sign.Parent = SectionFrame
		
		local SectionObj = {}
		
		-- Create Button
		function SectionObj:CreateButton(text, callback)
			local Button = Instance.new("TextButton")
			Button.Size = UDim2.new(1, 0, 0, 32)
			Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Button.Text = text
			Button.TextColor3 = Color3.fromRGB(200, 200, 200)
			Button.Font = Enum.Font.SourceSansBold
			Button.TextSize = 14
			Button.AutoButtonColor = true
			Button.Parent = Container
			
			local Corner = Instance.new("UICorner")
			Corner.CornerRadius = UDim.new(0, 4)
			Corner.Parent = Button
			
			Button.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end
		
		-- Create Text Box
		function SectionObj:CreateTextBox(placeholder, callback)
			local TextBox = Instance.new("TextBox")
			TextBox.Size = UDim2.new(1, 0, 0, 32)
			TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			TextBox.PlaceholderText = placeholder
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
			TextBox.Font = Enum.Font.SourceSansBold
			TextBox.TextSize = 14
			TextBox.ClearTextOnFocus = false
			TextBox.Parent = Container
			
			local Corner = Instance.new("UICorner")
			Corner.CornerRadius = UDim.new(0, 4)
			Corner.Parent = TextBox
			
			TextBox.FocusLost:Connect(function(enterPressed)
				pcall(callback, TextBox.Text, enterPressed)
			end)
		end
		
		-- Create Toggle (Auto Ez style circular toggle)
		function SectionObj:CreateToggle(text, default, callback)
			local toggled = default or false
			
			local ToggleFrame = Instance.new("Frame")
			ToggleFrame.Size = UDim2.new(1, 0, 0, 35)
			ToggleFrame.BackgroundTransparency = 1
			ToggleFrame.Parent = Container
			
			local ToggleLabel = Instance.new("TextLabel")
			ToggleLabel.Size = UDim2.new(1, -40, 1, 0)
			ToggleLabel.BackgroundTransparency = 1
			ToggleLabel.Text = text
			ToggleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
			ToggleLabel.Font = Enum.Font.SourceSansBold
			ToggleLabel.TextSize = 14
			ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
			ToggleLabel.Parent = ToggleFrame
			
			local Circle = Instance.new("TextButton")
			Circle.Size = UDim2.new(0, 22, 0, 22)
			Circle.Position = UDim2.new(1, -22, 0.5, -11)
			Circle.BackgroundColor3 = toggled and Color3.fromRGB(70, 70, 70) or Color3.fromRGB(45, 45, 45)
			Circle.Text = ""
			Circle.Parent = ToggleFrame
			
			local CircleCorner = Instance.new("UICorner")
			CircleCorner.CornerRadius = UDim.new(1, 0) -- Makes it a pure circle
			CircleCorner.Parent = Circle
			
			local function updateToggle()
				local targetColor = toggled and Color3.fromRGB(90, 90, 90) or Color3.fromRGB(45, 45, 45)
				TweenService:Create(Circle, TweenInfo.new(0.15), {BackgroundColor3 = targetColor}):Play()
				pcall(callback, toggled)
			end
			
			Circle.MouseButton1Click:Connect(function()
				toggled = not toggled
				updateToggle()
			end)
			
			updateToggle()
		end
		
		-- Create Selector Dropdown / Selection Bar
		function SectionObj:CreateSelector(text, currentOpt, callback)
			local SelectorButton = Instance.new("TextButton")
			SelectorButton.Size = UDim2.new(1, 0, 0, 32)
			SelectorButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			SelectorButton.Text = text .. "             >"
			SelectorButton.TextColor3 = Color3.fromRGB(220, 220, 220)
			SelectorButton.Font = Enum.Font.SourceSansBold
			SelectorButton.TextSize = 14
			SelectorButton.Parent = Container
			
			local Corner = Instance.new("UICorner")
			Corner.CornerRadius = UDim.new(0, 4)
			Corner.Parent = SelectorButton
			
			SelectorButton.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end
		
		-- Create Slider
		function SectionObj:CreateSlider(text, min, max, default, callback)
			local SliderFrame = Instance.new("Frame")
			SliderFrame.Size = UDim2.new(1, 0, 0, 45)
			SliderFrame.BackgroundTransparency = 1
			SliderFrame.Parent = Container
			
			local SliderLabel = Instance.new("TextLabel")
			SliderLabel.Size = UDim2.new(0.7, 0, 0, 20)
			SliderLabel.BackgroundTransparency = 1
			SliderLabel.Text = text
			SliderLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
			SliderLabel.Font = Enum.Font.SourceSansBold
			SliderLabel.TextSize = 14
			SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
			SliderLabel.Parent = SliderFrame
			
			local ValueBox = Instance.new("TextLabel")
			ValueBox.Size = UDim2.new(0.3, 0, 0, 20)
			ValueBox.Position = UDim2.new(0.7, 0, 0, 0)
			ValueBox.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			ValueBox.Text = tostring(default or min)
			ValueBox.TextColor3 = Color3.fromRGB(200, 200, 200)
			ValueBox.Font = Enum.Font.SourceSans
			ValueBox.TextSize = 13
			ValueBox.Parent = SliderFrame
			
			local VBCorner = Instance.new("UICorner")
			VBCorner.CornerRadius = UDim.new(0, 3)
			VBCorner.Parent = ValueBox
			
			local SliderTrack = Instance.new("Frame")
			SliderTrack.Size = UDim2.new(1, 0, 0, 4)
			SliderTrack.Position = UDim2.new(0, 0, 0, 30)
			SliderTrack.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			SliderTrack.BorderSizePixel = 0
			SliderTrack.Parent = SliderFrame
			
			local SliderFill = Instance.new("Frame")
			SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
			SliderFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderFill.BorderSizePixel = 0
			SliderFill.Parent = SliderTrack
			
			-- Dragging logic
			local function updateSlider(input)
 				local percentage = math.clamp(
					(input.Position.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X,
					0,
					1
				)
				local value = math.floor(min + (max - min) * percentage)
				ValueBox.Text = tostring(value)
				SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
				pcall(callback, value)
			end

			local sliding = false
			SliderTrack.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					sliding = true
					updateSlider(input)
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if sliding and (
					input.UserInputType == Enum.UserInputType.MouseMovement
					or input.UserInputType == Enum.UserInputType.Touch
				) then
					updateSlider(input)
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					sliding = false
				end
			end)

		end

		-- Create Color Picker / Block Box
		function SectionObj:CreatePicker(text, defaultColor, callback)
			local PickerFrame = Instance.new("Frame")
			PickerFrame.Size = UDim2.new(1, 0, 0, 35)
			PickerFrame.BackgroundTransparency = 1
			PickerFrame.Parent = Container

			local PickerLabel = Instance.new("TextLabel")
			PickerLabel.Size = UDim2.new(1, -30, 1, 0)
			PickerLabel.BackgroundTransparency = 1
			PickerLabel.Text = text
			PickerLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
			PickerLabel.Font = Enum.Font.SourceSansBold
			PickerLabel.TextSize = 14
			PickerLabel.TextXAlignment = Enum.TextXAlignment.Left
			PickerLabel.Parent = PickerFrame

			local ColorBox = Instance.new("TextButton")
			ColorBox.Size = UDim2.new(0, 22, 0, 22)
			ColorBox.Position = UDim2.new(1, -22, 0.5, -11)
			ColorBox.BackgroundColor3 = defaultColor or Color3.fromRGB(255, 255, 255)
			ColorBox.Text = ""
			ColorBox.Parent = PickerFrame

			local CBCorner = Instance.new("UICorner")
			CBCorner.CornerRadius = UDim.new(0, 4)
			CBCorner.Parent = ColorBox

			ColorBox.MouseButton1Click:Connect(function()
				local colors = {
					Color3.fromRGB(255, 255, 255),
					Color3.fromRGB(255, 0, 0),
					Color3.fromRGB(0, 255, 0),
					Color3.fromRGB(0, 0, 255),
				}
				local nextColor = colors[math.random(1, #colors)]
				ColorBox.BackgroundColor3 = nextColor
				pcall(callback, nextColor)
			end)
		end

		return SectionObj
	end
	return WindowObj
end
