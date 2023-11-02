return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-dap.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      defaults = {
        path_display = { truncate = 8 },
        file_ignore_patterns = { "node_modules", "dist", "build", "target", "vendor", ".git" },
      }
    }

    telescope.load_extension("dap")
  end
}
