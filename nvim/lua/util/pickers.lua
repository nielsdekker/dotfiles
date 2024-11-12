local codeActionPickers = require("util.pickers.codeactions")
local overseerPickers = require("util.pickers.overseer")
local spellSuggestPickers = require("util.pickers.spellsuggest")

--- A simple default action to execute when an item is selected
--- @param action { text: string, trigger: fun() }
local function defaultAction(action)
    if action ~= nil then
        action.trigger()
    end
end

--- Triggers a picker window containing specific code actions and spell
--- suggestions if needed.
local function codeActionsPicker()
    local pick = require("mini.pick")
    local codeActions = codeActionPickers.getCodeActions()
    local spellSuggest = spellSuggestPickers.getSpellSuggestions()

    if codeActions == nil then
        codeActions = {}
    end

    -- Expand the code actions with the spell suggestions
    for _, it in pairs(spellSuggest) do
        table.insert(codeActions, it)
    end

    pick.ui_select(
        codeActions,
        { prompt = "Code actions" },
        defaultAction
    )
end

--- Opens a picker to see all the possible overseer templates that can be run
--- for the current workspace.
local function overseerPicker()
    local pick = require("mini.pick")
    overseerPickers.getOverseerTemplates(function(data)
        pick.ui_select(
            data,
            { prompt = "Run task" },
            defaultAction
        )
    end)
end

-- Mostly a copy-paste of the excellent mini.pick.builtins.buffers. The
-- difference is that this version shows relative path names if possible.
-- Buffers can be opened with a relative or absolute path and LSP's like to use
-- an absolute path and other pickers use a relative path. This became a bit of
-- a mess when opening the buffers view.
local function relativeBufferPicker()
    local pick = require("mini.pick")

    local buffers_output = vim.api.nvim_exec2("buffers", { output = true }).output
    local items = {}
    for _, l in ipairs(vim.split(buffers_output, '\n')) do
        local buf_str, name = l:match('^%s*%d+'), l:match('"(.*)"')
        local buf_id = tonumber(buf_str)

        local expanded = vim.fn.expand(name)
        local cwd = vim.fn.getcwd()
        if (string.find(expanded, cwd) ~= nil) then
            local item = {
                text = string.gsub(expanded, cwd .. "/", ""),
                bufnr = buf_id
            }
            table.insert(items, item)
        else
            local item = {
                text = name,
                bufnr = buf_id
            }
            table.insert(items, item)
        end
    end

    pick.start({
        source = {
            name = "Buffers",
            items = items,
        }
    })
end

return {
    codeActionsPicker = codeActionsPicker,
    overseerPicker = overseerPicker,
    relativeBufferPicker = relativeBufferPicker,
}
