vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
})

require("tokyonight").setup({
	-- Use the moon style for dark mode
	style = "moon",
	-- Use the day style for light mode
	light_style = "day",
	-- Enable transparent background
	transparent = true,
	-- Enable terminal colors
	terminal_colors = true,
	-- Adjust the brightness of the day style (0 = dull, 1 = vibrant)
	day_brightness = 0.3,
	-- Dim inactive windows
	dim_inactive = false,
	-- Make lualine section headers bold
	lualine_bold = false,
	-- Enable caching for better performance
	cache = true,
	-- Styles for different syntax groups
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	-- Custom color overrides
	on_colors = function(colors)
		-- You can override specific colors here if needed
		-- Example: colors.hint = colors.orange
	end,
	-- Custom highlight overrides
	on_highlights = function(highlights, colors)
		-- Status line
		highlights.StatusLine = { fg = colors.blue, bg = colors.bg }
		highlights.StatusLineInfo = { fg = colors.bg, bg = colors.blue, italic = true }
		highlights.StatusLineInfoInverse = { fg = colors.blue, bg = colors.bg, italic = true }
		highlights.StatusLineGit = { fg = colors.red }

		-- Status line modes
		highlights.StatusLineMode = { fg = colors.bg, bg = colors.cyan }
		highlights.StatusLineModeInverse = { fg = colors.cyan, bg = colors.bg }
		highlights.StatusLineModeNormal = { fg = colors.bg, bg = colors.green }
		highlights.StatusLineModeNormalInverse = { fg = colors.green, bg = colors.bg }
		highlights.StatusLineModeVisual = { fg = colors.bg, bg = colors.magenta }
		highlights.StatusLineModeVisualInverse = { fg = colors.magenta, bg = colors.bg }
		highlights.StatusLineModeSelect = { fg = colors.pink, bg = colors.bg }
		highlights.StatusLineModeSelectInverse = { fg = colors.bg, bg = colors.green }
		highlights.StatusLineModeInsert = { fg = colors.bg, bg = colors.red }
		highlights.StatusLineModeInsertInverse = { fg = colors.red, bg = colors.bg }

		-- Status line diagnostics
		highlights.StatusLineDiagnosticErrors = { fg = colors.bg, bg = colors.red }
		highlights.StatusLineDiagnosticErrorsInverse = { fg = colors.red, bg = colors.bg }
		highlights.StatusLineDiagnosticWarnings = { fg = colors.bg, bg = colors.yellow }
		highlights.StatusLineDiagnosticWarningsInverse = { fg = colors.yellow, bg = colors.bg }
		highlights.StatusLineDiagnosticSeparator = { fg = colors.yellow, bg = colors.red }
	end,
	-- Enable all plugins when not using lazy.nvim
	plugins = {
		all = package.loaded.lazy == nil,
		auto = true,
		-- Enable specific plugins
		telescope = true,
		nvim_tree = true,
		gitsigns = true,
		lsp = true,
		-- Add other plugins as needed
	},
})

-- Set the colorscheme
vim.cmd.colorscheme("tokyonight")

-- Function to toggle between light and dark mode
function ToggleTheme()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
	vim.cmd.colorscheme("tokyonight")
end

-- Create a command to toggle the theme
vim.api.nvim_create_user_command("ToggleTheme", ToggleTheme, {})
