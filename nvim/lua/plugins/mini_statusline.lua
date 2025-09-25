--- @type MiniDep
return {
    source = "nvim-mini/mini.nvim",
    later = function()
        local devInfoHl = "MiniStatusLineDevinfo"
        local fileNameHl = "MiniStatuslineFilename"

        require("mini.statusline").setup({
            use_icons = true,
            set_vim_settings = true,

            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git           = MiniStatusline.section_git({ trunc_width = 40 })
                    local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                    local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
                    local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

                    return MiniStatusline.combine_groups({
                        {
                            hl = mode_hl,
                            strings = {
                                search,
                                mode,
                            }
                        },
                        {
                            hl = devInfoHl,
                            strings = {
                                git,
                                diagnostics,
                            }
                        },
                        '%<', -- Mark general truncate point
                        { hl = fileNameHl, strings = { filename } },
                    })
                end
            }
        })
    end
}
