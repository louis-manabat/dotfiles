return {
  "rebelot/heirline.nvim",
  lazy = false,

  opts = {
    statusline = {},
    winbar = {},
    tabline = {},
    statuscolumn = {},
  },

  config = function(_, opts)
    require("heirline").setup(opts)
  end,
}
