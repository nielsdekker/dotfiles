local statusline = require("mini.statusline")

-- Mini pick
statusline.setup({
    use_icons = true,
    set_vim_settings = true,

    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git           = MiniStatusline.section_git({ trunc_width = 40 })
            local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
                { hl = mode_hl,                 strings = { search, mode } },
                { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
                '%<', -- Mark general truncate point
                { hl = "MiniStatuslineFilename", strings = { filename } },
                '%=', -- End left alignment
                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
            })
        end
    }
})
