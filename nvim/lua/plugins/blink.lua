--- @type MiniDep
return {
	source = "saghen/blink.cmp",
	checkout = "v1.8.0",

	depends = {
		"saghen/blink.compat",
	},

	later = function()
		require("blink.compat").setup({})

		require("blink.cmp").setup({
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = true },
				accept = {
					auto_brackets = { enabled = false },
					dot_repeat = false,
				},
				list = { selection = { preselect = false, auto_insert = true } },

				-- Make sure the winblend option also affects blink.cmp
				menu = { winblend = vim.o.winblend },

				-- Prevent unnecessary tokens
				trigger = { prefetch_on_insert = false },
			},
			keymap = {
				preset = "default",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},
			sources = {
				default = {
					"lsp",
					"path",
					"buffer",
					"avante_commands",
					"avante_files",
					"avante_mentions",
				},

				-- Set custom providers for avante so the slash commands work.
				providers = {
					avante_commands = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 100,
						opts = {},
					},
					avante_files = {
						name = "avante_files",
						module = "blink.compat.source",
						score_offset = 100,
						opts = {},
					},
					avante_mentions = {
						name = "avante_mentions",
						module = "blink.compat.source",
						score_offset = 100,
						opts = {},
					},
				},
			},
		})
	end,
}
