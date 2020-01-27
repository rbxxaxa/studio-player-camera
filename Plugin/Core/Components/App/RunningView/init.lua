local Plugin = script.Parent.Parent.Parent.Parent

local Libs = Plugin.Libs
local Roact = require(Libs.Roact)

local ContextGetter = require(Plugin.Core.Util.ContextGetter)
local ContextHelper = require(Plugin.Core.Util.ContextHelper)

local withTheme = ContextHelper.withTheme
local getMainManager = ContextGetter.getMainManager

local Components = Plugin.Core.Components
local Foundation = Components.Foundation
local ThemedTextButton = require(Foundation.ThemedTextButton)
local ScrollingVerticalList = require(Foundation.ScrollingVerticalList)
local VerticalList = require(Foundation.VerticalList)
local NumericalSliderField = require(Foundation.NumericalSliderField)
local CheckboxField = require(Foundation.CheckboxField)

local RunningView = Roact.PureComponent:extend("RunningView")

function RunningView:init()
	self:setState(
		{
			currentTab = "Test"
		}
	)
end

function RunningView:render()
	return withTheme(
		function(theme)
			local page = Roact.createElement(
				"Frame",
				{
					BackgroundColor3 = theme.mainBackgroundColor,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				},
				{
					Roact.createElement(
						ScrollingVerticalList,
						{
							Size = UDim2.new(1, 0, 1, 0),
						},
						{
							List = Roact.createElement(
								VerticalList,
								{
									width = UDim.new(1, 0),
									PaddingLeftPixel = 4,
									PaddingRightPixel = 4,
									PaddingTopPixel = 4,
									PaddingBottomPixel = 4,
									ElementPaddingPixel = 4,
								},
								{
									MainButton = Roact.createElement(
										ThemedTextButton,
										{
											Text = "Spawn Player Camera",
											Size = UDim2.new(1, 0, 0, 60),
											LayoutOrder = 1
										}
									),
									WalkSpeed = Roact.createElement(
										NumericalSliderField,
										{
											label = "WalkSpeed",
											minValue = 1,
											maxValue = 100,
											value = 16,
											valueSnap = 1,
											valueRound = 1,
											LayoutOrder = 2
										}
									),
									JumpPower = Roact.createElement(
										NumericalSliderField,
										{
											label = "JumpPower",
											minValue = 1,
											maxValue = 200,
											value = 50,
											valueSnap = 1,
											valueRound = 1,
											LayoutOrder = 3
										}
									),
									WalkThroughWalls = Roact.createElement(
										CheckboxField,
										{
											label = "Walk through walls?",
											checked = true,
											LayoutOrder = 4
										}
									),
									SimulateGravity = Roact.createElement(
										CheckboxField,
										{
											label = "Simulate gravity?",
											checked = true,
											LayoutOrder = 5
										}
									)
								}
							)
						}
					)
				}
			)

			return page
		end
	)
end

return RunningView
