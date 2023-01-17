require'lualine'.setup{
    options = {
        theme = 'gruvbox',
        --theme = "gruvbox",
        section_separators = '',
        component_separators = '',
    },
    extensions = {
        "quickfix",
        "fugitive",
        "nvim-tree",
    }
}
