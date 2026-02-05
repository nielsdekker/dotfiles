--- @type MiniDep
return {
	source = "catppuccin/nvim",
	now = function()
		-- Yanked from the lsp configuration in Catppuccin plugin
		local darkening_percentage = 0.095
		local U = require("catppuccin.utils.colors")

		require("catppuccin").setup({
			flavour = "auto",
			background = {
				light = "latte",
				dark = "macchiato",
			},
			integrations = {
				snacks = {
					enabled = true,
					indent_scope_color = "",
				},
			},
			custom_highlights = function(colors)
				return {
					-- Status line
					StatusLine = { fg = colors.lavender, bg = colors.base },
					StatusLineInfo = { fg = colors.lavender },
					StatusLineGit = { fg = colors.maroon },

					-- Status line modes
					StatusLineMode = { fg = colors.base, bg = colors.teal },
					StatusLineModeNormal = { fg = colors.base, bg = colors.sky },
					StatusLineModeNormalInverse = { fg = colors.sky, bg = colors.base },
					StatusLineModeVisual = { fg = colors.base, bg = colors.green },
					StatusLineModeVisualInverse = { fg = colors.green, bg = colors.base },
					StatusLineModeSelect = { fg = colors.pink, bg = colors.base },
					StatusLineModeSelectInverse = { fg = colors.base, bg = colors.green },
					StatusLineModeInsert = { fg = colors.base, bg = colors.mauve },
					StatusLineModeInsertInverse = { fg = colors.mauve, bg = colors.base },

					-- Status line diagnostics
					StatusLineDiagnosticErrors = { fg = colors.base, bg = colors.red },
					StatusLineDiagnosticErrorsInverse = { fg = colors.red, bg = colors.base },
					StatusLineDiagnosticWarnings = { fg = colors.base, bg = colors.yellow },
					StatusLineDiagnosticWarningsInverse = { fg = colors.yellow, bg = colors.base },
					StatusLineDiagnosticSeparator = { fg = colors.yellow, bg = colors.red },

					-- Diagnostics
					DiagnosticErrorLine = { bg = U.darken(colors.red, darkening_percentage, colors.base) },
					DiagnosticWarnLine = { bg = U.darken(colors.yellow, darkening_percentage, colors.base) },
					DiagnosticHintLine = { bg = U.darken(colors.teal, darkening_percentage, colors.base) },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
