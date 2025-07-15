--- @type MiniDep
return {
    source = "folke/snacks.nvim",
    now = function()
        local snacks = require('snacks')
        snacks.setup({
            styles = { notification = { border = "solid" } },
            explorer = { enabled = true },
            statuscolumn = { enabled = true },
            picker = {
                enabled = true,
                layout = "ivy",
                sources = {
                    explorer = {
                        hidden = true,
                        ignored = true,
                        layout = "top",
                        auto_close = true,
                    }
                },
            },
            indent = {
                only_scope = true,
                animate = { enabled = false },
            },
            notifier = { enabled = true },
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { section = "keys",  gap = 1, padding = 1 },
                    {
                        pane = 2,
                        desc = "Browse repo",
                        icon = " ",
                        padding = 1,
                        key = "b",
                        action = function() snacks.gitbrowse() end
                    },
                    function()
                        local in_git = snacks.git.get_root() ~= nil

                        local cmds = { {
                            icon = " ",
                            title = "Open PR's",
                            cmd = "gh pr list -L 3",
                            key = "P",
                            action = function()
                                vim.fn.jobstart("gh pr list --web", { detach = true })
                            end,
                            height = 7,
                        }, {
                            icon = " ",
                            title = "git status",
                            cmd = "git --no-pager diff --stat -B -M -C",
                            height = 10,
                        } }

                        return vim.tbl_map(function(cmd)
                            return vim.tbl_extend("force", {
                                pane = 2,
                                section = "terminal",
                                enabled = in_git,
                                padding = 2,
                                border = "none",
                                ttl = 5 * 60,
                                indent = 3,
                            }, cmd)
                        end, cmds)
                    end
                }
            },
        });
    end,
}
