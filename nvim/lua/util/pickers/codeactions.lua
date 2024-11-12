---@return table<integer, { text: string, trigger: fun()}>?
local function getCodeActions()
    local bufnr = vim.api.nvim_get_current_buf()
    local params = vim.lsp.util.make_range_params()
    params.context = {
        triggerKind = vim.lsp.protocol.CodeActionTriggerKind.Invoked,
        diagnostics = vim.lsp.diagnostic.get_line_diagnostics(),
    }
    local data = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)

    if data == nil then
        return nil
    end

    local result = {}
    for clientId, codeActions in pairs(data) do
        if codeActions.result ~= nil then
            for _, it in ipairs(codeActions.result) do
                local mappedAction = {
                    text = it.title,
                    trigger = function()
                        local client = assert(vim.lsp.get_client_by_id(clientId))
                        if it.edit then
                            vim.lsp.util.apply_workspace_edit(it.edit, client.offset_encoding)
                        end
                        if it.command then
                            vim.lsp.buf_request(bufnr, "workspace/executeCommand", it)
                        end
                    end
                }

                table.insert(result, mappedAction)
            end
        end
    end

    return result
end

return {
    getCodeActions = getCodeActions
}
