--- @type MiniDep
return {
    source = "EdenEast/nightfox.nvim",
    now = function()
        require("nightfox").setup({
            options = {
                styles = {
                    comments = "italic",
                }
            }
        })

        local dark_theme = "carbonfox"
        local light_theme = "dayfox"
        local current_theme = ""

        vim.api.nvim_create_autocmd("OptionSet", {
            pattern = "background",
            callback = function()
                if vim.o.background == "light" and current_theme ~= light_theme then
                    current_theme = light_theme
                    vim.cmd.colorscheme(light_theme)
                end
                if vim.o.background == "dark" and current_theme ~= dark_theme then
                    current_theme = dark_theme
                    vim.cmd.colorscheme(dark_theme)
                end
            end
        })
        -- Make this the default theme
    end
}
