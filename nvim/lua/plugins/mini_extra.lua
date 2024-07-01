local overseer = require("overseer")
overseer.setup()

local function miniPickOverseer()
  local pick = require("mini.pick")

  overseer.template.list({
    dir = vim.fn.getcwd()
  }, function(items)
    vim.tbl_map(function(it)
      it.text = it.name
    end, items)

    pick.ui_select(
      items,
      {
        prompt = "Run task (overseer)"
      },
      function(chosen)
        if chosen == nil then
          return
        end

        overseer.open()
        overseer.run_template({
          name = chosen.name,
          prompt = "allow",
        })
      end
    )
  end)
end

-- This is a rewrite of how `vim.lsp.buf.code_action` works. It's not yet
-- perfect but is seems to work most of the time.
--
-- Another nice feature is that this also adds the `spellsuggest` data to the
-- list so the code actions can also be used to fix the spelling.
local function miniPickCodeAction()
  local bufnr = vim.api.nvim_get_current_buf()
  local params = vim.lsp.util.make_range_params()
  local pick = require("mini.pick")

  params.context = {
    triggerKind = vim.lsp.protocol.CodeActionTriggerKind.Invoked,
    diagnostics = vim.lsp.diagnostic.get_line_diagnostics(),
  }

  ---@diagnostic disable-next-line: unused-local
  vim.lsp.buf_request(bufnr, "textDocument/codeAction", params, function(err, results, context, config)
    if err ~= nil then
      print(err)
      return
    end

    if results ~= nil then
      vim.tbl_map(function(it)
        it.text = it.title
      end, results)
    else
      -- Use an empty list so we don't have to do all these nil checks
      results = {}
    end

    -- Also add spelling suggestions
    local wordUnderCursor = vim.fn.expand("<cWORD>")
    local suggestions = vim.tbl_map(
      function(it)
        return {
          spellsuggest = "spellsuggest",
          text = "Change spelling to \"" .. it .. "\"",
          newText = it,
        }
      end,
      vim.fn.spellsuggest(wordUnderCursor, 5)
    )

    local client = assert(vim.lsp.get_client_by_id(context.client_id))
    pick.ui_select(
      vim.tbl_deep_extend("keep", results, suggestions),
      {
        prompt = "Code actions"
      },
      function(chosen)
        if chosen == nil then
          return
        end

        if chosen.edit then
          vim.lsp.util.apply_workspace_edit(chosen.edit, client.offset_encoding)
        end
        if chosen.command then
          vim.lsp.buf_request(bufnr, "workspace/executeCommand", chosen)
        end
        if chosen.spellsuggest then
          local repl = vim.fn.substitute(vim.fn.expand("<cWORD>"), ".*", chosen.newText, "")
          vim.cmd("normal! diWi" .. repl)
        end
      end
    )
  end)
end

return {
  miniPickOverseer = miniPickOverseer,
  miniPickCodeAction = miniPickCodeAction,
}
