local Plugin = script.Parent.Parent.Parent.Parent

local Libs = Plugin.Libs
local Roact = require(Libs.Roact)

local ContextGetter = require(Plugin.Core.Util.ContextGetter)
local ContextHelper = require(Plugin.Core.Util.ContextHelper)

local withTheme = ContextHelper.withTheme
local getMainManager = ContextGetter.getMainManager

local Components = Plugin.Core.Components
local Foundation = Components.Foundation
local TabbedMenu = require(Foundation.TabbedMenu)
local Test = require(script.Test)
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
			local page =
				Roact.createElement(
				"Frame",
				{
					BackgroundColor3 = theme.mainBackgroundColor,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				},
				{
					Tabber = Roact.createElement(
						TabbedMenu,
						{
							tabs = {
								{id = "Test", text = "Test", image = ""}
							},
							activeId = self.state.currentTab,
							onTabClick = function(tabId)
								if self.state.currentTab ~= tabId then
									self:setState {currentTab = tabId}
									getMainManager(self):Deactivate()
								end
							end
						},
						{
							Test = self.state.currentTab == "Test" and Roact.createElement(Test)
						}
					)
				}
			)

			return page
		end
	)
end

return RunningView
