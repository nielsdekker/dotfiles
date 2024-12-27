local tokyo = require("tokyonight")

tokyo.setup({
    style = "moon",
    light_style = "day",
    styles = {
        comments = { italic = true }
    },
    on_highlights = function(hi, co)
        hi.ColorColumn = {
            bg = co.bg_highlight
        }
    end
})

vim.cmd("colorscheme tokyonight")
