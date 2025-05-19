--- @type MiniDep
return {
    source = "mini.nvim",
    later = function()
        local separators = {
            triangle = { A = "", B = "", C = "", D = "" }
        }

        local devInfoHl = "MiniStatusLineDevinfo"
        local fileNameHl = "MiniStatuslineFilename"

        local altModeTable = {}
        local rainbowSep = ""

        --- @param hlA string
        --- @param hlB string
        --- @return string
        local function getOrCreateAltMode(hlA, hlB)
            local altHi = hlA .. "_" .. hlB .. "_alt"
            if altModeTable[altHi] == nil then
                -- Create the highlight
                local a = vim.api.nvim_get_hl(0, { name = hlA })
                local b = vim.api.nvim_get_hl(0, { name = hlB })

                vim.api.nvim_set_hl(0, altHi, {
                    fg = a.bg,
                    bg = b.bg,
                })

                altModeTable[altHi] = true
            end

            return altHi
        end

        --- @param hl string
        --- @param sep string
        --- @return string
        local function sepStr(hl, sep)
            return string.format("%%#%s#%s", hl, sep)
        end

        --- @param hlA string
        --- @param hlB string
        --- @param sepA string
        --- @param sepB string
        --- @return string
        local function getOrCreateRainbowSep(hlA, hlB, sepA, sepB)
            if rainbowSep ~= "" then
                -- Already created so no need to recreate
                return rainbowSep
            end

            local palette = require("rose-pine.palette")
            local a = vim.api.nvim_get_hl(0, { name = hlA })
            local b = vim.api.nvim_get_hl(0, { name = hlB })

            -- Create some highlight groups
            vim.api.nvim_set_hl(0, "MiniStatuslineRainbowA", { bg = a.bg, fg = palette.rose })
            vim.api.nvim_set_hl(0, "MiniStatuslineRainbowB", { bg = palette.rose, fg = palette.pine })
            vim.api.nvim_set_hl(0, "MiniStatuslineRainbowC", { bg = palette.pine, fg = palette.love })
            vim.api.nvim_set_hl(0, "MiniStatuslineRainbowD", { fg = palette.love, bg = b.bg })

            return
                sepStr("MiniStatuslineRainbowA", sepA)
                .. sepStr("MiniStatuslineRainbowB", sepA)
                .. sepStr("MiniStatuslineRainbowC", sepA)
                .. sepStr("MiniStatuslineRainbowD", sepB)
                .. sepStr(hlB, "")
        end

        --- When switching between dark and light mode the alt modes need to be
        --- recalculated.
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                altModeTable = {}
                rainbowSep = ""
            end
        })

        require("mini.statusline").setup({
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
                        {
                            hl = mode_hl,
                            strings = {
                                search,
                                mode,
                                sepStr(getOrCreateAltMode(mode_hl, devInfoHl), separators.triangle.A)
                            }
                        },
                        {
                            hl = devInfoHl,
                            strings = {
                                git,
                                diagnostics,
                                sepStr(
                                    getOrCreateAltMode(devInfoHl, fileNameHl),
                                    separators.triangle.A
                                )
                            }
                        },
                        '%<', -- Mark general truncate point
                        { hl = fileNameHl, strings = { filename } },
                        '%=', -- End left alignment
                        {
                            hl = fileNameHl,
                            strings = {
                                getOrCreateRainbowSep(
                                    fileNameHl,
                                    devInfoHl,
                                    separators.triangle.B,
                                    separators.triangle.C)
                            }
                        },
                        { hl = devInfoHl,  strings = { fileinfo } },
                    })
                end
            }
        })
    end
}
