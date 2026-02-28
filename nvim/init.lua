require("config.settings")
require("config.keybinds")
require("config.statusline")
require("config.diagnostics")
require("config.lsp")

-- Load all the plugins
for _, plugin in ipairs(vim.api.nvim_get_runtime_file("lua/plugins/*.lua", true)) do
	require("plugins." .. vim.fn.fnamemodify(plugin, ":t:r"))
end
