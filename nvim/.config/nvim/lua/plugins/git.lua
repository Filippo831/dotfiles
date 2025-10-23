local function copilot_config()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_enabled = false
    vim.api.nvim_set_keymap("i", "<C-s>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
end

local git_worktree_keys = {
    { "<leader>gwc", function() require("telescope").extensions.git_worktree.create_git_worktree() end },
    { "<leader>gws", function() require("telescope").extensions.git_worktree.git_worktrees() end },
}

return {
    "tpope/vim-fugitive",
    {
        "github/copilot.vim",
        config = copilot_config
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        keys = git_worktree_keys,
    },
}
