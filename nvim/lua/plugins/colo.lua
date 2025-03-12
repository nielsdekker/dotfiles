---@diagnostic disable: unused-local

-- Palette, also see gui-colors
local blue = { dark = "NvimDarkBlue", light = "NvimLightBlue" }
local cyan = { dark = "NvimDarkCyan", light = "NvimLightCyan" }
local gray1 = { dark = "NvimDarkGray1", light = "NvimLightGray1" }
local gray2 = { dark = "NvimDarkGray2", light = "NvimLightGray2" }
local gray3 = { dark = "NvimDarkGray3", light = "NvimLightGray3" }
local gray4 = { dark = "NvimDarkGray4", light = "NvimLightGray4" }
local green = { dark = "NvimDarkGreen", light = "NvimLightGreen" }
local magenta = { dark = "NvimDarkMagenta", light = "NvimLightMagenta" }
local red = { d = "NvimDarkRed", light = "NvimLightRed" }
local yellow = { dark = "NvimDarkYellow", light = "NvimLightYellow" }

local function isDarkMode()
    return vim.o.background == "dark"
end

local function update(group, newValues)
    local hl = vim.api.nvim_get_hl(0, { name = group })
    local newHl = vim.tbl_extend("force", hl, newValues)
    vim.api.nvim_set_hl(0, group, newHl)
end

local function makeItalic(group)
    update(group, { italic = true })
end

local function updateGroup(group, dark, light)
    if isDarkMode() then
        update(group, dark)
    else
        update(group, light)
    end
end


-- Use an autocmd to prevent issues with the colorscheme switching between dark
-- and light mode depending on the current OS settings.
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        -- Tweaks to the color scheme
        makeItalic("Comment")
        makeItalic("Statement")

        updateGroup("ColorColumn", { bg = gray3.dark }, { bg = gray3.light })
        updateGroup("Constant", { fg = magenta.light }, { fg = magenta.dark })
    end
})

vim.cmd("colorscheme default")
