local icons = {
    git = "",
    err = "",
    warn = "",
    border_left = "",
    border_right = "",
}

-- Renders the given string with the highlight
local function with_hl(s, hl)
    return "%#" .. hl .. "#" .. s
end

-- Renders the string and add borders to the left and right of it.
local function with_border(s, hl)
    return with_hl(icons.border_left, hl .. "Inverse")
        .. with_hl(s, hl)
        .. with_hl(icons.border_right, hl .. "Inverse")
end

--- Creates a mode block to show whether or not we are in insert mode
local function get_mode()
    local modes = {
        ["n"] = { text = "Normal", hl = "StatusLineModeNormal", hl_inverse = "StatusLineModeNormalInverse" },
        ["v"] = { text = "Visual", hl = "StatusLineModeVisual", hl_inverse = "StatusLineModeVisualInverse" },
        ["V"] = { text = "Visual", hl = "StatusLineModeVisual", hl_inverse = "StatusLineModeVisualInverse" },
        -- Matches ^V
        ["\22"] = { text = "Visual", hl = "StatusLineModeVisual", hl_inverse = "StatusLineModeVisualInverse" },
        ["s"] = { text = "Select", hl = "StatusLineModeSelect", hl_inverse = "StatusLineModeSelectInverse" },
        ["S"] = { text = "Select", hl = "StatusLineModeSelect", hl_inverse = "StatusLineModeSelectInverse" },
        -- Matches ^S
        ["\19"] = { text = "Select", hl = "StatusLineModeSelect", hl_inverse = "StatusLineModeSelectInverse" },
        ["i"] = { text = "Insert", hl = "StatusLineModeInsert", hl_inverse = "StatusLineModeInsertInverse" },
        ["R"] = { text = "Replace", hl = "StatusLineMode", hl_inverse = "StatusLineModeInverse" },
        ["c"] = { text = "Command", hl = "StatusLineMode", hl_inverse = "StatusLineModeInverse" },
        ["r"] = { text = "Prompt", hl = "StatusLineMode", hl_inverse = "StatusLineModeInverse" },
        ["!"] = { text = "Shell", hl = "StatusLineMode", hl_inverse = "StatusLineModeInverse" },
        ["t"] = { text = "Terminal", hl = "StatusLineMode", hl_inverse = "StatusLineModeInverse" },
    }

    local mode = string.sub(vim.api.nvim_get_mode().mode, 1, 2)
    local m = modes[mode]

    if m ~= nil then
        return " " .. with_border(m.text, m.hl) .. " "
    else
        return " " .. with_border(mode, "StatusLineMode") .. " "
    end
end

--- Returns the git branch
local function get_git_branch_name()
    local branch_name = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

    if branch_name ~= "" then
        return with_hl(icons.git .. " " .. branch_name, "StatusLineGit")
    else
        return ""
    end
end

--- Diagnostics from the LSP and other thingies that set diagnostics
local function get_diagnostics()
    local error_count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }))
    local warning_count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }))

    local errors = ""
    if error_count ~= 0 then
        errors = with_border(icons.err .. " " .. error_count, "StatusLineErrors") .. " "
    end

    local warnings = ""
    if warning_count ~= 0 then
        warnings = with_border(icons.warn .. " " .. warning_count, "StatusLineWarnings") .. " "
    end

    return errors .. warnings
end

StatusLine = function()
    return table.concat({
        "%#StatusLine#",
        get_mode(),
        get_diagnostics(),
        get_git_branch_name(),
        "%#StatusLine# %f",
        "%=",
        "[l:%l c:%c] "
    })
end

vim.o.statusline = '%!v:lua.StatusLine()'
