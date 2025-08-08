--- @type MiniDep
return {
    source = "nielsdekker/detekt.nvim",
    name = "detekt",
    later = function()
        require("detekt").setup({
            baseline_names = { "detekt-baseline.xml" },
        })
    end
}
