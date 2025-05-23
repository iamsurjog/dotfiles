return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.surround").setup()
        require("mini.ai").setup()
        require("mini.pairs").setup()
        -- require("mini.indentscope").setup({
        --     symbol = "|",
        -- })
        require("mini.comment").setup()
        require("mini.files").setup()
        require("mini.move").setup()

        vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open()<CR>', {desc = "Open mini files"})
    end
}


