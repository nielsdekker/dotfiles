---@diagnostic disable-next-line: duplicate-doc-alias
--- @alias palette ({
---     group: string,
---     gen_inverse: boolean,
---     hl: vim.api.keyset.highlight,
--- })
local S = {}

-- Reset the colors
if vim.g.colors_name then
	vim.cmd("hi clear")
end

vim.g.colors_name = "nelis"

-- Use an auto command so the colors can be updated based on dark/light mode of
-- the OS.
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Make sure this is the active color scheme
		if vim.g.colors_name ~= "nelis" then
			return
		end

		if vim.o.background == "dark" then
			S.use_palette("NvimLight", "NvimDark")
		else
			S.use_palette("NvimDark", "NvimLight")
		end
	end,
})

--- For the colors they can be prefixed with the following:
--- - `#` Use the primary prefix
--- - `%` Use the secondary prefix
---
--- This is done to make it easy to switch between light and dark modes
---
--- @type palette[]
S.colors = {
	{ group = "Normal", hl = { fg = "#Grey2", bg = "NONE" } },
	{ group = "Statement", hl = { fg = "#Blue", bold = true } },
	{ group = "Comment", hl = { fg = "#Grey4", italic = true } },
	{ group = "ColorColumn", hl = { bg = "%Grey3" } },
	{ group = "Constant", hl = { fg = "#Magenta" } },
	{ group = "PreProc", hl = { fg = "#Yellow" } },
	{ group = "Type", hl = { fg = "#Grey2", italic = true } },
	{ group = "NonText", hl = { fg = "#Grey4" } },
	{ group = "MatchParen", hl = { fg = "Orange", bg = "NONE", bold = true } },

	-- Statusline colors
	{ group = "StatusLine", hl = { fg = "#Grey2", bg = "%Grey2" } },
	{
		group = "StatusLineMode",
		hl = { fg = "#Yellow", bg = "%Yellow" },
		gen_inverse = true,
	},
	{
		group = "StatusLineModeNormal",
		hl = { fg = "#Blue", bg = "%Blue" },
		gen_inverse = true,
	},
	{
		group = "StatusLineModeInsert",
		hl = { fg = "#Magenta", bg = "%Magenta" },
		gen_inverse = true,
	},
	{
		group = "StatusLineModeVisual",
		hl = { fg = "#Green", bg = "%Green" },
		gen_inverse = true,
	},
	{ group = "StatusLineModeSelect", hl = { fg = "#Green", bg = "%Green" } },
	{ group = "StatusLineGit", hl = { fg = "Magenta" } },
	{
		group = "StatusLineDiagnosticErrors",
		hl = { fg = "#Red", bg = "%Red" },
		gen_inverse = true,
	},
	{
		group = "StatusLineDiagnosticWarnings",
		hl = { fg = "#Yellow", bg = "%Yellow" },
		gen_inverse = true,
	},
	{
		group = "StatusLineDiagnosticSeparator",
		hl = { fg = "%Yellow", bg = "%Red" },
		gen_inverse = true,
	},
	{
		group = "StatusLineInfo",
		hl = { fg = "#Grey4", italic = true },
	},

	-- Diagnostic
	{ group = "DiagnosticVirtualTextError", hl = { fg = "#Red", bg = "%Red", italic = true } },
	{ group = "DiagnosticVirtualTextWarn", hl = { fg = "#Yellow", bg = "%Yellow", italic = true } },
	{ group = "DiagnosticVirtualTextHint", hl = { fg = "#Cyan", bg = "%Cyan", italic = true } },
	{ group = "DiagnosticErrorLine", hl = { bg = "%Red" } },
	{ group = "DiagnosticWarnLine", hl = { bg = "%Yellow" } },
	{ group = "DiagnosticHintLine", hl = { bg = "%Cyan" } },
}

--- @param primary_prefix string
--- @param secondary_prefix string
S.use_palette = function(primary_prefix, secondary_prefix)
	for _, v in pairs(S.colors) do
		v.hl.fg = S.with_prefix(v.hl.fg, primary_prefix, secondary_prefix)
		v.hl.bg = S.with_prefix(v.hl.bg, primary_prefix, secondary_prefix)

		vim.api.nvim_set_hl(0, v.group, v.hl)

		if v.hl.bg ~= nil and v.gen_inverse then
			local inverse = vim.fn.deepcopy(v.hl)
			inverse.fg = v.hl.bg
			inverse.bg = ""

			vim.api.nvim_set_hl(0, v.group .. "Inverse", inverse)
		end
	end
end

--- @param value (string|integer)|nil
--- @param primary_prefix string
--- @param secondary_prefix string
--- @return (string|integer)| nil
S.with_prefix = function(value, primary_prefix, secondary_prefix)
	if value == nil then
		return nil
	end

	local prefix = string.sub(value, 1, 1)

	if prefix == "#" then
		return primary_prefix .. string.sub(value, 2)
	elseif prefix == "%" then
		return secondary_prefix .. string.sub(value, 2)
	else
		return value
	end
end
