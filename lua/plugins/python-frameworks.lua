return {
  -- Modern Python LSP support for Django/FastAPI
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local util = require "lspconfig.util"
      opts.servers = opts.servers or {}
      
      -- Pyright for type checking and code analysis
      opts.servers.pyright = {
        settings = {
          python = {
            analysis = {
              extraPaths = { "." },
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              typeCheckingMode = "basic",
            },
          },
        },
        root_dir = util.root_pattern("manage.py", "main.py", "pyproject.toml", ".git"),
      }
      
      -- New Ruff LSP (replaces deprecated ruff-lsp)
      opts.servers.ruff = {
        init_options = {
          settings = {
            -- Ruff can suggest fixes through code actions
            codeAction = { 
              disableRuleComment = { enable = true }, 
              fixViolation = { enable = true } 
            },
          },
        },
      }
    end,
  },
  -- Formatting via none-ls (without duplicating diagnostics)
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      opts.sources = opts.sources or {}
      
      -- DO NOT add null_ls.builtins.diagnostics.ruff - this is now handled by ruff LSP
      -- Only formatting
      table.insert(opts.sources, null_ls.builtins.formatting.black)
      table.insert(opts.sources, null_ls.builtins.formatting.isort)
    end,
  },
  -- Commands for Django/FastAPI
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          -- Django commands
          ["<leader>dj"] = { "<cmd>!python manage.py<cr>", desc = "Django manage.py" },
          ["<leader>ds"] = { "<cmd>!python manage.py shell<cr>", desc = "Django shell" },
          ["<leader>dr"] = { "<cmd>!python manage.py runserver<cr>", desc = "Django runserver" },
          ["<leader>dm"] = { "<cmd>!python manage.py migrate<cr>", desc = "Django migrate" },
          -- FastAPI commands
          ["<leader>rf"] = { "<cmd>!uvicorn main:app --reload<cr>", desc = "Run FastAPI server" },
          ["<leader>rs"] = { "<cmd>!python -m pytest<cr>", desc = "Run tests" },
          -- Python general commands
          ["<leader>py"] = { "<cmd>!python %<cr>", desc = "Run current Python file" },
        },
      },
    },
  },
}
