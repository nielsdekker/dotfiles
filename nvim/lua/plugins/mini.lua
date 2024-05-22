local function setup_mini_completion()
  local completion = require("mini.completion")

  completion.setup({
    window = {
      info = { height = 25, width = 80, border = "none" },
      signature = { height = 25, width = 80, border = "none" }
    },
    -- Fallback to files
    fallback_action = "<C-x><C-f>",
    lsp_completion = {
      process_items = function(items, base)
        local completionKind = vim.lsp.protocol.CompletionItemKind;
        local result = vim.tbl_filter(function(item)
          -- Remove text and snippet kinds
          return item.kind ~= completionKind.Text and item.kind ~= completionKind.Snippet
        end, items)

        -- Make sure the list is sorted
        table.sort(result, function(a, b)
          return (a.sortText or a.label) < (b.sortText or b.label)
        end)

        return completion.default_process_items(result, base)
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
    },
    content = { prefix = function() end }
  })
end

local function setup_mini_pick()
  local pick = require("mini.pick")

  pick.setup({
    source = {
      show = pick.default_show
    },
    mappings = {
      move_down = "<C-j>",
      move_up = "<C-k>",

      -- Custom mapping that sends all visible matches to the quickfix list and
      -- then opens it.
      quick_fix_add_all = {
        char = "<C-q>",
        func = function()
          if (pick.is_picker_active() == false) then
            return;
          end

          pick.default_choose_marked(
            pick.get_picker_matches().all
          )
          pick.stop()
          vim.cmd("copen")
        end
      },
    }
  })
end

local function setup_mini_starter()
  require("mini.starter").setup({});
end

local function setup_mini_statusline()
  require("mini.statusline").setup({
    use_icons = false
  })
end

local function setup_mini_surround()
  require("mini.surround").setup({})
end

local function setup_mini_jump2d()
  require("mini.jump2d").setup({})
  vim.api.nvim_set_hl(0, "MiniJump2dSpot", {
    fg = "#FF0000",
    bold = true,
  })
end

local function setup_mini_notify()
  require("mini.notify").setup({})
end

return {
  setup = function()
    setup_mini_completion()
    setup_mini_files()
    setup_mini_jump2d()
    setup_mini_notify()
    setup_mini_pick()
    setup_mini_starter()
    setup_mini_statusline()
    setup_mini_surround()
  end
}
