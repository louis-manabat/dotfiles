-- local _plugin = {
--     "navarasu/onedark.nvim",
--     lazy = false,
--     enabled = true
-- };

-- _plugin.config = function()
--     -- Setting up OneDark
--     require("onedark").setup({
--         style = "warmer"
--     });

--     -- OneDark will load on startup
--     require("onedark").load();
-- end;

-- return _plugin;

return {
  "navarasu/onedark.nvim",
  lazy = false,
  opts = {
    style = "warmer",
  },
  config = function(_, opts)
    require("onedark").setup(opts)
    require("onedark").load()
  end,
}
