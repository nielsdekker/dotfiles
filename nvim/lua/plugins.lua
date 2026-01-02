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
--- @field now? function
--- @field later? function

local add, later, now = require("mini.deps").add, require("mini.deps").later, require("mini.deps").now

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
			add({
				source = plugin.source,
				name = plugin.name,
				depends = plugin.depends,
				checkout = plugin.checkout,
				hooks = plugin.hooks,
			})
		end

		if plugin.now ~= nil then
			now(plugin.now)
		end
		if plugin.later ~= nil then
			later(plugin.later)
		end
	end
end

loadForPath("lua/plugins/*.lua")
