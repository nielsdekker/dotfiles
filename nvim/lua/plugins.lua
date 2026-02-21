--- @class MiniDep
---
--- Settings specific to mini.deps
--- @field source string
--- @field name? string
--- @field checkout? string
--- @field depends? string[]
--- @field hooks? { post_checkout?: function }
---
--- Own settings
--- @field setup? function

local md = require("mini.deps")

--- Small helper function to load all plugins in the given path
local function loadForPath(p)
	local plugins = vim.iter(vim.api.nvim_get_runtime_file(p, true))
		:map(function(f)
			return vim.fn.fnamemodify(f, ":t:r")
		end)
		:totable()

	for _, v in ipairs(plugins) do
		---@type MiniDep
		local plugin = require("plugins." .. v)

		if plugin.source ~= "mini.nvim" then
			md.add({
				source = plugin.source,
				name = plugin.name,
				depends = plugin.depends,
				checkout = plugin.checkout,
				hooks = plugin.hooks,
			})
		end

		if plugin.setup ~= nil then
			md.now(plugin.setup)
		end
	end
end

loadForPath("lua/plugins/*.lua")
