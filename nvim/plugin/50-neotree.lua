vim.pack.add({
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" }
})

-- Triggering neo-tree via keybind
vim.keymap.set("n", "\\", "<cmd>Neotree toggle<CR>")

require('neo-tree').setup({

})