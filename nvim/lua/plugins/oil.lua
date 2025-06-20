return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set('n', '-', '<CMD>Oil<CR>', {desc = "Open parent directory"})
        require("oil").setup({
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            }
        })
end,
}
