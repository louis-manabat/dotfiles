local _plugin = {
    "akinsho/toggleterm.nvim",
    version = "v2.7.1",
    lazy = false,
    enabled = true
}

_plugin.config = function()
    require("toggleterm").setup({
        -- Add your custom options here, e.g.
        -- size = 20,
        -- open_mapping = [[<c-\>]],
        -- direction = "float",
    })
end

return _plugin
