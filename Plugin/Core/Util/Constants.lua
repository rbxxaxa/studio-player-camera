local Plugin = script.Parent.Parent.Parent
local InstanceStorage = Plugin.InstanceStorage

local wrapStrictTable = require(Plugin.Core.Util.wrapStrictTable)
local Types = require(Plugin.Core.Util.Types)

local Constants = {}

Constants.DEBUG_LABEL = "StudioPlayerCamera"
Constants.PLUGIN_MIN_WIDTH = 320
Constants.PLUGIN_MAX_WIDTH = 600
Constants.TOOLBAR_ICON = "rbxassetid://0"
Constants.MAIN_ICON = "rbxassetid://0"
Constants.PLUGIN_PRODUCT_ID = 0
Constants.PLUGIN_VERSION = "0.0.0"

-- Fields
Constants.DEFAULT_LABEL_WIDTH = 80

-- Font
Constants.FONT = Enum.Font.SourceSans
Constants.FONT_BOLD = Enum.Font.SourceSansBold
Constants.FONT_SIZE_VERY_SMALL = 12
Constants.FONT_SIZE_SMALL = 14
Constants.FONT_SIZE_MEDIUM = 16
Constants.FONT_SIZE_LARGE = 18

-- Tabber
Constants.TAB_HEIGHT = 40
Constants.TAB_WIDTH = 40
Constants.TAB_ICON_SIZE = UDim2.new(0, 32, 0, 32)

-- Scrollbar
Constants.SCROLL_BAR_THICKNESS = 16
Constants.SCROLL_BAR_ARROW_DOWN = "rbxassetid://3645604472"

-- Input fields
Constants.INPUT_FIELD_TEXT_PADDING = 4
Constants.INPUT_FIELD_BOX_PADDING = 4
Constants.INPUT_FIELD_LABEL_PADDING = 12
Constants.INPUT_FIELD_INDENT_PER_LEVEL = 12
Constants.INPUT_FIELD_HEIGHT = 24
Constants.INPUT_FIELD_BOX_HEIGHT = 24
Constants.FIELD_LABEL_WIDTH = 110

Constants.BUTTON_HEIGHT = 24

-- Checkbox
Constants.CHECKBOX_SIZE = 18
Constants.CHECK_IMAGE = "rbxassetid://2773796198"
Constants.DROP_SHADOW_SLICE_IMAGE = "rbxassetid://2950485059" -- 69x69, Rect(23, 23, 46, 46)

-- Dropdowns
Constants.DROPDOWN_ARROW_IMAGE = "rbxassetid://3646123659"
Constants.DROPDOWN_ENTRY_HEIGHT = 24

-- Collapsible titled section
Constants.COLLAPSIBLE_SECTION_HEIGHT = 32
Constants.COLLAPSIBLE_ARROW_RIGHT_IMAGE = "rbxassetid://3010958455"
Constants.COLLAPSIBLE_ARROW_DOWN_IMAGE = "rbxassetid://3010958148"
Constants.COLLAPSIBLE_ARROW_SIZE = 10

-- Precise button
Constants.DOUBLE_CLICK_DELAY = 0.5

-- Numerical slider
Constants.SLIDER_BUTTON_WIDTH = 10
Constants.SLIDER_BUTTON_HEIGHT = 20

return wrapStrictTable(Constants, "Constants")
