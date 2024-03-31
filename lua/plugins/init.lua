return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "prettier",
        "clangd",
        "clang-format",
        "code-spell",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "cpp",
        "python",
      },
    },
  },

  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
    config = function()
      return require "configs.vim-illuminate"
    end,
  },

  {
    "APZelos/blamer.nvim",
    lazy = true,
    config = function()
      vim.g.blamer_enabled = 1
      vim.g.blamer_delay = 500
    end,
  },

  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "mfussenegger/nvim-dap",
    lazy = true,
    ft = { "c", "cpp" },
    config = function()
      require "configs.nvim-dap"
    end,
  },
}
