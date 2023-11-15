local nvimtree_remap = {
    {"<leader>e", ":NvimTreeToggle<CR>"},
}


local function nvimtree_config()
    require("nvim-tree").setup()
end

return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        keys = nvimtree_remap,
        config = nvimtree_config,
    }
}
