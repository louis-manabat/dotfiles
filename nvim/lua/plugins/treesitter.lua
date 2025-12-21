return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  lazy = false,

  opts = {
    ensure_installed = {
      "terraform",
      "bash",
      "json",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}