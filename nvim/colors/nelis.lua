-- Small tweaks to the default color scheme.

-- Reset the colors
if vim.g.colors_name then
    vim.cmd("hi clear")
end

vim.g.colors_name = "nelis"

---@diagnostic disable-next-line: duplicate-doc-alias
---@alias palette ({group: string, hl: vim.api.keyset.highlight})

-- Check gui-colors for the default color names and `highlight_group.c` for the
-- default values.
local palette = {
    ---@type palette[]
    light = {
        { group = "Normal",      hl = { fg = "NvimDarkGrey2", bg = "NONE" } },
        { group = "Statement",   hl = { fg = "NvimDarkBlue", bold = true } },
        { group = "Comment",     hl = { fg = "NvimDarkGrey4", italic = true } },
        { group = "ColorColumn", hl = { bg = "NvimLightGrey3" } },
        { group = "Constant",    hl = { fg = "NvimDarkMagenta" } },
        { group = "PreProc",     hl = { fg = "NvimDarkYellow" } },
        { group = "Type",        hl = { italic = true, fg = "NvimDarkGrey2" } },
    },
    ---@type palette[]
    dark = {
        { group = "Normal",      hl = { fg = "NvimLightGrey2", bg = "NONE" } },
        { group = "Statement",   hl = { fg = "NvimLightBlue", bold = true } },
        { group = "Comment",     hl = { fg = "NvimLightGrey4", italic = true } },
        { group = "ColorColumn", hl = { bg = "NvimDarkGrey3" } },
        { group = "Constant",    hl = { fg = "NvimLightMagenta" } },
        { group = "PreProc",     hl = { fg = "NvimLightYellow" } },
        { group = "Type",        hl = { italic = true, fg = "NvimLightGrey2" } },
    },
}

---@param p palette[]
local function load_palette(p)
    for _, v in pairs(p) do
        vim.api.nvim_set_hl(0, v.group, v.hl)
    end
end

-- Use an auto command so the colors can be updated based on dark/light mode of
-- the OS.
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        -- Make sure this is the active color scheme
        if vim.g.colors_name ~= "nelis" then
            return
        end

        if vim.o.background == "dark" then
            load_palette(palette.dark)
        else
            load_palette(palette.light)
        end
    end
})
