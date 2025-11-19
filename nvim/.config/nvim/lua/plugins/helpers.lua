local harpoon_keys = {
    { "<leader>a", function() require("harpoon.mark").add_file() end },
    { "<leader>o", function() require("harpoon.ui").toggle_quick_menu() end },
    { "<C-h>",     function() require("harpoon.ui").nav_file(1) end },
    { "<C-t>",     function() require("harpoon.ui").nav_file(2) end },
    { "<C-n>",     function() require("harpoon.ui").nav_file(3) end },
    { "<C-s>",     function() require("harpoon.ui").nav_file(4) end },
    { "<C-A-h>",   function() require("harpoon.ui").nav_file(5) end },
    { "<C-A-t>",   function() require("harpoon.ui").nav_file(6) end },
    { "<C-A-n>",   function() require("harpoon.ui").nav_file(7) end },
    { "<C-A-s>",   function() require("harpoon.ui").nav_file(8) end },
}

local function indent_blankline_config()
    require('ibl').setup {
        whitespace = {
            -- highlight = highlight,
            remove_blankline_trail = false,
        },
        scope = { enabled = false },
    }
end

return {
    -- Comment
    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    },

    -- Autopairs brackets

    -- Undotree
    "mbbill/undotree",

    --Zen mode
    "folke/zen-mode.nvim",

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        keys = harpoon_keys,
    },

    -- Indentation lines
    {
        "lukas-reineke/indent-blankline.nvim",
        config = indent_blankline_config,
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
    "j-hui/fidget.nvim",

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
}
