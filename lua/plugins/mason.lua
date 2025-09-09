-- Customize Mason for Python development

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- Python LSP servers
        "pyright",      -- main Python LSP
        "ruff",         -- new Ruff LSP (replaces ruff-lsp)
        
        -- Web development for Django/FastAPI
        "html-lsp",
        "css-lsp", 
        "json-lsp",
        
        -- Formatters
        "black",        -- Python formatter
        "isort",        -- import sorting
        "stylua",       -- Lua formatter
        
        -- Debuggers
        "debugpy",      -- Python debugger
        
        -- Utilities
        "tree-sitter-cli",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- Modern LSP servers for Python
      vim.list_extend(opts.ensure_installed, { "pyright", "ruff" })
    end,
  },
}
