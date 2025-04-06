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
            end
        },
    },
})
