require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "v" }, "<leader>mp", function()
  require("conform").format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  }
end, { desc = "Format the file" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- DAP
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "DAP Continue" })
map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "DAP Step Over" })
map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "DAP Step Into" })
map("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "DAP Step Out" })
map("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP Toggle Breakpoint" })
map("n", "<Leader>B", function()
  require("dap").set_breakpoint()
end, { desc = "DAP Set Breakpoint" })
map("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "DAP Set Breakpoint with log" })
map("n", "<Leader>dr", function()
  require("dap").repl.open()
end, { desc = "DAP Open repl" })
map("n", "<Leader>dl", function()
  require("dap").run_last()
end, { desc = "DAP Run Last" })
map({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "DAP Hover" })
map({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "DAP Preview" })
map("n", "<Leader>df", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end, { desc = "DAP Float Frames" })
map("n", "<Leader>ds", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end, { desc = "DAP Float Scopes" })
