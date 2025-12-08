local icons = {
    git = "",
    err = "",
    warn = "",
    border_left = "",
    border_right = "",
    triangle = "",
}

local groups = {
    -- Small groups
    default = "StatusLine",
    git = "StatusLineGit",
    info = "StatusLineInfo",

    -- Mode switching
    mode = "StatusLineMode",
    mode_normal = "StatusLineModeNormal",
    mode_visual = "StatusLineModeVisual",
    mode_select = "StatusLineModeSelect",
    mode_insert = "StatusLineModeInsert",

    -- Diagnostics
    diag_errors = "StatusLineDiagnosticErrors",
    diag_warnings = "StatusLineDiagnosticWarnings",
    diag_seperator = "StatusLineDiagnosticSeparator",
}

-- Renders the given string with the highlight
local function with_hl(s, hl)
    return "%#" .. hl .. "#" .. s
end

-- Renders the string and add borders to the left and right of it.
local function with_border(s, hl)
    return " "
        .. with_hl(icons.border_left, hl .. "Inverse")
        .. with_hl(s, hl)
        .. with_hl(icons.border_right, hl .. "Inverse")
        .. " "
end

--- Creates a mode block to show whether or not we are in insert mode
local function get_mode()
    local modes = {
        ["n"] = { text = "Normal", hl = groups.mode_normal },
        ["v"] = { text = "Visual", hl = groups.mode_visual },
        ["V"] = { text = "Visual", hl = groups.mode_visual },
        -- Matches ^V
        ["\22"] = { text = "Visual", hl = groups.mode_visual },
        ["s"] = { text = "Select", hl = groups.mode_select },
        ["S"] = { text = "Select", hl = groups.mode_select },
        -- Matches ^S
        ["\19"] = { text = "Select", hl = groups.mode_select },
        ["i"] = { text = "Insert", hl = groups.mode_insert },
        ["R"] = { text = "Replace", hl = groups.mode },
        ["c"] = { text = "Command", hl = groups.mode },
        ["r"] = { text = "Prompt", hl = groups.mode },
        ["!"] = { text = "Shell", hl = groups.mode },
        ["t"] = { text = "Terminal", hl = groups.mode },
    }

    local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 2)
    local m = modes[mode]

    if m ~= nil then
        return with_border(m.text, m.hl)
    else
        return with_border(mode, groups.mode)
    end
end

--- Returns the git branch
local function get_git_branch_name()
    local branch_name = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

    if branch_name ~= "" then
        return with_hl(icons.git .. " " .. branch_name, groups.git)
    else
        return ""
    end
end

--- Diagnostics from the LSP and other thingies that set diagnostics
local function get_diagnostics()
    local error_count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
    local warning_count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))

    if error_count ~= 0 and warning_count ~= 0 then
        return " "
            .. with_hl(icons.border_left, groups.diag_errors .. "Inverse")
            .. with_hl(icons.err .. " " .. error_count, groups.diag_errors)
            .. with_hl(icons.triangle, groups.diag_seperator)
            .. with_hl(icons.warn .. " " .. warning_count, groups.diag_warnings)
            .. with_hl(icons.border_right, groups.diag_warnings .. "Inverse")
            .. " "
    elseif error_count ~= 0 then
        return with_border(icons.err .. " " .. error_count, groups.diag_errors)
    elseif warning_count ~= 0 then
        return with_border(icons.warn .. " " .. warning_count, groups.diag_warnings)
    else
        return ""
    end
end

local function get_cursor_info()
    return with_border("[l:%l c:%c]", groups.info)
end

StatusLine = function()
    return table.concat({
        get_mode(),
        get_diagnostics(),
        get_git_branch_name(),
        with_hl(" %f", groups.default),
        -- Moves to the end
        "%=",
        get_cursor_info()
    })
end

vim.o.statusline = '%!v:lua.StatusLine()'
