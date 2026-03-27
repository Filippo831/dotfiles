-- -- Attach lsp
local autocmd = vim.api.nvim_create_autocmd
autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        -- Remaps
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>fl', function() vim.lsp.buf.format { async = true } end, opts)
        vim.keymap.set('v', '<space>fl', function() vim.lsp.buf.format { async = true } end, opts)

        vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

        vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("v", "<leader>ga", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end,
})

-- Virtual text
vim.diagnostic.config({ virtual_text = true, severity_sort = true })

vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                -- 1. Disable the heavy/slow legacy linters
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },

                -- 2. Use Ruff for lightning-fast linting instead
                -- (Requires: pip install python-lsp-ruff)
                pylsp_ruff = { enabled = true },

                -- 3. Optimize Jedi (Completion & Navigation)
                jedi_completion = {
                    fuzzy = true,
                    include_params = true,
                },

                -- 4. Disable Rope unless you specifically need its heavy refactoring
                -- It often causes lag by indexing the entire project background
                rope_autoimport = { enabled = false },
                rope_completion = { enabled = false },
            }
        }
    }
})

vim.lsp.config('jdtls', {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-Xms1g', -- Start with 1GB RAM (prevents constant resizing)
        '-Xmx2g', -- Limit to 2GB (prevents swapping)
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        -- Performance boost: Use the G1 Garbage Collector
        '-XX:+UseG1GC',
        '-XX:+UseStringDeduplication',

        -- The actual path to your jdtls jar and workspace
        '-jar', '~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_VERSION.jar',
        '-configuration', '/path/to/config_linux',
        '-data', workspace_dir
    }
})
