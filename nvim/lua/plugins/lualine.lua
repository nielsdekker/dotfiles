return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "branch", "diff", "diagnostics" },
        lualine_b = {
          {
            "filename",
            file_status = true,
            path = 1
          }
        },
        lualine_y = { "encoding", "filetype" },
        lualine_z = { "location" },
      },
    })

    vim.o.laststatus = 3
  end
}
