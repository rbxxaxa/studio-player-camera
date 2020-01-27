local Plugin = script.Parent.Parent.Parent.Parent

local Libs = Plugin.Libs
local Roact = require(Libs.Roact)

local Constants = require(Plugin.Core.Util.Constants)

local Components = Plugin.Core.Components
local Foundation = Components.Foundation
local LabeledFieldTemplate = require(Foundation.LabeledFieldTemplate)
local ThemedColorSelector = require(Foundation.ThemedColorSelector)

local ColorSelectorField = Roact.PureComponent:extend("ColorSelectorField")

function ColorSelectorField:init()
end

function ColorSelectorField:render()
	local props = self.props
	local color = props.color
	local label = props.label
	local LayoutOrder = props.LayoutOrder
	local Visible = props.Visible
	local onColorChanged = props.onColorChanged
	local modalIndex = props.modalIndex

	local boxHeight = Constants.INPUT_FIELD_BOX_HEIGHT

	return Roact.createElement(
		LabeledFieldTemplate,
		{
			label = label,
			LayoutOrder = LayoutOrder,
			Visible = Visible,
		},
		{
			Box = Roact.createElement(
				ThemedColorSelector,
				{
					color = color,
					Size = UDim2.new(1, 0, 0, boxHeight),
					Position = UDim2.new(0, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					onColorChanged = onColorChanged,
					modalIndex = modalIndex
				}
			)
		}
	)
end

return ColorSelectorField
