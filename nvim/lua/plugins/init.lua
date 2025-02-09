return {
  {
    "stevearc/conform.nvim",
      event = "BufWritePre", -- uncomment for format on save
      config = function()
        require "configs.conform"
    end,
  },
  {
    "rizzatti/dash.vim",
    lazy = false,
  },
  -- These are some examples, uncomment them if you want to see them work!
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
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyright",
      },
    },
  },
  {
    "github/copilot.vim",
    lazy = false
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    lazy = false
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "ruby",
        "purescript",
        "python",
        "scala",
      },
    },
  },
}
