local function copilot_config()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_enabled = false
    vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
end 

return {
    "tpope/vim-fugitive",
    {
        "github/copilot.vim",
        config = copilot_config
    }
}
