local tokyo = require("tokyonight")

tokyo.setup({
    style = "moon",
    light_style = "day",
    transparent = true,
    styles = {
        comments = { italic = true }
    },
    on_highlights = function(hi, co)
        hi.ColorColumn = {
            bg = co.bg_highlight
        }
        hi.WinSeparator = {
            fg = co.foreground
        }
    end
})

vim.cmd("colorscheme tokyonight")
