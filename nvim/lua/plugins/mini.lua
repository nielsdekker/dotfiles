local function setup_mini_completion()
  require("mini.completion").setup({
    -- Fallback to files
    fallback_action = "<C-x><C-f>",
    lsp_completion = {
      process_items = function(items)
        local completionKind = vim.lsp.protocol.CompletionItemKind;
        local res = vim.tbl_filter(function(item)
          -- Remove text and snippet kinds
          return item.kind ~= completionKind.Text and item.kind ~= completionKind.Snippet
        end, items)

        table.sort(res, function(a, b) return (a.sortText or a.label) < (b.sortText or b.label) end)

        return res
      end
    }
  })
end

local function setup_mini_files()
  require("mini.files").setup({
    windows = {
      preview = true,
      width_preview = 50,
    },
    mappings = {
      close = "<ESC>",
      go_in = "L",
      go_in_plus = "l"
    }
  })
end

local function setup_mini_pick()
  local pick = require("mini.pick")
  pick.setup({
    mappings = {
      move_down = "<C-j>",
      move_up = "<C-k>",
      to_quick_fix = {
        char = "<C-q>",
        func = function()
          if (pick.is_picker_active() == false) then
            return;
          end

          -- Get all the matched items and send them to the quickfix list.
          -- Also make sure the picker is closed and the quickfix list
          -- focussed.
          pick.default_choose_marked(
            pick.get_picker_matches().all
          )
          pick.stop()
          vim.cmd("copen")
        end
      }
    }
  })
end

local function setup_mini_starter()
  require("mini.starter").setup({});
end

local function setup_mini_statusline()
  require("mini.statusline").setup({})
end

local function setup_mini_surround()
  require("mini.surround").setup({})
end

local function setup_mini_visits()
  require("mini.visits").setup({
    track = {
      event = ""
    }
  })
end

return {
  "echasnovski/mini.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    setup_mini_completion()
    setup_mini_files()
    setup_mini_pick()
    setup_mini_starter()
    setup_mini_statusline()
    setup_mini_surround()
    setup_mini_visits()
  end
}
