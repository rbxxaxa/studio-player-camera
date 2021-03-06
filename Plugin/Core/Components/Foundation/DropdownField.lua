local Plugin = script.Parent.Parent.Parent.Parent

local Libs = Plugin.Libs
local Roact = require(Libs.Roact)

local Constants = require(Plugin.Core.Util.Constants)

local Components = Plugin.Core.Components
local Foundation = Components.Foundation
local LabeledFieldTemplate = require(Foundation.LabeledFieldTemplate)
local ThemedDropdown = require(Foundation.ThemedDropdown)

local DropdownField = Roact.PureComponent:extend("DropdownField")

function DropdownField:init()
end

function DropdownField:render()
	local props = self.props
	local label = props.label
	local LayoutOrder = props.LayoutOrder
	local entries = props.entries
	local selectedId = props.selectedId
	local Visible = props.Visible ~= false
	local onSelected = props.onSelected
	local enabled = props.enabled
	local inactive = props.inactive
	local modalIndex = props.modalIndex

	local boxHeight = props.height or Constants.INPUT_FIELD_BOX_HEIGHT

	return Roact.createElement(
		LabeledFieldTemplate,
		{
			label = label,
			LayoutOrder = LayoutOrder,
			Visible = Visible,
			enabled = enabled,
			height = boxHeight
		},
		{
			Box = Roact.createElement(
				ThemedDropdown,
				{
					entries = entries,
					selectedId = selectedId,
					Size = UDim2.new(1, 0, 0, boxHeight),
					entryHeight = boxHeight,
					Position = UDim2.new(0, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					onSelected = onSelected,
					enabled = enabled,
					onOpen = props.onOpen,
					onClose = props.onClose,
					Visible = Visible,
					inactive = inactive,
					modalIndex = modalIndex
				}
			)
		}
	)
end

return DropdownField
