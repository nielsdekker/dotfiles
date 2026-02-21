--- @type MiniDep
return {
	source = "nvim-treesitter/nvim-treesitter",
	checkout = "main",
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
	setup = function()
		require("nvim-treesitter").setup()

		-- Autocmd to start treesitter for languages for which a treesitter
		-- parser is installed.
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

				if lang ~= nil and vim.treesitter.language.add(lang) then
					vim.treesitter.start()
				end
			end,
		})
	end,
}
