vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
})

-- Small auto command to update all the parsers when there is an update
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(evt)
		if evt.data.kind == "update" and evt.data.spec.name == "nvim-treesitter" then
			if not pcall(vim.cmd, "TSUpdate") then
				vim.notify("TSUpdate failed", vim.log.levels.WARN)
			end
		end
	end,
})

require("nvim-treesitter").setup()
require("nvim-treesitter").install({
	"bash",
	"dtd",
	"go",
	"java",
	"javascript",
	"json",
	"jsx",
	"kotlin",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"sql",
	"typescript",
	"xml",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local ft = vim.bo.filetype
		if ft and ft ~= "" then
			-- Safe call to  start. No need to throw errors when a parser is not
			-- installed.
			pcall(vim.treesitter.start)
		end
	end,
})
