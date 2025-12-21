return {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        theme = "hyper"
    },
    config = function(_, opts)
        require("dashboard").setup(opts)
    end,
}
