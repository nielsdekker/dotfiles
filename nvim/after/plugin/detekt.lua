local deps = require("mini.deps")

deps.later(function()
    deps.add({ source = "nielsdekker/detekt.nvim", name = "detekt" })

    require("detekt").setup({
        detekt_exec = "detekt",
        baseline_names = { "detekt-baseline.xml" },
        log_level = vim.log.levels.INFO
    })
end)
