return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },

  lazy = false,

  opts = {},

  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    -- Load fzf extension safely
    pcall(telescope.load_extension, "fzf")
  end,
}
