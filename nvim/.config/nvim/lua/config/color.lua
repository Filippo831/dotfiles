vim.opt.background = "dark"

-- set colorscheme
vim.cmd.colorscheme("gruvbox");

-- set comments in italic
-- vim.cmd("highlight Comment cterm=italic gui=italic");

-- highlight the current line number
vim.opt.cursorline = true
-- vim.api.nvim_set_hl(0, "Cursorline", { ctermbg = 0 })
--
vim.api.nvim_set_hl(0, "TreesitterContext", { 
    bg = "NONE", 
    blend = 10 
})

vim.api.nvim_set_hl(0, "TreesitterContextBottom", { 
    bg = "NONE", 
    underline = true, 
    sp = "#504945",
    blend = 10
})
