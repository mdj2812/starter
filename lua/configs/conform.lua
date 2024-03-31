
local options = {
  formatters_by_ft = {
    cpp = { "clang-format" },
    lua = { "stylua" },
    python = { "isort", "autopep8" },
    json = { "jq" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    ["_"] = { "trim_whitespace" },
  },
  formatters = {
    autopep8 = {
      args = { "--max-line-length", "120", "-aa", "$FILENAME" },
    },
    jq = {
      args = { "--indent", "4" },
    }
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
    async = false,
  },
}

require("conform").setup(options)
