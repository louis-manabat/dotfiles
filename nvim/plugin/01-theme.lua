vim.pack.add({
    { src = "https://github.com/navarasu/onedark.nvim" }
})

require('onedark').setup({
    style = 'darker'
})

require('onedark').load()