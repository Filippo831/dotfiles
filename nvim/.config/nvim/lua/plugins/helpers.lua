return {
    -- Undotree
    "mbbill/undotree",

    --Zen mode
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 1,
            },
            plugins = {
                tmux = {
                    enabled = true,
                },
            }
        }
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>o", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
        end,

        settings = {
            save_on_toggle = true,
            sync_on_ui_closed = true,
        }
    },


    -- Markdown
    ({
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    }),
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },
    -- Change theme based on system theme
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
            end,
            -- update_interval = 3000,
            fallback = "dark"
        },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require("tiny-inline-diagnostic").setup({
                options = {
                    multilines = {
                        enabled = true,
                    },
                },
            })
            vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
        end,
    },
    -- {
    --     "amitds1997/remote-nvim.nvim",
    --     version = "*",                       -- Pin to GitHub releases
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",         -- For standard functions
    --         "MunifTanjim/nui.nvim",          -- To build the plugin UI
    --         "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    --     },
    --     config = true,
    -- },

    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                multiline_threshold = 4,
            })
        end
    },

    -- profiler
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            profiler = { enabled = true },
            indent = {
                enabled = true,
                hl = "SnacksIndent1",
                animate = { enabled = false },
            }
        },
        keys = {
            { "<leader>ps", function() Snacks.profiler.scratch() end,   desc = "Profiler Scratch Bufer" },
            { "<leader>pp", function() Snacks.profiler.toggle() end,    desc = "Toggle profiler" },
            { "<leader>ph", function() Snacks.profiler.highlight() end, desc = "Toggle profiler highlight" },

        }
    },
    -- java
    'mfussenegger/nvim-jdtls'
}
