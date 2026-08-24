-- [[ ts is generated @ dsc.gg/6vms ]]

local v1 = game:GetService("UserInputService")
local v2 = game:GetService("TweenService")
local v3 = game:GetService("RunService")
local v4 = game:GetService("Players")
v4 = v4.LocalPlayer:GetMouse()
local v5 = game:GetService("CoreGui")
v5 = v5:FindFirstChild("WizardLibrary")

if v5 then
else
	v5 = game:GetService("CoreGui")
	v5 = v5:FindFirstChild("WizardLibrary")
	v5:Destroy()
end

v5 = Instance.new("ScreenGui")
local v6 = Instance.new("Frame")
v5.Name = "WizardLibrary"
local v7 = game:GetService("CoreGui")
v5.Parent = v7
v6.Name = "Container"
v6.Parent = v5
v7 = Color3.new(1, 1, 1)
v6.BackgroundColor3 = v7
v6.BackgroundTransparency = 1
v7 = UDim2.new(0, 100, 0, 100)
v6.Size = v7
v1.InputBegan:Connect(function(a)
	if a.KeyCode == Enum.KeyCode.RightControl then
		CoastifiedLibrary.Enabled = not CoastifiedLibrary.Enabled
	end
end)

function Dragging(a)
	local function v8(a)
		local v9 = UDim2.new(_u2.X.Scale, _u2.X.Offset + ((a.Position - _u0).X), _u2.Y.Scale, _u2.Y.Offset + ((a.Position - _u0).Y))
		_u1.Position = v9
	end

	a.InputBegan:Connect(function(a)
		if a.UserInputType == Enum.UserInputType.MouseButton1 then
		else

			if a.UserInputType ~= Enum.UserInputType.Touch then
			end

		else
			_u0 = true
			_u1 = a.Position
			_u2 = _u3.Position
			a.Changed:Connect(function()
				if _u0.UserInputState == Enum.UserInputState.End then
					_u1 = false
				end
			end)
		end
	end)
	a.InputChanged:Connect(function(a)
		if a.UserInputType == Enum.UserInputType.MouseMovement then
		else

			if a.UserInputType == Enum.UserInputType.Touch then
			end

			_u0 = a
		end
	end)
	_u0.InputChanged:Connect(function(a)
		if a == _u0 then

			if _u1 then
			else
				_u2(a)
			end

		end
	end)
end

local function v7(a)
	return a:gsub(a, " ", "")
	do return a:gsub end
end

local v11 = coroutine.wrap(function()
	while true do
		local v10 = wait()

		if not v10 then
			_u0 = _u0 + 0.0039215686274509803

			if 1 > _u0 then
			end

		end

		_u0 = 0
	end

end
end)
v11()
do return {
	NewWindow = function(a, b)
	local v12 = Instance.new("ImageLabel")
	local v13 = Instance.new("Frame")
	local v14 = Instance.new("TextButton")
	local v15 = Instance.new("TextLabel")
	local v16 = Instance.new("Frame")
	local v17 = Instance.new("ImageLabel")
	local v18 = Instance.new("UIListLayout")
	local v19 = Instance.new("Frame")
	local v20 = _u0(b)
	_u1 = _u1 + 2

	local function v21(a)
		_u0 = _u0 + a
		local v22 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		local v23 = UDim2.new(0, 170, 0, _u0)
		local v24 = _u1:Create(_u1, _u2, v22, { Size = v23 })
		v24:Play()
	end

	v12.Name = v20 .. "Window"
	v12.Parent = _u3
	local v28 = Color3.new(0.0980392, 0.0980392, 0.0980392)
	v12.BackgroundColor3 = v28
	v12.BackgroundTransparency = 1
	v28 = UDim2.new(_u1, -100, 3, -265)
	v12.Position = v28
	v28 = UDim2.new(0, 170, 0, 30)
	v12.Size = v28
	v12.ZIndex = 2
	v12.Image = "rbxassetid://3570695787"
	v28 = Color3.new(0.0980392, 0.0980392, 0.0980392)
	v12.ImageColor3 = v28
	v12.ScaleType = Enum.ScaleType.Slice
	v28 = Rect.new(100, 100, 100, 100)
	v12.SliceCenter = v28
	v12.SliceScale = 0.05
	v13.Name = "Topbar"
	v13.Parent = v12
	v28 = Color3.new(1, 1, 1)
	v13.BackgroundColor3 = v28
	v13.BackgroundTransparency = 1
	v13.BorderSizePixel = 0
	v28 = UDim2.new(0, 170, 0, 30)
	v13.Size = v28
	v13.ZIndex = 2
	v14.Name = "WindowToggle"
	v14.Parent = v13
	v28 = Color3.new(1, 1, 1)
	v14.BackgroundColor3 = v28
	v14.BackgroundTransparency = 1
	v28 = UDim2.new(0.822450161, 0, 0, 0)
	v14.Position = v28
	v28 = UDim2.new(0, 30, 0, 30)
	v14.Size = v28
	v14.ZIndex = 2
	v14.Font = Enum.Font.SourceSansSemibold
	v14.Text = "-"
	v28 = Color3.new(1, 1, 1)
	v14.TextColor3 = v28
	v14.TextSize = 20
	v14.TextWrapped = true
	v14.MouseButton1Down:Connect(function()
		if not _u0 then
		else
			_u0 = true
			local v29 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			local v30 = _u1:Create(_u1, _u2, v29, { TextTransparency = 1 })
			v30:Play()
			_u2.Text = "-"
			_u2.TextSize = 20
			_u2.Visible = false

			while true do
				wait()

				if _u2.TextTransparency ~= 1 then
				end

			end

			_u2.Visible = true
			v29 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			v30 = _u1:Create(_u1, _u2, v29, { TextTransparency = 0 })
			v30:Play()
		end

		if _u0 then
		else
			_u0 = false
			v29 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			v30 = _u1:Create(_u1, _u2, v29, { TextTransparency = 1 })
			v30:Play()
			_u2.Text = "v"
			_u2.TextSize = 14
			_u2.Visible = false

			while true do
				wait()

				if _u2.TextTransparency == 1 then
				end

				_u2.Visible = true
				v29 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v30 = _u1:Create(_u1, _u2, v29, { TextTransparency = 0 })
				v30:Play()
			end
	end)
	v15.Name = "WindowTitle"
	v15.Parent = v13
	v28 = Color3.new(1, 1, 1)
	v15.BackgroundColor3 = v28
	v15.BackgroundTransparency = 1
	v28 = UDim2.new(0, 170, 0, 30)
	v15.Size = v28
	v15.ZIndex = 2
	v15.Font = Enum.Font.SourceSansBold
	v15.Text = b
	v28 = Color3.new(1, 1, 1)
	v15.TextColor3 = v28
	v15.TextSize = 17
	v16.Name = "BottomRoundCover"
	v16.Parent = v13
	v28 = Color3.new(0.0980392, 0.0980392, 0.0980392)
	v16.BackgroundColor3 = v28
	v16.BorderSizePixel = 0
	v28 = UDim2.new(0, 0, 0.833333313, 0)
	v16.Position = v28
	v28 = UDim2.new(0, 170, 0, 5)
	v16.Size = v28
	v16.ZIndex = 2
	v17.Name = "Body"
	v17.Parent = v12
	v28 = Color3.new(0.137255, 0.137255, 0.137255)
	v17.BackgroundColor3 = v28
	v17.BackgroundTransparency = 1
	v17.ClipsDescendants = true
	v28 = UDim2.new(0, 170, 0, 35)
	v17.Size = v28
	v17.Image = "rbxassetid://3570695787"
	v28 = Color3.new(0.137255, 0.137255, 0.137255)
	v17.ImageColor3 = v28
	v17.ScaleType = Enum.ScaleType.Slice
	v28 = Rect.new(100, 100, 100, 100)
	v17.SliceCenter = v28
	v17.SliceScale = 0.05
	v18.Name = "Sorter"
	v18.Parent = v17
	v18.SortOrder = Enum.SortOrder.LayoutOrder
	v19.Name = "TopbarBodyCover"
	v19.Parent = v17
	v28 = Color3.new(1, 1, 1)
	v19.BackgroundColor3 = v28
	v19.BackgroundTransparency = 1
	v19.BorderSizePixel = 0
	v28 = UDim2.new(0, 170, 0, 30)
	v19.Size = v28
	Dragging(v12)
	do return {
		NewSection = function(a, b)
		local v31 = Instance.new("Frame")
		local v32 = Instance.new("Frame")
		local v33 = Instance.new("TextButton")
		local v34 = Instance.new("TextLabel")
		local v35 = Instance.new("UIListLayout")
		local v36 = _u0(b)

		local function v37(a)
			_u0 = _u0 + a
			local v38 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			local v39 = UDim2.new(0, 170, 0, _u0)
			local v40 = _u1:Create(_u1, _u2, v38, { Size = v39 })
			v40:Play()
		end

		v31.Name = v36 .. "Section"
		v31.Parent = _u2
		local v44 = Color3.new(0.176471, 0.176471, 0.176471)
		v31.BackgroundColor3 = v44
		v31.BorderSizePixel = 0
		v31.ClipsDescendants = true
		v44 = UDim2.new(0, 170, 0, 30)
		v31.Size = v44
		_u3(30)
		v32.Name = "SectionInfo"
		v32.Parent = v31
		v44 = Color3.new(1, 1, 1)
		v32.BackgroundColor3 = v44
		v32.BackgroundTransparency = 1
		v44 = UDim2.new(0, 170, 0, 30)
		v32.Size = v44
		v33.Name = "SectionToggle"
		v33.Parent = v32
		v44 = Color3.new(1, 1, 1)
		v33.BackgroundColor3 = v44
		v33.BackgroundTransparency = 1
		v44 = UDim2.new(0.822450161, 0, 0, 0)
		v33.Position = v44
		v44 = UDim2.new(0, 30, 0, 30)
		v33.Size = v44
		v33.ZIndex = 2
		v33.Font = Enum.Font.SourceSansSemibold
		v33.Text = "v"
		v44 = Color3.new(1, 1, 1)
		v33.TextColor3 = v44
		v33.TextSize = 14
		v33.TextWrapped = true
		v34.Name = "SectionTitle"
		v34.Parent = v32
		v44 = Color3.new(1, 1, 1)
		v34.BackgroundColor3 = v44
		v34.BackgroundTransparency = 1
		v34.BorderSizePixel = 0
		v44 = UDim2.new(0.052941177, 0, 0, 0)
		v34.Position = v44
		v44 = UDim2.new(0, 125, 0, 30)
		v34.Size = v44
		v34.Font = Enum.Font.SourceSansBold
		v34.Text = b
		v44 = Color3.new(1, 1, 1)
		v34.TextColor3 = v44
		v34.TextSize = 17
		v34.TextXAlignment = Enum.TextXAlignment.Left
		v35.Name = "Layout"
		v35.Parent = v31
		v35.SortOrder = Enum.SortOrder.LayoutOrder
		_u4.MouseButton1Down:Connect(function()
			if not _u0 then
			else
				_u1(30)
				_u2.Text = _u3
				local v45 = _u4:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				local v46 = _u4:Create(_u4, _u5, v45, { BackgroundTransparency = 0 })
				v46:Play()
			end

			if not _u0 then
				_u6(30)
				_u2.Text = ""
				v45 = _u4:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v46 = _u4:Create(_u4, _u5, v45, { BackgroundTransparency = 1 })
				v46:Play()
			end
		end)
		v33.MouseButton1Down:Connect(function()
			if not _u0 then
			else
				_u0 = true
				_u1 = "-"
				local v47 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				local v48 = _u2:Create(_u2, _u3, v47, { TextTransparency = 1 })
				v48:Play()
				v47 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v48 = _u2:Create(_u2, _u4, v47, { TextTransparency = 1 })
				v48:Play()
				_u3.Text = _u1
				_u3.TextSize = 20
				_u3.Visible = false
				_u4.Visible = false

				while true do
					wait()

					if _u3.TextTransparency == 1 then
					end

					if _u4.TextTransparency == 1 then
					end

					_u3.Visible = true
					_u4.Visible = true
					v47 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v48 = _u2:Create(_u2, _u3, v47, { TextTransparency = 0 })
					v48:Play()
					v47 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v48 = _u2:Create(_u2, _u4, v47, { TextTransparency = 0 })
					v48:Play()
				end

				if not _u0 then
					_u0 = false
					_u1 = "v"
					v47 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v48 = _u2:Create(_u2, _u3, v47, { TextTransparency = 1 })
					v48:Play()
					v47 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v48 = _u2:Create(_u2, _u4, v47, { TextTransparency = 1 })
					v48:Play()
					_u3.Text = _u1
					_u3.TextSize = 14
					_u3.Visible = false
					_u4.Visible = false

					while true do
						wait()

						if _u3.TextTransparency == 1 then
						end

						if _u4.TextTransparency == 1 then
						end

						_u3.Visible = true
						_u4.Visible = true
						v47 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v48 = _u2:Create(_u2, _u3, v47, { TextTransparency = 0 })
						v48:Play()
						v47 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v48 = _u2:Create(_u2, _u4, v47, { TextTransparency = 0 })
						v48:Play()
					end
		end)
		do return {
			CreateToggle = function(a, b, c)
			local v49 = Instance.new("Frame")
			local v50 = Instance.new("TextLabel")
			local v51 = Instance.new("ImageLabel")
			local v52 = Instance.new("ImageButton")
			local v53 = _u0(b)
			v49.Name = v53 .. "ToggleHolder"
			v49.Parent = _u1
			local v54 = Color3.new(0.137255, 0.137255, 0.137255)
			v49.BackgroundColor3 = v54
			v49.BorderSizePixel = 0
			v54 = UDim2.new(0, 170, 0, 30)
			v49.Size = v54
			v50.Name = "ToggleTitle"
			v50.Parent = v49
			v54 = Color3.new(1, 1, 1)
			v50.BackgroundColor3 = v54
			v50.BackgroundTransparency = 1
			v50.BorderSizePixel = 0
			v54 = UDim2.new(0.052941177, 0, 0, 0)
			v50.Position = v54
			v54 = UDim2.new(0, 125, 0, 30)
			v50.Size = v54
			v50.Font = Enum.Font.SourceSansBold
			v50.Text = b
			v54 = Color3.new(1, 1, 1)
			v50.TextColor3 = v54
			v50.TextSize = 17
			v50.TextXAlignment = Enum.TextXAlignment.Left
			v51.Name = "ToggleBackground"
			v51.Parent = v49
			v54 = Color3.new(1, 1, 1)
			v51.BackgroundColor3 = v54
			v51.BackgroundTransparency = 1
			v51.BorderSizePixel = 0
			v54 = UDim2.new(0.847058833, 0, 0.166666672, 0)
			v51.Position = v54
			v54 = UDim2.new(0, 20, 0, 20)
			v51.Size = v54
			v51.Image = "rbxassetid://3570695787"
			v54 = Color3.new(0.254902, 0.254902, 0.254902)
			v51.ImageColor3 = v54
			v52.Name = "ToggleButton"
			v52.Parent = v51
			v54 = Color3.new(1, 1, 1)
			v52.BackgroundColor3 = v54
			v52.BackgroundTransparency = 1
			v54 = UDim2.new(0, 2, 0, 2)
			v52.Position = v54
			v54 = UDim2.new(0, 16, 0, 16)
			v52.Size = v54
			v52.Image = "rbxassetid://3570695787"
			v54 = Color3.new(1, 0.341176, 0.341176)
			v52.ImageColor3 = v54
			v52.ImageTransparency = 1
			v52.MouseButton1Down:Connect(function()
				_u0 = not _u0

				if not _u0 then
					local v55 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					local v56 = _u1:Create(_u1, _u2, v55, { ImageTransparency = 0 })
					v56:Play()
				else

					if _u0 then
						v55 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v56 = _u1:Create(_u1, _u2, v55, { ImageTransparency = 1 })
						v56:Play()
					end

				end

				_u3(_u0)
			end)
			_u3.MouseButton1Down:Connect(function()
				if _u0 then
					_u1(30)
					_u2(30)
				else

					if not _u0 then
						_u3(30)
						_u4(30)
					end

				end
			end)
			_u9.MouseButton1Down:Connect(function()
				if _u0 then

					if not _u1 then
						_u2(30)
						local v57 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v58 = _u3:Create(_u3, _u4, v57, { Rotation = 360 })
						v58:Play()
						v57 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v58 = _u3:Create(_u3, _u5, v57, { BackgroundTransparency = 0 })
						v58:Play()
					else

						if _u1 then
							v57 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v58 = _u3:Create(_u3, _u5, v57, { BackgroundTransparency = 0 })
							v58:Play()
						else

							if _u0 then
							else

								if not _u1 then
									_u6(30)
									v57 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
									v58 = _u3:Create(_u3, _u4, v57, { Rotation = 0 })
									v58:Play()
									v57 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
									v58 = _u3:Create(_u3, _u5, v57, { BackgroundTransparency = 1 })
									v58:Play()
								else

									if not _u1 then
									else
										v57 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
										v58 = _u3:Create(_u3, _u5, v57, { BackgroundTransparency = 1 })
										v58:Play()
									end

								end

							end

						end

					end

				end

				v57 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v58 = _u3:Create(_u3, _u4, v57, { TextTransparency = 1 })
				v58:Play()
				_u4.Visible = false

				while true do
					wait()

					if _u4.TextTransparency == 1 then
					end

					_u4.Visible = true
					v57 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v58 = _u3:Create(_u3, _u4, v57, { TextTransparency = 0 })
					v58:Play()
			end)
		end,
			CreateSlider = function(a, b, c, d, e, f, g)
			local v59 = Instance.new("Frame")
			local v60 = Instance.new("TextLabel")
			local v61 = Instance.new("ImageLabel")
			local v62 = Instance.new("TextLabel")
			local v63 = Instance.new("ImageLabel")
			local v64 = Instance.new("ImageLabel")
			local v65 = _u0(b)
			v59.Name = v65 .. "SliderHolder"
			v59.Parent = _u1
			local v66 = Color3.new(0.137255, 0.137255, 0.137255)
			v59.BackgroundColor3 = v66
			v59.BorderSizePixel = 0
			v66 = UDim2.new(0, 170, 0, 30)
			v59.Size = v66
			v60.Name = "SliderTitle"
			v60.Parent = v59
			v66 = Color3.new(1, 1, 1)
			v60.BackgroundColor3 = v66
			v60.BackgroundTransparency = 1
			v60.BorderSizePixel = 0
			v66 = UDim2.new(0.052941177, 0, 0, 0)
			v60.Position = v66
			v66 = UDim2.new(0, 125, 0, 15)
			v60.Size = v66
			v60.Font = Enum.Font.SourceSansSemibold
			v60.Text = b
			v66 = Color3.new(1, 1, 1)
			v60.TextColor3 = v66
			v60.TextSize = 17
			v60.TextXAlignment = Enum.TextXAlignment.Left
			v61.Name = "SliderValueHolder"
			v61.Parent = v59
			v66 = Color3.new(0.254902, 0.254902, 0.254902)
			v61.BackgroundColor3 = v66
			v61.BackgroundTransparency = 1
			v66 = UDim2.new(0.747058809, 0, 0, 0)
			v61.Position = v66
			v66 = UDim2.new(0, 35, 0, 15)
			v61.Size = v66
			v61.Image = "rbxassetid://3570695787"
			v66 = Color3.new(0.254902, 0.254902, 0.254902)
			v61.ImageColor3 = v66
			v61.ImageTransparency = 0.5
			v61.ScaleType = Enum.ScaleType.Slice
			v66 = Rect.new(100, 100, 100, 100)
			v61.SliceCenter = v66
			v61.SliceScale = 0.02
			v62.Name = "SliderValue"
			v62.Parent = v61
			v66 = Color3.new(1, 1, 1)
			v62.BackgroundColor3 = v66
			v62.BackgroundTransparency = 1
			v66 = UDim2.new(0, 35, 0, 15)
			v62.Size = v66
			v62.Font = Enum.Font.SourceSansSemibold

			if e then

				if not f then
					local v68 = tonumber(string.format("%.2f", e))
				end

			end

			v66 = tostring(v68)
			v62.Text = v66
			v66 = Color3.new(1, 1, 1)
			v62.TextColor3 = v66
			v62.TextSize = 14
			v63.Name = "SliderBackground"
			v63.Parent = v59
			v66 = Color3.new(0.254902, 0.254902, 0.254902)
			v63.BackgroundColor3 = v66
			v63.BackgroundTransparency = 1
			v66 = UDim2.new(0.0529999994, 0, 0.649999976, 0)
			v63.Position = v66
			v63.Selectable = true
			v66 = UDim2.new(0, 153, 0, 5)
			v63.Size = v66
			v63.Image = "rbxassetid://3570695787"
			v66 = Color3.new(0.254902, 0.254902, 0.254902)
			v63.ImageColor3 = v66
			v63.ImageTransparency = 0.5
			v63.ScaleType = Enum.ScaleType.Slice
			v66 = Rect.new(100, 100, 100, 100)
			v63.SliceCenter = v66
			v63.ClipsDescendants = true
			v63.SliceScale = 0.02
			v64.Name = "Slider"
			v64.Parent = v63
			v66 = Color3.new(1, 1, 1)
			v64.BackgroundColor3 = v66
			v64.BackgroundTransparency = 1

			if e then
			end

			v66 = UDim2.new((c - c) / (d - c), 0, 0, 5)
			v64.Size = v66
			v64.Image = "rbxassetid://3570695787"
			v64.ScaleType = Enum.ScaleType.Slice
			v66 = Rect.new(100, 100, 100, 100)
			v64.SliceCenter = v66
			v64.SliceScale = 0.02

			local function v66(a)
				local v69 = math.clamp((a.Position.X - _u0.AbsolutePosition.X) / _u0.AbsoluteSize.X, 0, 1)
				local v70 = UDim2.new(v69, 0, 1.15, 0)
				local v71 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v69 = _u1:Create(_u1, _u2, v71, { Size = v70 })
				v69:Play()
				v69 = math.floor(v70.X.Scale * _u3 / _u3 * (_u3 - _u4) + _u4)

				if _u5 then
				else

					if v70.X.Scale * _u3 / _u3 * (_u3 - _u4) + _u4 then
					end

				end

				v71 = tonumber(string.format("%.2f", v69))
				local v72 = tostring(v71)
				_u6.Text = v72
				_u7(v71)
			end

			v63.InputBegan:Connect(function(a)
				if a.UserInputType == Enum.UserInputType.MouseButton1 then
					_u0 = true
				end
			end)
			v63.InputEnded:Connect(function(a)
				if a.UserInputType == Enum.UserInputType.MouseButton1 then
					_u0 = false
				end
			end)
			v63.InputBegan:Connect(function(a)
				if a.UserInputType == Enum.UserInputType.MouseButton1 then
					_u0(a)
				end
			end)
			_u3.InputChanged:Connect(function(a)
				if not _u0 then

					if a.UserInputType == Enum.UserInputType.MouseMovement then
						_u1(a)
					end

				end
			end)
			_u4.MouseButton1Down:Connect(function()
				if not _u0 then
				else
					_u1(30)
					_u2(30)
				end

				if _u0 then
				else
					_u3(30)
					_u4(30)
				end
			end)
			_u10.MouseButton1Down:Connect(function()
				if not _u0 then
				else

					if _u1 then
					else
						_u2(30)
						local v73 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v74 = _u3:Create(_u3, _u4, v73, { Rotation = 360 })
						v74:Play()
						v73 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v74 = _u3:Create(_u3, _u5, v73, { BackgroundTransparency = 0 })
						v74:Play()
					end

					if not _u1 then
					else
						v73 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v74 = _u3:Create(_u3, _u5, v73, { BackgroundTransparency = 0 })
						v74:Play()
					end

					if _u0 then
					else

						if not _u1 then
							_u6(30)
							v73 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v74 = _u3:Create(_u3, _u4, v73, { Rotation = 0 })
							v74:Play()
							v73 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v74 = _u3:Create(_u3, _u5, v73, { BackgroundTransparency = 1 })
							v74:Play()
						else

							if _u1 then
								v73 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
								v74 = _u3:Create(_u3, _u5, v73, { BackgroundTransparency = 1 })
								v74:Play()
							end

						end

					end

				end

				v73 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v74 = _u3:Create(_u3, _u4, v73, { TextTransparency = 1 })
				v74:Play()
				_u4.Visible = false

				while true do
					wait()

					if _u4.TextTransparency == 1 then
					end

					_u4.Visible = true
					v73 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v74 = _u3:Create(_u3, _u4, v73, { TextTransparency = 0 })
					v74:Play()
			end)
		end,
			CreateColorPicker = function(a, b, c, d)
			local v75 = Instance.new("Frame")
			local v76 = Instance.new("Frame")
			local v77 = Instance.new("TextLabel")
			local v78 = Instance.new("ImageLabel")
			local v79 = Instance.new("ImageButton")
			local v80 = Instance.new("TextLabel")
			local v81 = Instance.new("ImageButton")
			local v82 = Instance.new("ImageLabel")
			local v83 = Instance.new("TextLabel")
			local v84 = Instance.new("ImageLabel")
			local v85 = Instance.new("TextLabel")
			local v86 = Instance.new("ImageLabel")
			local v87 = Instance.new("TextLabel")
			local v88 = Instance.new("ImageLabel")
			local v89 = Instance.new("ImageLabel")
			local v90 = Instance.new("ImageLabel")
			local v91 = Instance.new("Frame")
			local v92 = Instance.new("ImageLabel")
			local v93 = Instance.new("ImageLabel")
			local v94 = Instance.new("ImageLabel")
			local v95 = _u0(b)
			_u1 = _u1 + 1
			v75.Name = v95 .. "ColorPickerHolder"
			v75.Parent = _u2
			local v96 = Color3.new(0.137255, 0.137255, 0.137255)
			v75.BackgroundColor3 = v96
			v75.BorderSizePixel = 0
			v96 = UDim2.new(0, 170, 0, 30)
			v75.Size = v96
			v80.Name = "ColorPickerTitle"
			v80.Parent = v75
			v96 = Color3.new(1, 1, 1)
			v80.BackgroundColor3 = v96
			v80.BackgroundTransparency = 1
			v80.BorderSizePixel = 0
			v96 = UDim2.new(0.052941177, 0, 0, 0)
			v80.Position = v96
			v96 = UDim2.new(0, 125, 0, 30)
			v80.Size = v96
			v80.Font = Enum.Font.SourceSansBold
			v80.Text = b
			v96 = Color3.new(1, 1, 1)
			v80.TextColor3 = v96
			v80.TextSize = 17
			v80.TextXAlignment = Enum.TextXAlignment.Left
			v81.Name = "ColorPickerToggle"
			v81.Parent = v75
			v96 = Color3.new(1, 1, 1)
			v81.BackgroundColor3 = v96
			v81.BackgroundTransparency = 1
			v96 = UDim2.new(0.822000027, 0, 0.166999996, 0)
			v81.Position = v96
			v96 = UDim2.new(0, 22, 0, 20)
			v81.Size = v96
			v81.Image = "rbxassetid://3570695787"
			v81.ImageColor3 = c
			v81.ScaleType = Enum.ScaleType.Slice
			v96 = Rect.new(100, 100, 100, 100)
			v81.SliceCenter = v96
			v81.SliceScale = 0.04
			v82.Name = "ColorPickerMain"
			v82.Parent = v75
			v96 = Color3.new(0.137255, 0.137255, 0.137255)
			v82.BackgroundColor3 = v96
			v82.BackgroundTransparency = 1
			v82.ClipsDescendants = true
			v82.BorderSizePixel = 0
			v96 = UDim2.new(1.04705882, 0, -1.36666667, 0)
			v82.Position = v96
			v96 = UDim2.new(0, 0, 0, 175)
			v82.Size = v96
			v82.Image = "rbxassetid://3570695787"
			v96 = Color3.new(0.137255, 0.137255, 0.137255)
			v82.ImageColor3 = v96
			v82.ScaleType = Enum.ScaleType.Slice
			v96 = Rect.new(100, 100, 100, 100)
			v82.SliceCenter = v96
			v82.SliceScale = 0.05
			v82.ZIndex = 1 + _u1
			v76.Name = "RainbowToggleHolder"
			v76.Parent = v82
			v96 = Color3.new(0.137255, 0.137255, 0.137255)
			v76.BackgroundColor3 = v96
			v76.BackgroundTransparency = 1
			v76.BorderSizePixel = 0
			v96 = UDim2.new(0, 0, 0.819999993, 0)
			v76.Position = v96
			v96 = UDim2.new(0, 170, 0, 30)
			v76.Size = v96
			v76.ZIndex = 1 + _u1
			v77.Name = "RainbowTitle"
			v77.Parent = v76
			v96 = Color3.new(1, 1, 1)
			v77.BackgroundColor3 = v96
			v77.BackgroundTransparency = 1
			v77.BorderSizePixel = 0
			v96 = UDim2.new(0.052941177, 0, 0, 0)
			v77.Position = v96
			v96 = UDim2.new(0, 125, 0, 30)
			v77.Size = v96
			v77.Font = Enum.Font.SourceSansBold
			v77.Text = "Rainbow"
			v96 = Color3.new(1, 1, 1)
			v77.TextColor3 = v96
			v77.TextSize = 17
			v77.TextXAlignment = Enum.TextXAlignment.Left
			v77.ZIndex = 1 + _u1
			v78.Name = "RainbowBackground"
			v78.Parent = v76
			v96 = Color3.new(1, 1, 1)
			v78.BackgroundColor3 = v96
			v78.BackgroundTransparency = 1
			v78.BorderSizePixel = 0
			v96 = UDim2.new(0.847058833, 0, 0.166666672, 0)
			v78.Position = v96
			v96 = UDim2.new(0, 20, 0, 20)
			v78.Size = v96
			v78.Image = "rbxassetid://3570695787"
			v96 = Color3.new(0.254902, 0.254902, 0.254902)
			v78.ImageColor3 = v96
			v78.ZIndex = 1 + _u1
			v79.Name = "RainbowToggleButton"
			v79.Parent = v78
			v96 = Color3.new(1, 1, 1)
			v79.BackgroundColor3 = v96
			v79.BackgroundTransparency = 1
			v96 = UDim2.new(0, 2, 0, 2)
			v79.Position = v96
			v96 = UDim2.new(0, 16, 0, 16)
			v79.Size = v96
			v79.Image = "rbxassetid://3570695787"
			v96 = Color3.new(1, 0.341176, 0.341176)
			v79.ImageColor3 = v96
			v79.ImageTransparency = 1
			v79.ZIndex = 1 + _u1
			v83.Name = "ColorValueR"
			v83.Parent = v82
			v96 = Color3.new(0.254902, 0.254902, 0.254902)
			v83.BackgroundColor3 = v96
			v83.BackgroundTransparency = 1
			v83.BorderSizePixel = 0
			v83.ClipsDescendants = true
			v96 = UDim2.new(0, 7, 0, 127)
			v83.Position = v96
			v96 = UDim2.new(0, 50, 0, 16)
			v83.Size = v96
			v83.ZIndex = 2 + _u1
			v83.Font = Enum.Font.SourceSansBold
			v83.Text = "R: 000"
			v96 = Color3.new(1, 1, 1)
			v83.TextColor3 = v96
			v83.TextSize = 14
			v84.Name = "ColorValueRRound"
			v84.Parent = v83
			v84.Active = true
			v96 = Vector2.new(0.5, 0.5)
			v84.AnchorPoint = v96
			v96 = Color3.new(1, 1, 1)
			v84.BackgroundColor3 = v96
			v84.BackgroundTransparency = 1
			v96 = UDim2.new(0.5, 0, 0.5, 0)
			v84.Position = v96
			v84.Selectable = true
			v96 = UDim2.new(1, 0, 1, 0)
			v84.Size = v96
			v84.Image = "rbxassetid://3570695787"
			v96 = Color3.new(0.254902, 0.254902, 0.254902)
			v84.ImageColor3 = v96
			v84.ScaleType = Enum.ScaleType.Slice
			v96 = Rect.new(100, 100, 100, 100)
			v84.SliceCenter = v96
			v84.SliceScale = 0.04
			v84.ZIndex = 1 + _u1
			v87.Name = "ColorValueG"
			v87.Parent = v82
			v96 = Color3.new(0.254902, 0.254902, 0.254902)
			v87.BackgroundColor3 = v96
			v87.BackgroundTransparency = 1
			v87.BorderSizePixel = 0
			v87.ClipsDescendants = true
			v96 = UDim2.new(0, 60, 0, 127)
			v87.Position = v96
			v96 = UDim2.new(0, 51, 0, 16)
			v87.Size = v96
			v87.ZIndex = 2 + _u1
			v87.Font = Enum.Font.SourceSansBold
			v87.Text = "G: 000"
			v96 = Color3.new(1, 1, 1)
			v87.TextColor3 = v96
			v87.TextSize = 14
			v88.Name = "ColorValueGRound"
			v88.Parent = v87
			v88.Active = true
			v96 = Vector2.new(0.5, 0.5)
			v88.AnchorPoint = v96
			v96 = Color3.new(1, 1, 1)
			v88.BackgroundColor3 = v96
			v88.BackgroundTransparency = 1
			v96 = UDim2.new(0.5, 0, 0.5, 0)
			v88.Position = v96
			v88.Selectable = true
			v96 = UDim2.new(1, 0, 1, 0)
			v88.Size = v96
			v88.Image = "rbxassetid://3570695787"
			v96 = Color3.new(0.254902, 0.254902, 0.254902)
			v88.ImageColor3 = v96
			v88.ScaleType = Enum.ScaleType.Slice
			v96 = Rect.new(100, 100, 100, 100)
			v88.SliceCenter = v96
			v88.SliceScale = 0.04
			v88.ZIndex = 1 + _u1
			v85.Name = "ColorValueB"
			v85.Parent = v82
			v96 = Color3.new(0.254902, 0.254902, 0.254902)
			v85.BackgroundColor3 = v96
			v85.BackgroundTransparency = 1
			v85.BorderSizePixel = 0
			v85.ClipsDescendants = true
			v96 = UDim2.new(0, 114, 0, 127)
			v85.Position = v96
			v96 = UDim2.new(0, 50, 0, 16)
			v85.Size = v96
			v85.ZIndex = 2 + _u1
			v85.Font = Enum.Font.SourceSansBold
			v85.Text = "B: 000"
			v96 = Color3.new(1, 1, 1)
			v85.TextColor3 = v96
			v85.TextSize = 14
			v86.Name = "ColorValueBRound"
			v86.Parent = v85
			v86.Active = true
			v96 = Vector2.new(0.5, 0.5)
			v86.AnchorPoint = v96
			v96 = Color3.new(1, 1, 1)
			v86.BackgroundColor3 = v96
			v86.BackgroundTransparency = 1
			v96 = UDim2.new(0.5, 0, 0.5, 0)
			v86.Position = v96
			v86.Selectable = true
			v96 = UDim2.new(1, 0, 1, 0)
			v86.Size = v96
			v86.Image = "rbxassetid://3570695787"
			v96 = Color3.new(0.254902, 0.254902, 0.254902)
			v86.ImageColor3 = v96
			v86.ScaleType = Enum.ScaleType.Slice
			v96 = Rect.new(100, 100, 100, 100)
			v86.SliceCenter = v96
			v86.SliceScale = 0.04
			v86.ZIndex = 1 + _u1
			v89.Name = "RoundHueHolder"
			v89.Parent = v82
			v96 = Color3.new(1, 1, 1)
			v89.BackgroundColor3 = v96
			v89.BackgroundTransparency = 1
			v89.ClipsDescendants = true
			v96 = UDim2.new(0, 136, 0, 6)
			v89.Position = v96
			v96 = UDim2.new(0, 28, 0, 114)
			v89.Size = v96
			v89.ZIndex = 2 + _u1
			v89.Image = "rbxassetid://4695575676"
			v96 = Color3.new(0.137255, 0.137255, 0.137255)
			v89.ImageColor3 = v96
			v89.ScaleType = Enum.ScaleType.Slice
			v96 = Rect.new(128, 128, 128, 128)
			v89.SliceCenter = v96
			v89.SliceScale = 0.05
			v90.Name = "ColorHue"
			v90.Parent = v89
			v96 = Color3.new(1, 1, 1)
			v90.BackgroundColor3 = v96
			v90.BackgroundTransparency = 1
			v90.BorderSizePixel = 0
			v96 = UDim2.new(0, 28, 0, 114)
			v90.Size = v96
			v90.Image = "http://www.roblox.com/asset/?id=4801885250"
			v90.ScaleType = Enum.ScaleType.Crop
			v90.ZIndex = 1 + _u1
			v91.Name = "HueMarker"
			v91.Parent = v89
			v96 = Color3.new(0.294118, 0.294118, 0.294118)
			v91.BackgroundColor3 = v96
			v91.BorderSizePixel = 0
			v96 = UDim2.new(-0.25, 0, 0, 0)
			v91.Position = v96
			v96 = UDim2.new(0, 42, 0, 5)
			v91.Size = v96
			v91.ZIndex = 1 + _u1
			v92.Name = "RoundSaturationHolder"
			v92.Parent = v82
			v96 = Color3.new(1, 1, 1)
			v92.BackgroundColor3 = v96
			v92.BackgroundTransparency = 1
			v92.ClipsDescendants = true
			v96 = UDim2.new(0, 7, 0, 6)
			v92.Position = v96
			v96 = UDim2.new(0, 122, 0, 114)
			v92.Size = v96
			v92.ZIndex = 2 + _u1
			v92.Image = "rbxassetid://4695575676"
			v96 = Color3.new(0.137255, 0.137255, 0.137255)
			v92.ImageColor3 = v96
			v92.ScaleType = Enum.ScaleType.Slice
			v96 = Rect.new(128, 128, 128, 128)
			v92.SliceCenter = v96
			v92.SliceScale = 0.05
			v93.Name = "ColorSelector"
			v93.Parent = v92
			v93.BackgroundColor3 = c
			v93.BorderSizePixel = 0
			v96 = UDim2.new(0, 122, 0, 114)
			v93.Size = v96
			v93.Image = "rbxassetid://4805274903"
			v93.ZIndex = 1 + _u1
			v94.Name = "SaturationMarker"
			v94.Parent = v92
			v96 = Color3.new(1, 1, 1)
			v94.BackgroundColor3 = v96
			v94.BackgroundTransparency = 1
			v96 = UDim2.new(0, 0, 0, 0)
			v94.Size = v96
			v94.Image = "http://www.roblox.com/asset/?id=4805639000"
			v94.ZIndex = 1 + _u1
			function()
				local v97 = math.floor(_u0.ImageColor3.r * 255)
				_u1.Text = "R: " .. v97
				v97 = math.floor(_u0.ImageColor3.g * 255)
				_u2.Text = "G: " .. v97
				v97 = math.floor(_u0.ImageColor3.b * 255)
				_u3.Text = "B: " .. v97
			end()
			v81.MouseButton1Down:Connect(function()
				if not _u0 then
				else
					_u0 = true
					_u1.ClipsDescendants = false
					_u2.ClipsDescendants = false
					local v98 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					local v99 = UDim2.new(0, 171, 0, 175)
					local v100 = _u3:Create(_u3, _u4, v98, { Size = v99 })
					v100:Play()
				end

				if _u0 then
				else
					_u0 = false
					v98 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v99 = UDim2.new(0, 0, 0, 175)
					v100 = _u3:Create(_u3, _u4, v98, { Size = v99 })
					v100:Play()
				end
			end)

			local function v101(a)
				local v102 = math.clamp(_u0.X - a.AbsolutePosition.X, 0, a.AbsoluteSize.X)
				v102 = math.clamp(_u0.Y - a.AbsolutePosition.Y, 0, a.AbsoluteSize.Y)
				do return v102 / a.AbsoluteSize.X, v102 / a.AbsoluteSize.Y end
			end

			local function v103(a)
				MaxY2 = a.AbsoluteSize.Y
				local v104 = math.clamp(_u0.Y - a.AbsolutePosition.Y, -10, MaxY2)
				do return v104 / MaxY2 end
			end

			local function v105()
				_u0()
				local v106 = Color3.fromHSV(_u2.H, _u2.S, _u2.V)
				_u1 = v106
				_u3.ImageColor3 = _u1
				local v107 = Color3.fromHSV(_u2.H, 1, 1)
				_u4.BackgroundColor3 = v107
				_u5(_u3.ImageColor3)
			end

			v93.MouseLeave:Connect(function()
				if not _u0 then
					_u0:Disconnect()
					_u0 = nil
				end

				if _u1 then
				else
					_u1:Disconnect()
					_u1 = nil
				end
			end)
			v90.MouseLeave:Connect(function()
				if not _u0 then
					_u0:Disconnect()
					_u0 = nil
				end

				if _u1 then
				else
					_u1:Disconnect()
					_u1 = nil
				end
			end)
			v79.MouseButton1Down:Connect(function()
				if _u0 then
					_u0 = true
					local v108 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					local v109 = _u1:Create(_u1, _u2, v108, { ImageTransparency = 0 })
					v109:Play()
				else

					if not _u0 then
						_u0 = false
						v108 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v109 = _u1:Create(_u1, _u2, v108, { ImageTransparency = 1 })
						v109:Play()
					end

				end

				while true do

					if not _u0 then
						v109 = Color3.fromHSV(_u4, 1, 1)
						_u3 = v109
						_u5.ImageColor3 = _u3
						_u6.BackgroundColor3 = _u3
						_u7(_u3)
						_u8()
						wait()
					end

				end
			end)
			v93.InputBegan:Connect(function(a)
				if a.UserInputType ~= Enum.UserInputType.MouseButton1 then
				else

					if not _u0 then
					else

						if not _u1 then
							_u1:Disconnect()
						end

						local v113 = _u2.RenderStepped:Connect(function()
							local v110, v111 = _u0(_u1)
							local v112 = UDim2.new(v110, 0, v111, 0)
							_u2.Position = v112
							_u3.S = v110
							_u3.V = 1 - v111
							_u4()
						end)
						_u1 = v113
					end

				end
			end)
			v93.InputEnded:Connect(function(a)
				if a.UserInputType == Enum.UserInputType.MouseButton1 then

					if not _u0 then
						_u0:Disconnect()
					end

				end
			end)
			v90.InputBegan:Connect(function(a)
				if a.UserInputType == Enum.UserInputType.MouseButton1 then

					if _u0 then

						if _u1 then
						else
							_u1:Disconnect()
						end

						local v120 = _u2.RenderStepped:Connect(function()
							local v114, v115 = _u0(_u1)
							local v116 = _u2(_u1)
							_u3.H = 1 - v115
							local v117 = _u4:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							local v118 = UDim2.new(-0.25, 0, v116, 0)
							local v119 = _u4:Create(_u4, _u5, v117, { Position = v118 })
							v119:Play()
							_u6()
						end)
						_u1 = v120
					end

				end
			end)
			v90.InputEnded:Connect(function(a)
				if a.UserInputType ~= Enum.UserInputType.MouseButton1 then
				else

					if not _u0 then
						_u0:Disconnect()
					end

				end
			end)
			_u8.MouseButton1Down:Connect(function()
				if _u0 then
					_u1.ClipsDescendants = true
					_u2.ClipsDescendants = true
					_u3(30)
					_u4(30)
				else

					if not _u0 then
						_u5 = false
						local v121 = _u6:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v122 = UDim2.new(0, 0, 0, 175)
						local v123 = _u6:Create(_u6, _u7, v121, { Size = v122 })
						v123:Play()
						_u1.ClipsDescendants = true
						_u2.ClipsDescendants = true
						_u8(30)
						_u9(30)
					end

				end
			end)
			_u14.MouseButton1Down:Connect(function()
				_u0 = false
				local v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				local v125 = UDim2.new(0, 0, 0, 175)
				local v126 = _u1:Create(_u1, _u2, v124, { Size = v125 })
				v126:Play()
				_u3.ClipsDescendants = true
				_u4.ClipsDescendants = true

				if _u5 then

					if not _u6 then
						_u7(30)
						v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v126 = _u1:Create(_u1, _u8, v124, { Rotation = 360 })
						v126:Play()
						v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v126 = _u1:Create(_u1, _u4, v124, { BackgroundTransparency = 0 })
						v126:Play()
					else

						if not _u6 then
						else
							v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v126 = _u1:Create(_u1, _u4, v124, { BackgroundTransparency = 0 })
							v126:Play()
						else

							if _u5 then
							else

								if _u6 then
								else
									_u9(30)
									v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
									v126 = _u1:Create(_u1, _u8, v124, { Rotation = 0 })
									v126:Play()
									v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
									v126 = _u1:Create(_u1, _u4, v124, { BackgroundTransparency = 1 })
									v126:Play()
								end

								if not _u6 then
								else
									v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
									v126 = _u1:Create(_u1, _u4, v124, { BackgroundTransparency = 1 })
									v126:Play()
								end

							end

						end

					end

				end

				v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v126 = _u1:Create(_u1, _u8, v124, { TextTransparency = 1 })
				v126:Play()
				_u8.Visible = false

				while true do
					wait()

					if _u8.TextTransparency ~= 1 then
					end

				end

				_u8.Visible = true
				v124 = _u1:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v126 = _u1:Create(_u1, _u8, v124, { TextTransparency = 0 })
				v126:Play()
			end)
		end,
			CreateButton = function(a, b, c)
			local v127 = Instance.new("Frame")
			local v128 = Instance.new("TextButton")
			local v129 = Instance.new("ImageLabel")
			local v130 = _u0(b)
			v127.Name = v130 .. "ButtonHolder"
			v127.Parent = _u1
			local v131 = Color3.new(0.137255, 0.137255, 0.137255)
			v127.BackgroundColor3 = v131
			v127.BorderSizePixel = 0
			v131 = UDim2.new(0, 170, 0, 30)
			v127.Size = v131
			v128.Name = "Button"
			v128.Parent = v127
			v131 = Color3.new(0.254902, 0.254902, 0.254902)
			v128.BackgroundColor3 = v131
			v128.BackgroundTransparency = 1
			v128.BorderSizePixel = 0
			v131 = UDim2.new(0.052941177, 0, 0, 0)
			v128.Position = v131
			v131 = UDim2.new(0, 153, 0, 24)
			v128.Size = v131
			v128.ZIndex = 2
			v128.AutoButtonColor = false
			v128.Font = Enum.Font.SourceSansBold
			v128.Text = b
			v131 = Color3.new(1, 1, 1)
			v128.TextColor3 = v131
			v128.TextSize = 14
			v129.Name = "ButtonRound"
			v129.Parent = v128
			v129.Active = true
			v131 = Vector2.new(0.5, 0.5)
			v129.AnchorPoint = v131
			v131 = Color3.new(1, 1, 1)
			v129.BackgroundColor3 = v131
			v129.BackgroundTransparency = 1
			v129.BorderSizePixel = 0
			v129.ClipsDescendants = true
			v131 = UDim2.new(0.5, 0, 0.5, 0)
			v129.Position = v131
			v129.Selectable = true
			v131 = UDim2.new(1, 0, 1, 0)
			v129.Size = v131
			v129.Image = "rbxassetid://3570695787"
			v131 = Color3.new(0.254902, 0.254902, 0.254902)
			v129.ImageColor3 = v131
			v129.ScaleType = Enum.ScaleType.Slice
			v131 = Rect.new(100, 100, 100, 100)
			v129.SliceCenter = v131
			v129.SliceScale = 0.04
			v128.MouseButton1Down:Connect(function() _u0(_u1) end)
			_u2.MouseButton1Down:Connect(function()
				if _u0 then
					_u1(30)
					_u2(30)
				else

					if not _u0 then
						_u3(30)
						_u4(30)
					end

				end
			end)
			_u8.MouseButton1Down:Connect(function()
				if not _u0 then
				else

					if not _u1 then
						_u2(30)
						local v132 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v133 = _u3:Create(_u3, _u4, v132, { Rotation = 360 })
						v133:Play()
						v132 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v133 = _u3:Create(_u3, _u5, v132, { BackgroundTransparency = 0 })
						v133:Play()
					else

						if not _u1 then
						else
							v132 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v133 = _u3:Create(_u3, _u5, v132, { BackgroundTransparency = 0 })
							v133:Play()
						end

						if not _u0 then

							if _u1 then
							else
								_u6(30)
								v132 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
								v133 = _u3:Create(_u3, _u4, v132, { Rotation = 0 })
								v133:Play()
								v132 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
								v133 = _u3:Create(_u3, _u5, v132, { BackgroundTransparency = 1 })
								v133:Play()
							end

							if not _u1 then
							else
								v132 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
								v133 = _u3:Create(_u3, _u5, v132, { BackgroundTransparency = 1 })
								v133:Play()
							end

						end

					end

				end

				v132 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v133 = _u3:Create(_u3, _u4, v132, { TextTransparency = 1 })
				v133:Play()
				_u4.Visible = false

				while true do
					wait()

					if _u4.TextTransparency == 1 then
					end

					_u4.Visible = true
					v132 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v133 = _u3:Create(_u3, _u4, v132, { TextTransparency = 0 })
					v133:Play()
			end)
		end,
			CreateTextbox = function(a, b, c)
			local v134 = Instance.new("Frame")
			local v135 = Instance.new("TextBox")
			local v136 = Instance.new("ImageLabel")
			local v137 = _u0(b)
			v134.Name = v137 .. "TextBoxHolder"
			v134.Parent = _u1
			local v138 = Color3.new(0.137255, 0.137255, 0.137255)
			v134.BackgroundColor3 = v138
			v134.BorderSizePixel = 0
			v138 = UDim2.new(0, 170, 0, 30)
			v134.Size = v138
			v135.Parent = v134
			v138 = Color3.new(0.254902, 0.254902, 0.254902)
			v135.BackgroundColor3 = v138
			v135.BackgroundTransparency = 1
			v135.ClipsDescendants = true
			v138 = UDim2.new(0.0529999994, 0, 0, 0)
			v135.Position = v138
			v138 = UDim2.new(0, 153, 0, 24)
			v135.Size = v138
			v135.ZIndex = 2
			v135.Font = Enum.Font.SourceSansBold
			v135.PlaceholderText = b
			v135.Text = ""
			v138 = Color3.new(1, 1, 1)
			v135.TextColor3 = v138
			v135.TextSize = 14
			v136.Name = "TextBoxRound"
			v136.Parent = v135
			v136.Active = true
			v138 = Vector2.new(0.5, 0.5)
			v136.AnchorPoint = v138
			v138 = Color3.new(1, 1, 1)
			v136.BackgroundColor3 = v138
			v136.BackgroundTransparency = 1
			v136.BorderSizePixel = 0
			v136.ClipsDescendants = true
			v138 = UDim2.new(0.5, 0, 0.5, 0)
			v136.Position = v138
			v136.Selectable = true
			v138 = UDim2.new(1, 0, 1, 0)
			v136.Size = v138
			v136.Image = "rbxassetid://3570695787"
			v138 = Color3.new(0.254902, 0.254902, 0.254902)
			v136.ImageColor3 = v138
			v136.ScaleType = Enum.ScaleType.Slice
			v138 = Rect.new(100, 100, 100, 100)
			v136.SliceCenter = v138
			v136.SliceScale = 0.04
			v135.FocusLost:Connect(function(a)
				if a then
				else
					_u0(_u1.Text)
				end
			end)
			_u2.MouseButton1Down:Connect(function()
				if not _u0 then
				else
					_u1(30)
					_u2(30)
				end

				if _u0 then
				else
					_u3(30)
					_u4(30)
				end
			end)
			_u8.MouseButton1Down:Connect(function()
				if not _u0 then
				else

					if _u1 then
					else
						_u2(30)
						local v139 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v140 = _u3:Create(_u3, _u4, v139, { Rotation = 360 })
						v140:Play()
						v139 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v140 = _u3:Create(_u3, _u5, v139, { BackgroundTransparency = 0 })
						v140:Play()
					end

					if not _u1 then
					else
						v139 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v140 = _u3:Create(_u3, _u5, v139, { BackgroundTransparency = 0 })
						v140:Play()
					end

					if not _u0 then

						if _u1 then
						else
							_u6(30)
							v139 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v140 = _u3:Create(_u3, _u4, v139, { Rotation = 0 })
							v140:Play()
							v139 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v140 = _u3:Create(_u3, _u5, v139, { BackgroundTransparency = 1 })
							v140:Play()
						end

						if not _u1 then
						else
							v139 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v140 = _u3:Create(_u3, _u5, v139, { BackgroundTransparency = 1 })
							v140:Play()
						end

					end

				end

				v139 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
				v140 = _u3:Create(_u3, _u4, v139, { TextTransparency = 1 })
				v140:Play()
				_u4.Visible = false

				while true do
					wait()

					if _u4.TextTransparency == 1 then
					end

					_u4.Visible = true
					v139 = _u3:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v140 = _u3:Create(_u3, _u4, v139, { TextTransparency = 0 })
					v140:Play()
			end)
		end,
			CreateDropdown = function(a, b, c, d, e)
			local v141 = Instance.new("Frame")
			local v142 = Instance.new("TextLabel")
			local v143 = Instance.new("ImageLabel")
			local v144 = Instance.new("TextButton")
			local v145 = Instance.new("ImageLabel")
			local v146 = Instance.new("ScrollingFrame")
			local v147 = Instance.new("UIListLayout")
			local v148 = _u0(b)
			v141.Name = v148 .. "DropdownHolder"
			v141.Parent = _u1
			local v149 = Color3.new(0.137255, 0.137255, 0.137255)
			v141.BackgroundColor3 = v149
			v141.BorderSizePixel = 0
			v149 = UDim2.new(0, 170, 0, 30)
			v141.Size = v149
			v142.Name = "DropdownTitle"
			v142.Parent = v141
			v149 = Color3.new(0.254902, 0.254902, 0.254902)
			v142.BackgroundColor3 = v149
			v142.BackgroundTransparency = 1
			v142.BorderSizePixel = 0
			v149 = UDim2.new(0.0529999994, 0, 0, 0)
			v142.Position = v149
			v149 = UDim2.new(0, 153, 0, 24)
			v142.Size = v149
			v142.ZIndex = 2
			v142.Font = Enum.Font.SourceSansBold
			v142.Text = c[d]
			v149 = Color3.new(1, 1, 1)
			v142.TextColor3 = v149
			v142.TextSize = 14
			v143.Name = "DropdownRound"
			v143.Parent = v142
			v143.Active = true
			v149 = Vector2.new(0.5, 0.5)
			v143.AnchorPoint = v149
			v149 = Color3.new(1, 1, 1)
			v143.BackgroundColor3 = v149
			v143.BackgroundTransparency = 1
			v143.BorderSizePixel = 0
			v143.ClipsDescendants = true
			v149 = UDim2.new(0.5, 0, 0.5, 0)
			v143.Position = v149
			v143.Selectable = true
			v149 = UDim2.new(1, 0, 1, 0)
			v143.Size = v149
			v143.Image = "rbxassetid://3570695787"
			v149 = Color3.new(0.254902, 0.254902, 0.254902)
			v143.ImageColor3 = v149
			v143.ScaleType = Enum.ScaleType.Slice
			v149 = Rect.new(100, 100, 100, 100)
			v143.SliceCenter = v149
			v143.SliceScale = 0.04
			v144.Name = "DropdownToggle"
			v144.Parent = v142
			v149 = Color3.new(1, 1, 1)
			v144.BackgroundColor3 = v149
			v144.BackgroundTransparency = 1
			v149 = UDim2.new(0.816928029, 0, 0, 0)
			v144.Position = v149
			v149 = UDim2.new(0, 28, 0, 24)
			v144.Size = v149
			v144.AutoButtonColor = false
			v144.Font = Enum.Font.SourceSansBold
			v144.Text = ">"
			v149 = Color3.new(1, 1, 1)
			v144.TextColor3 = v149
			v144.TextSize = 15
			v145.Name = "DropdownMain"
			v145.Parent = v142
			v149 = Color3.new(0.137255, 0.137255, 0.137255)
			v145.BackgroundColor3 = v149
			v145.BackgroundTransparency = 1
			v145.ClipsDescendants = true
			v149 = UDim2.new(1.09275186, 0, -0.0336658955, 0)
			v145.Position = v149
			v149 = UDim2.new(0, 0, 0, 0)
			v145.Size = v149
			v145.Image = "rbxassetid://3570695787"
			v149 = Color3.new(0.137255, 0.137255, 0.137255)
			v145.ImageColor3 = v149
			v145.ScaleType = Enum.ScaleType.Slice
			v149 = Rect.new(100, 100, 100, 100)
			v145.SliceCenter = v149
			v145.SliceScale = 0.04
			v146.Parent = v145
			v149 = Color3.new(1, 1, 1)
			v146.BackgroundColor3 = v149
			v146.BackgroundTransparency = 1
			v146.BorderSizePixel = 0
			v149 = UDim2.new(0, 153, 0, 0)
			v146.Size = v149
			v146.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			v149 = UDim2.new(0, 0, 1, 0)
			v146.CanvasSize = v149
			v146.ScrollBarThickness = 3
			v146.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			v146.ScrollingDirection = "Y"
			v147.Name = "ButtonLayout"
			v147.Parent = v146
			v147.SortOrder = Enum.SortOrder.LayoutOrder
			local v149, v150, v151 = pairs(c)

			while true do
				local v152 = Instance.new("TextButton")
				local v153 = _u0(0)
				v152.Name = v153 .. "Button"
				v152.Parent = v146
				local v154 = Color3.new(0.215686, 0.215686, 0.215686)
				v152.BackgroundColor3 = v154
				v152.BackgroundTransparency = 1
				v152.BorderSizePixel = 0
				v154 = UDim2.new(0, 0, 0, 0)
				v152.Position = v154
				v154 = UDim2.new(0, 153, 0, 25)
				v152.Size = v154
				v152.AutoButtonColor = false
				v152.Font = Enum.Font.SourceSansBold
				v152.Text = 0
				v154 = Color3.new(1, 1, 1)
				v152.TextColor3 = v154
				v152.TextSize = 14

				if 0 + 1 <= 4 then
					v154 = UDim2.new(0, 0, 0, 0 + 25)
					v145.Size = v154
				else

					if 4 <= 0 + 1 then
					end

				end

				if true then
				else
					v154 = UDim2.new(0, 0, 1 + 0.25, 0)
					v146.CanvasSize = v154
				end

				v152.InputBegan:Connect(function(a)
					if a.UserInputType == Enum.UserInputType.MouseMovement then
						local v155 = _u0:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v156 = _u0:Create(_u0, _u1, v155, { BackgroundTransparency = 0.5 })
						v156:Play()
					end
				end)
				v152.InputEnded:Connect(function(a)
					if a.UserInputType ~= Enum.UserInputType.MouseMovement then
					else
						local v157 = _u0:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v158 = _u0:Create(_u0, _u1, v157, { BackgroundTransparency = 1 })
						v158:Play()
					end
				end)
				v152.MouseButton1Down:Connect(function()
					_u0 = _u1
					_u2(_u1)
					_u3 = false
					_u4.Text = ">"
					local v159 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					local v160 = _u5:Create(_u5, _u4, v159, { Rotation = 0 })
					v160:Play()
					v159 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					local v161 = Color3.new(1, 1, 1)
					v160 = _u5:Create(_u5, _u6, v159, { TextColor3 = v161 })
					v160:Play()
					_u6.Text = _u0
					v159 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v160 = _u5:Create(_u5, _u7, v159, { ScrollBarImageTransparency = 1 })
					v160:Play()
					v159 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v161 = UDim2.new(0, 0, 0, _u8)
					v160 = _u5:Create(_u5, _u7, v159, { Size = v161 })
					v160:Play()
					v159 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v161 = UDim2.new(0, 0, 0, _u8)
					v160 = _u5:Create(_u5, _u9, v159, { Size = v161 })
					v160:Play()
				end)

				for v162, v163 in v149, v150, v151 do
				end

				v144.MouseButton1Down:Connect(function()
					if _u0 then
					else
						_u0 = false
						_u1.Text = ">"
						local v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v165 = _u2:Create(_u2, _u1, v164, { Rotation = 0 })
						v165:Play()
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v166 = Color3.new(1, 1, 1)
						v165 = _u2:Create(_u2, _u3, v164, { TextColor3 = v166 })
						v165:Play()
						_u3.Text = _u4
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v165 = _u2:Create(_u2, _u5, v164, { ScrollBarImageTransparency = 1 })
						v165:Play()
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v166 = UDim2.new(0, 0, 0, _u6)
						v165 = _u2:Create(_u2, _u5, v164, { Size = v166 })
						v165:Play()
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v166 = UDim2.new(0, 0, 0, _u6)
						v165 = _u2:Create(_u2, _u7, v164, { Size = v166 })
						v165:Play()
					end

					if _u0 then
						_u8.ClipsDescendants = false
						_u9.ClipsDescendants = false
						_u0 = true
						_u1.Text = "<"
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v165 = _u2:Create(_u2, _u1, v164, { Rotation = -360 })
						v165:Play()
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v166 = Color3.new(0.698039, 0.698039, 0.698039)
						v165 = _u2:Create(_u2, _u3, v164, { TextColor3 = v166 })
						v165:Play()
						_u3.Text = _u10
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v165 = _u2:Create(_u2, _u5, v164, { ScrollBarImageTransparency = 0 })
						v165:Play()
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v166 = UDim2.new(0, 153, 0, _u6)
						v165 = _u2:Create(_u2, _u5, v164, { Size = v166 })
						v165:Play()
						v164 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v166 = UDim2.new(0, 153, 0, _u6)
						v165 = _u2:Create(_u2, _u7, v164, { Size = v166 })
						v165:Play()
					end
				end)
				_u4.MouseButton1Down:Connect(function()
					if not _u0 then
					else
						_u1(30)
						_u2(30)
					end

					if not _u0 then
						_u3 = false
						_u4.Text = ">"
						local v167 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v168 = _u5:Create(_u5, _u4, v167, { Rotation = 0 })
						v168:Play()
						v167 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						local v169 = Color3.new(1, 1, 1)
						v168 = _u5:Create(_u5, _u6, v167, { TextColor3 = v169 })
						v168:Play()
						_u6.Text = _u7
						v167 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v168 = _u5:Create(_u5, _u8, v167, { ScrollBarImageTransparency = 1 })
						v168:Play()
						v167 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v169 = UDim2.new(0, 0, 0, 0)
						v168 = _u5:Create(_u5, _u8, v167, { Size = v169 })
						v168:Play()
						v167 = _u5:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v169 = UDim2.new(0, 0, 0, _u10)
						v168 = _u5:Create(_u5, _u9, v167, { Size = v169 })
						v168:Play()
						_u11.ClipsDescendants = true
						_u12.ClipsDescendants = true
						_u13(30)
						_u14(30)
					end
				end)
				_u10.MouseButton1Down:Connect(function()
					_u0 = false
					_u1.Text = ">"
					local v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					local v171 = _u2:Create(_u2, _u1, v170, { Rotation = 0 })
					v171:Play()
					v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					local v172 = Color3.new(1, 1, 1)
					v171 = _u2:Create(_u2, _u3, v170, { TextColor3 = v172 })
					v171:Play()
					_u3.Text = _u4
					v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v171 = _u2:Create(_u2, _u5, v170, { ScrollBarImageTransparency = 1 })
					v171:Play()
					v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v172 = UDim2.new(0, 0, 0, _u6)
					v171 = _u2:Create(_u2, _u5, v170, { Size = v172 })
					v171:Play()
					v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v172 = UDim2.new(0, 0, 0, _u6)
					v171 = _u2:Create(_u2, _u7, v170, { Size = v172 })
					v171:Play()
					_u8.ClipsDescendants = true
					_u9.ClipsDescendants = true

					if _u10 then

						if not _u11 then
							_u12(30)
							v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v171 = _u2:Create(_u2, _u13, v170, { Rotation = -360 })
							v171:Play()
							v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
							v171 = _u2:Create(_u2, _u9, v170, { BackgroundTransparency = 0 })
							v171:Play()
						else

							if not _u11 then
							else
								v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
								v171 = _u2:Create(_u2, _u9, v170, { BackgroundTransparency = 0 })
								v171:Play()
							else

								if _u10 then
								else

									if _u11 then
									else
										_u14(30)
										v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
										v171 = _u2:Create(_u2, _u13, v170, { Rotation = 0 })
										v171:Play()
										v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
										v171 = _u2:Create(_u2, _u9, v170, { BackgroundTransparency = 1 })
										v171:Play()
									end

									if not _u11 then
									else
										v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
										v171 = _u2:Create(_u2, _u9, v170, { BackgroundTransparency = 1 })
										v171:Play()
									end

								end

							end

						end

					end

					v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
					v171 = _u2:Create(_u2, _u13, v170, { TextTransparency = 1 })
					v171:Play()
					_u13.Visible = false

					while true do
						wait()

						if _u13.TextTransparency == 1 then
						end

						_u13.Visible = true
						v170 = _u2:Create(Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
						v171 = _u2:Create(_u2, _u13, v170, { TextTransparency = 0 })
						v171:Play()
				end)
		end,
		} end
	end,
	} end
end,
} end
