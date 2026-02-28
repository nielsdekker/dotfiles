vim.pack.add({
	{ src = "https://github.com/nielsdekker/detekt.nvim", name = "detekt" },
})

require("detekt").setup({
	baseline_names = { "detekt-baseline.xml" },
})
