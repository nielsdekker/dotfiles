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

return {
  codeActionsPicker = codeActionsPicker,
  overseerPicker = overseerPicker
}
