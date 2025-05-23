return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({}),
            },
        },
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-p>", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
        vim.keymap.set("v", "<leader>ps", "y<ESC>:lua require('telescope.builtin').grep_string({ default_text = vim.fn.getreg('\"')})<CR>")

      require("telescope").load_extension("ui-select")
    end,
  },
}
