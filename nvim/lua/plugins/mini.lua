local completion = require("mini.completion")
local files = require("mini.files")
local pick = require("mini.pick")
local starter = require("mini.starter");
local statusline = require("mini.statusline")
local surround = require("mini.surround")
local notify = require("mini.notify")
local git = require("mini.git")

local function setup_mini_completion()
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
  files.setup({
    windows = {
      preview = true,
      width_preview = 50,
    },
    mappings = {
      close = "q",
      go_in = "L",
      go_in_plus = "l"
    },
    content = { prefix = function() end }
  })
end

local function setup_mini_pick()
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
  starter.setup()
end

local function setup_mini_statusline()
  statusline.setup({
    use_icons = false,
    set_vim_settings = false,
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
        local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
        local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
        local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
        local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

        return MiniStatusline.combine_groups({
          { hl = mode_hl,                 strings = { mode } },
          { hl = 'MiniStatuslineDevinfo', strings = { diagnostics } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineFilename', strings = { filename } },
          '%=', -- End left alignment
          { hl = mode_hl,                  strings = { search } },
          { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        })
      end
    }
  })
end

local function setup_mini_surround()
  surround.setup()
end

local function setup_mini_notify()
  notify.setup({})
end

local function setup_mini_git()
  git.setup()
end

setup_mini_completion()
setup_mini_files()
setup_mini_notify()
setup_mini_pick()
setup_mini_starter()
setup_mini_git()
setup_mini_statusline()
setup_mini_surround()
