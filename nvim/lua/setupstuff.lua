vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4
require('hlslens').setup()
require('telescope').setup{
    pickers={
    diagnostics = {
        theme = "dropdown",
    },
    find_files = {
        hidden= true
    }
    },
    defaults = {
        mappings ={
                i={
                    ["<C-y>"] = "which_key",
                    ["C-j"] = "move_selection_next",
                    ["C-k"] = "move_selection_previous"
            },
            n={
                ["<C-c>"] = "close"
            }
        }
    }
}



require('lualine').setup{
options = {theme = 'melange'}
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript", "typescript","lua","python"}, -- Add other languages if needed
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}

require('trouble').setup {}

local autosave = vim.api.nvim_create_augroup("autosave", { clear = true })

vim.api.nvim_create_autocmd({"FocusLost", "BufLeave"}, {
  group = autosave,
  pattern = "*",
  callback = function()

      if vim.bo.modified and not vim.bo.readonly and (vim.bo.buftype == "" ) then
          print("file has been modified")
          vim.cmd("write")
          vim.cmd("silent! Neoformat")
      end
  end,
})

local ui = require "dapui"
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap = require("dap")


dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}


dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
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
  },
}

vim.keymap.set("n","<space>b",dap.toggle_breakpoint)
vim.keymap.set("n","<space>gb",dap.run_to_cursor)

vim.keymap.set("n","<F1>",dap.continue)


vim.keymap.set("n","<space>?",function ()
    require('dapui').eval(nil,{enter=true})
end)

dap.listeners.before.attach.dapui_config = function ()
    ui.open()
end

dap.listeners.before.launch.dapui_config = function ()
    ui.open()
end

dap.listeners.before.event_terminated.dapui_config = function ()
    ui.close()
end

dap.listeners.before.event_exited.dapui_config = function ()
    ui.close()
end
