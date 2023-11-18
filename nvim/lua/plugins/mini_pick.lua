return {
  "echasnovski/mini.pick",
  dependencies = {
    "echasnovski/mini.extra",
    "echasnovski/mini.nvim",
  },
  config = function()
    local pick = require("mini.pick")
    pick.setup({
      mappings = {
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
}
