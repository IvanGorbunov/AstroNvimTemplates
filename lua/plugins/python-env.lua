return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    opts = {
      settings = {
        search = {
          my_venvs = {
            command = "find ~/.virtualenvs -name 'python*' -type f 2>/dev/null",
          },
          pyenv = {
            command = "find ~/.pyenv/versions -name 'python*' -type f 2>/dev/null",
          },
          project_venv = {
            command = "find . -name 'python*' -path '*/.venv/bin/*' -type f 2>/dev/null",
          },
        },
      },
    },
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },
}
