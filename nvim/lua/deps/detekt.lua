--- @type MiniDep
return {
    source = "nielsdekker/detekt.nvim",
    name = "detekt",
    later = function()
        require("detekt").setup({
            detekt_exec = "detekt",
            baseline_names = { "detekt-baseline.xml" },
            log_level = vim.log.levels.INFO
        })
    end
}
