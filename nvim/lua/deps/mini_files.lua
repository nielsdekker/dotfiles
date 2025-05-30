--- @type MiniDep
return {
    source = "mini.nvim",
    later = function()
        -- Mini files
        require("mini.files").setup({
            windows = {
                preview = true,
                width_preview = 50,
            },
            mappings = {
                close = "q",
                go_in = "L",
                go_in_plus = "l"
            },
        })
    end
}
