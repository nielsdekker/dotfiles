local function setup_mini_completion()
  local completion = require("mini.completion")

  completion.setup({
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

        -- Fix for specific issue with typescript completion adding extra dots
        -- for some reason.
        -- https://github.com/echasnovski/mini.nvim/issues/306
        for _, item in ipairs(result) do
          local new_text = (item.textEdit or {}).newText
          if type(new_text) == 'string' then
            item.textEdit.newText = new_text:gsub("^%.+", '')
          end
        end

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
    }
  })
end

local function setup_mini_pick()
  local pick = require("mini.pick")
  local visits = require("mini.visits")

  pick.setup({
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

      -- This custom thingy allows you to press C-d to delete the currently
      -- highlighted item from the matches view. When this is the "visits"
      -- picker it will also remove the item from the visits list.
      mini_pick_delete = {
        char = '<C-d>',
        func = function()
          if (pick.is_picker_active() == false) then
            return;
          end

          local opts_source = pick.get_picker_opts().source
          local matches = pick.get_picker_matches()

          -- For the visits picker we also remove the match from the state
          if (string.find(opts_source.name, "Visit") == 1) then
            visits.remove_path(matches.current, opts_source.cwd)
          end

          -- Update the active picker
          table.remove(matches.all, matches.current_ind)
          pick.set_picker_items(matches.all)
        end
      },
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
