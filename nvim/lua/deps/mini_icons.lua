--- @type MiniDep
return {
    source = "mini.nvim",
    now = function()
        local icons = require("mini.icons")

        icons.setup()
        icons.tweak_lsp_kind("replace")
    end
}
