local Plugin = script.Parent.Parent
local Libs = Plugin.Libs

local Constants = require(Plugin.Core.Util.Constants)
local semver = require(Libs.semver)
local Maid = require(Libs.Maid)
local createSignal = require(Plugin.Core.Util.createSignal)

local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")

local MainManager = {}

function MainManager.new(plugin)
	local self = setmetatable({}, {__index = MainManager})
	self._signal = createSignal()
	self.plugin = plugin
	self.maid = Maid.new()
	self.mode = "None"
	self.mouse = plugin:GetMouse()
	self.ready = false
	self.collapsibleSections = {}

	self.deactivationConn =
		plugin.Deactivation:Connect(
		function()
			self.mode = "None"
			self._signal:fire()
		end
	)
	
	return self
end

function MainManager:subscribe(...)
	return self._signal:subscribe(...)
end

function MainManager:IsInEditMode()
	if RunService:IsStudio() and RunService:IsEdit() then
		return true
	else
		return false
	end
end

function MainManager:destroy()
	self.maid:Destroy()
end

function MainManager:GetMode()
	return self.mode
end

function MainManager:Activate(mode)
	self.mode = mode
	self.plugin:Activate(true)
	self._signal:fire()
end

function MainManager:Deactivate()
	self.mode = "None"
	self.plugin:Deactivate()
	self._signal:fire()
end

function MainManager:IsActive()
	return self.mode ~= "None"
end

function MainManager:IsUpdateAvailable()
	local cachedUpdate = self.cachedUpdate
	if cachedUpdate == nil then
		local pid = Constants.PLUGIN_PRODUCT_ID
		local ok, _ =
			pcall(
			function()
				local pInfo = MarketplaceService:GetProductInfo(pid)
				local desc = pInfo.Description
				-- Description is empty. Maybe we got cd'ed?
				if not desc then
					warn(string.format("[%s] Can't retrieve plugin version. A new update may be available.", Constants.DEBUG_LABEL))
					cachedUpdate = false
					return
				else
					local semverMatch = desc:match("semver ([0-9]+%.[0-9]+%.[0-9]+)")
					if semverMatch then
						local websitePluginVersion = semver(semverMatch)
						local thisPluginVersion = semver(Constants.PLUGIN_VERSION)
						if thisPluginVersion < websitePluginVersion then
							cachedUpdate = true
							return
						else
							cachedUpdate = false
							return
						end
					else
						-- Typo, maybe? Accidentally cleared?
						warn(string.format("[%s] Can't retrieve plugin version. A new update may be available.", Constants.DEBUG_LABEL))
						cachedUpdate = false
						return
					end
				end
			end
		)

		if not ok then
			warn(string.format("[%s] Can't retrieve plugin version. A new update may be available.", Constants.DEBUG_LABEL))
			cachedUpdate = false
		end

		self.cachedUpdate = cachedUpdate
	end

	return cachedUpdate
end

function MainManager:ToggleCollapsibleSection(sectionId)
	local isCollapsed = self.collapsibleSections[sectionId]
	if isCollapsed == nil then
		self.collapsibleSections[sectionId] = true
		self._signal:fire()
	else
		self.collapsibleSections[sectionId] = not isCollapsed
		self._signal:fire()
	end
end

function MainManager:IsSectionCollapsed(sectionId)
	local isCollapsed = self.collapsibleSections[sectionId]
	if isCollapsed == nil then
		return false
	end

	return isCollapsed
end

return MainManager
