return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ensure_installed = {"prettierd"}
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup({
                ensure_installed = {"eslint", "lua_ls", "pyright", "clangd",
                    "html", "cssls", "ts_ls", "tailwindcss", "markdown_oxide" },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = lsp_capabilities,
                        }) --automatically setup the lsp servers!!!
                    end,
                    --put specific server handlers down here
                    ["clangd"] = function()
                        require("lspconfig").clangd.setup {
                            cmd = {
                                "clangd",
                                "--fallback-style=webkit"
                            }
                        }
                    end
                },

            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", function()
                        vim.lsp.buf.hover()
                    end, opts)
                    -- vim.keymap.set("n", "gd", function()
                    --     vim.lsp.buf.definition()
                    -- end, opts)
                    vim.keymap.set("n", "gD", function()
                        vim.lsp.buf.declaration()
                    end, opts)
                    -- vim.keymap.set("n", "gi", function()
                    --     vim.lsp.buf.implementation()
                    -- end, opts)
                    -- vim.keymap.set("n", "go", function()
                    --     vim.lsp.buf.type_definition()
                    -- end, opts)
                    -- vim.keymap.set("n", "gr", function()
                    --     vim.lsp.buf.references()
                    -- end, opts)
                    vim.keymap.set("n", "gs", function()
                        vim.lsp.buf.signature_help()
                    end, opts)
                    vim.keymap.set("n", "<F2>", function()
                        vim.lsp.buf.rename()
                    end, { desc = "Rename" })
                    vim.keymap.set("n", "<F4>", function()
                        vim.lsp.buf.code_action()
                    end, opts)
                end,
})
        end,
    },
}
