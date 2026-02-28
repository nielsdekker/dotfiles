vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})

local icons = require("mini.icons")

icons.setup({
	style = "glyph",
})
icons.tweak_lsp_kind("replace")
