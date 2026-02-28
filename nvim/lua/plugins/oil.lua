vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
