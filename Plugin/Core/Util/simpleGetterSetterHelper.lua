local function simpleGetterSetterHelper(classTable, propertyName, defaultValue)
	classTable[string.format("Set%s", propertyName)] = function(self, newValue)
		if self[propertyName] == nil and defaultValue ~= newValue then
			self[propertyName] = newValue
			self._signal:fire()
			return
		end

		if self[propertyName] ~= newValue then
			self[propertyName] = newValue
			self._signal:fire()
			return
		end
	end

	classTable[string.format("Get%s", propertyName)] = function(self)
		if self[propertyName] == nil then
			return defaultValue
		end
		return self[propertyName]
	end
end

return simpleGetterSetterHelper