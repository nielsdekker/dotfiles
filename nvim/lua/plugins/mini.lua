local completion = require("mini.completion")
local files = require("mini.files")
local pick = require("mini.pick")
local starter = require("mini.starter");
local statusline = require("mini.statusline")
local surround = require("mini.surround")
local notify = require("mini.notify")
local icons = require("mini.icons")

-- Oneliner setups
starter.setup()
surround.setup({})
notify.setup({})
icons.setup()
icons.tweak_lsp_kind("replace")

-- Mini completion
completion.setup({
    window = {
        info = { height = 25, width = 80, border = "none" },
        signature = { height = 25, width = 80, border = "none" }
    },
    -- Fallback to files
    fallback_action = "<C-x><C-f>",
    lsp_completion = {
        process_items = function(items, base)
            local completionKind = vim.lsp.protocol.CompletionItemKind;
            local result = vim.tbl_filter(function(item)
                -- Remove text and snippet kinds
                return item.kind ~= completionKind.Text and item.kind ~= completionKind.Snippet
            end, items)

            -- Make sure the list is sorted
            table.sort(result, function(a, b)
                return (a.sortText or a.label) < (b.sortText or b.label)
            end)

            return completion.default_process_items(result, base)
        end
    }
})

-- Mini files
files.setup({
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

-- Mini pick
pick.setup({
    source = {
        show = pick.default_show
    },
    mappings = {
        move_down = "<C-j>",
        move_up = "<C-k>",

        -- Custom mapping that sends all visible matches to the quickfix list and
        -- then opens it.
        quick_fix_add_all = {
            char = "<C-q>",
            func = function()
                if (pick.is_picker_active() == false) then
                    return;
                end

                pick.default_choose_marked(
                    pick.get_picker_matches().all
                )
                pick.stop()
                vim.cmd("copen")
            end
        },
    },
})

-- Mini status line
local function wrapHighlightGroup(name)
    local hl = vim.api.nvim_get_hl(0, { name = name })
    local hlName = name .. "Border"
    vim.api.nvim_set_hl(0, hlName, {
        foreground = hl.bg,
    })

    return hlName
end

local function wrapStart(tbl)
    if string.len(table.concat(tbl.strings, "")) == 0 then
        return tbl
    end
    local hlName = wrapHighlightGroup(tbl.hl)
    table.insert(tbl.strings, 1, string.format("  %%#%s#", tbl.hl))

    return {
        hl = hlName,
        strings = tbl.strings
    }
end

local function wrapEnd(tbl)
    if string.len(table.concat(tbl.strings, "")) == 0 then
        return tbl
    end
    local hlName = wrapHighlightGroup(tbl.hl)
    table.insert(tbl.strings, string.format("%%#%s#  ", hlName))

    return {
        hl = tbl.hl,
        strings = tbl.strings
    }
end

statusline.setup({
    use_icons = true,
    set_vim_settings = false,

    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
                wrapStart({ hl = mode_hl, strings = { search, mode } }),
                { hl = "MiniStatuslineDevinfo",  strings = { diagnostics } },
                '%<', -- Mark general truncate point
                { hl = "MiniStatuslineFilename", strings = { filename } },
                '%=', -- End left alignment
                wrapEnd({ hl = "MiniStatuslineFileinfo", strings = { fileinfo } }),
            })
        end
    }
})
