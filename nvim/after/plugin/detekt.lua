require("mini.deps").later(function()
    require("detekt").setup({
        root_markers = { "detekt.yml", "detekt.yaml" }
    })
end)
