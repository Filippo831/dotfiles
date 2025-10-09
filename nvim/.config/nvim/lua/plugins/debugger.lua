local c_configuration = function (dap, vim)
    dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
    }
    dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = {}, -- provide arguments if needed
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
      local name = vim.fn.input('Executable name (filter): ')
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}'
  }
}
    
end

return {
    { "rcarriga/nvim-dap-ui", enabled = false },
    {
        "miroshQa/debugmaster.nvim",
        -- osv is needed if you want to debug neovim lua code. Also can be used
        -- as a way to quickly test-drive the plugin without configuring debug adapters
        dependencies = { "mfussenegger/nvim-dap", "jbyuki/one-small-step-for-vimkind", },
        config = function()
            local dm = require("debugmaster")
            -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
            -- Alternative keybindings to "<leader>d" could be: "<leader>m", "<leader>;"
            vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true })
            -- If you want to disable debug mode in addition to leader+d using the Escape key:
            -- vim.keymap.set("n", "<Esc>", dm.mode.disable)
            -- This might be unwanted if you already use Esc for ":noh"
            vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

            dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
            local dap = require("dap")
            -- Configure your debug adapters here
            -- Https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

            -- gdb configuration (c, c++)
            c_configuration(dap, vim)
        end
    }
}
