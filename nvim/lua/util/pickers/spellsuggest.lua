---@return table<integer, { text: string, trigger: fun()}>
local function getSpellSuggestions()
    local wordUnderCursor = vim.fn.expand("<cWORD>")
    local suggestions = vim.tbl_map(
        function(it)
            return {
                action = "spellsuggest",
                text = "Change spelling to \"" .. it .. "\"",
                trigger = function()
                    local repl = vim.fn.substitute(vim.fn.expand("<cWORD>"), ".*", it, "")
                    vim.cmd("normal! diWi" .. repl)
                end
            }
        end,
        vim.fn.spellsuggest(wordUnderCursor, 3)
    )

    return suggestions
end

return {
    getSpellSuggestions = getSpellSuggestions
}
