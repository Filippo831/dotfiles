local lsp_zero_dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

}

local function lsp_zero_config()
    local lsp_zero = require('lsp-zero')


    lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("v", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>fl", "<cmd>LspZeroFormat<CR>")
        vim.keymap.set("v", "<leader>fl", vim.lsp.buf.format)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
        vim.keymap.set("i", "<C-l>", vim.lsp.buf.signature_help, opts)
    end)

    lsp_zero.preset('recommendend')

    require('mason').setup({})
    require('mason-lspconfig').setup({
        ensure_installed = { 'efm', 'lua_ls', 'rust_analyzer', 'clangd' },
        handles = {
            lsp_zero.default_setup,
            lua_ls = function()
                local lua_opts = lsp_zero.nvim_lua_ls()
                require('lspconfig').lua_ls.setup(lua_opts)
            end,
        }
    })


    local luasnip = require("luasnip")
    local cmp = require("cmp")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp_zero.defaults.cmp_mappings({
        ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm(cmp_select),
    })



    lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    })




    -- Fix Undefined global "vim"
    lsp_zero.configure("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    })
    lsp_zero.configure("clangd")
    lsp_zero.configure("ts_ls")
    lsp_zero.configure("dockerls")
    lsp_zero.configure("bashls")
    lsp_zero.configure("asm_lsp", {
        settings = {
            filetypes = { "asm", "s", "vmasm" },
        }
    })

    lsp_zero.configure("pyright", {

        settings = {
            disable_organized_imports = true,
        }
    })

    lsp_zero.configure("ruff_lsp")


    lsp_zero.configure("ltex", {
        settings = {
            ltex = {
                language = "it",
            }
        }
    })

    lsp_zero.configure("dartls", {
        cmd = { "dart", "language-server", "protocol=lsp" }
    })

    lsp_zero.configure("rust_analyzer", {
        settings = {
            ["rust-analyzer"] = {
                procMacro = {
                    igored = {
                        leptos_macr = {
                            "server",
                            "component",
                        }
                    }
                },
            }
        }
    })

    -- setup nvim-cmp and luasnip
    cmp.setup({
        mapping = cmp_mappings,
        formatting = lsp_zero.cmp_format(),
    })


    -- setup lsp
    lsp_zero.setup()

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = true,
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
            -- Use `echo` in the command line instead of a floating window
            focusable = false,
            border = "none",
            height = 2
        }
    )


end

return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = lsp_zero_dependencies,
    config = lsp_zero_config,
}
