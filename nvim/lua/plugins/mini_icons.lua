--- @type MiniDep
return {
	source = "nvim-mini/mini.nvim",
	now = function()
		local icons = require("mini.icons")

		icons.setup({
			style = "glyph",
		})
		icons.tweak_lsp_kind("replace")
	end,
}
