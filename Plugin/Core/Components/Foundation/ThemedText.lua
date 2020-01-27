local Plugin = script.Parent.Parent.Parent.Parent

local Libs = Plugin.Libs
local Roact = require(Libs.Roact)

local Constants = require(Plugin.Core.Util.Constants)
local ContextHelper = require(Plugin.Core.Util.ContextHelper)

local withTheme = ContextHelper.withTheme

local ThemedText = Roact.PureComponent:extend("ThemedText")

ThemedText.defaultProps = {
	width = UDim.new(1, 0),
	Text = "",
	Font = Constants.FONT,
	TextSize = Constants.FONT_SIZE_MEDIUM,
	textStyle = "Default",
	-- Padding may be added at some pt
}

-- Children must have a zero Y-Scale size.
function ThemedText:render()
	local props = self.props
	local Size = props.Size
	local Text = props.Text
	local Position = props.Position
	local Font = props.Font
	local TextSize = props.TextSize
	local TextXAlignment = props.TextXAlignment
	local textStyle = props.textStyle
	local LayoutOrder = props.LayoutOrder
	local ZIndex = props.ZIndex
	local AnchorPoint = props.AnchorPoint

	return withTheme(
		function(theme)
			local TextColor3 =
                textStyle == "Warning" and theme.warningTextColor or
                textStyle == "Positive" and theme.positiveTextColor or
                textStyle == "Inactive" and theme.disabledTextColor or
				theme.mainTextColor
			return Roact.createElement(
				"TextLabel",
				{
					BackgroundTransparency = 1,
					TextStrokeTransparency = 1,
					TextScaled = false,
					
                    Size = Size,
					Text = Text,
					Position = Position,
					Font = Font,
					TextSize = TextSize,
					TextXAlignment = TextXAlignment,
					TextColor3 = TextColor3,
					LayoutOrder = LayoutOrder,
					ZIndex = ZIndex,
					AnchorPoint = AnchorPoint,
				}
			)
		end
	)
end

return ThemedText