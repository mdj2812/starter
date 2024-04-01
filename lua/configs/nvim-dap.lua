local dap = require "dap"

dap.adapters.gdb = {
  id = "gdb",
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap" },
}

dap.adapters.codelldb = {
  id = "codelldb",
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}

dap.configurations.c = {
  {
    name = "Run executable (codelldb)",
    type = "codelldb",
    request = "launch",
    -- This requires special handling of 'run_last', see
    -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
    program = function()
      local path = vim.fn.input {
        prompt = "Path to executable: ",
        default = vim.fn.getcwd() .. "/",
        completion = "file",
      }
      return (path and path ~= "") and path or dap.ABORT
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
    breakpointMode = "file",
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false,
      },
    },
  },
  {
    name = "Run executable with arguments (codelldb)",
    type = "codelldb",
    request = "launch",
    -- This requires special handling of 'run_last', see
    -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
    program = function()
      local path = vim.fn.input {
        prompt = "Path to executable: ",
        default = vim.fn.getcwd() .. "/",
        completion = "file",
      }

      return (path and path ~= "") and path or dap.ABORT
    end,
    args = function()
      local args_str = vim.fn.input {
        prompt = "Arguments: ",
      }
      return vim.split(args_str, " +")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    breakpointMode = "file",
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false,
      },
    },
  },
  {
    name = "Attach to process (codelldb)",
    type = "codelldb",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "gdb",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    breakpointMode = "file",
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false,
      },
    },
  },
}

dap.configurations.cpp = dap.configurations.c
