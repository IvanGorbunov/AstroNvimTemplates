# AstroNvim Python Development Environment

> Modern IDE based on AstroNvim for full-featured Python development with Django and FastAPI support

**[Russian Version](README_RU.md) | English Version**

## 📋 Table of Contents

- [AstroNvim Python Development Environment](#astronvim-python-development-environment)
  - [📋 Table of Contents](#-table-of-contents)
  - [🚀 Features](#-features)
  - [🛠️ Installation](#️-installation)
    - [Backup Current Configuration](#backup-current-configuration)
    - [Clone Repository](#clone-repository)
  - [📁 Project Structure](#-project-structure)
  - [⚡ Quick Start](#-quick-start)
    - [System Requirements](#system-requirements)
    - [First Launch](#first-launch)
  - [🛠️ Installed Tools](#️-installed-tools)
    - [LSP Servers (via Mason)](#lsp-servers-via-mason)
    - [Formatters and Linters](#formatters-and-linters)
    - [Debuggers](#debuggers)
  - [⌨️ Keybindings](#️-keybindings)
    - [Basic Commands](#basic-commands)
    - [Python Development](#python-development)
    - [Django Commands](#django-commands)
    - [FastAPI Commands](#fastapi-commands)
    - [LSP Functions](#lsp-functions)
    - [Git Integration (LazyGit)](#git-integration-lazygit)
    - [Debugging (DAP)](#debugging-dap)
    - [Navigation and Editing](#navigation-and-editing)
  - [🔧 Virtual Environment Setup](#-virtual-environment-setup)
    - [Supported Paths](#supported-paths)
    - [Usage](#usage)
  - [🐍 Python Projects](#-python-projects)
    - [Django Project](#django-project)
    - [FastAPI Project](#fastapi-project)
  - [🔍 Search and Navigation](#-search-and-navigation)
    - [Telescope (File Search)](#telescope-file-search)
    - [Neo-tree (File Manager)](#neo-tree-file-manager)
  - [🎨 Code Formatting](#-code-formatting)
    - [Automatic Formatting](#automatic-formatting)
    - [Manual Formatting](#manual-formatting)
  - [🐛 Debugging](#-debugging)
    - [Debugpy Setup](#debugpy-setup)
    - [Starting Debug Session](#starting-debug-session)
  - [📦 Plugin Management](#-plugin-management)
    - [Lazy.nvim Commands](#lazynvim-commands)
    - [Mason Commands](#mason-commands)
  - [🔧 Diagnostics and Troubleshooting](#-diagnostics-and-troubleshooting)
    - [System Health Check](#system-health-check)
    - [LSP Information](#lsp-information)
    - [Common Issues](#common-issues)
  - [🎯 Performance](#-performance)
    - [Load Times](#load-times)
    - [Optimization](#optimization)
  - [🔄 Updates](#-updates)
    - [AstroNvim Update](#astronvim-update)
    - [Plugin Updates](#plugin-updates)
    - [LSP Server Updates](#lsp-server-updates)
  - [🤝 Support](#-support)
    - [Documentation](#documentation)
    - [Community](#community)
  - [📝 License](#-license)

## 🚀 Features

- **Python LSP**: Pyright + Ruff for code analysis and linting
- **Formatting**: Black + isort for automatic code formatting
- **Django Support**: manage.py commands, shell, runserver
- **FastAPI Support**: Uvicorn server, testing
- **Virtual Environments**: Automatic detection and switching
- **Debugging**: DAP for Python debugging
- **Web Development**: HTML, CSS, JSON LSP servers

## 🛠️ Installation

### Backup Current Configuration

Make a backup of your current nvim and shared folder:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Clone Repository

**Create a new user repository from this template:**

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

**Clone the repository:**

```bash
git clone https://github.com/IvanGorbunov/AstroNvimTemplates.git ~/.config/nvim
cd ~/.config/nvim
git checkout python3
```

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                    # AstroNvim entry point
├── lua/
│   ├── community.lua           # AstroCommunity packages
│   ├── lazy_setup.lua         # Lazy.nvim setup
│   ├── polish.lua             # Final configurations
│   └── plugins/
│       ├── astrocore.lua      # Core AstroNvim settings
│       ├── astrolsp.lua       # LSP configuration
│       ├── astroui.lua        # UI settings
│       ├── mason.lua          # Mason tools
│       ├── none-ls.lua        # Formatting
│       ├── python-env.lua     # Virtual environments
│       ├── python-frameworks.lua # Django/FastAPI
│       ├── treesitter.lua     # Syntax highlighting
│       └── user-options.lua   # User settings
└── README.md                  # This file
```

## ⚡ Quick Start

### System Requirements
- Neovim >= 0.10 ([Installation Guide](https://github.com/neovim/neovim/blob/master/INSTALL.md))
- Python 3.10+ (supports 3.12, 3.13)
- Node.js and npm
- ripgrep, fd-find
- Git

### First Launch
```bash
# Start Neovim
nvim

# All plugins will install automatically
# First launch may take time for installation
```

## 🛠️ Installed Tools

### LSP Servers (via Mason)
- **pyright** - main Python LSP server
- **ruff** - modern linter and formatter
- **html-lsp** - HTML support
- **css-lsp** - CSS support  
- **json-lsp** - JSON support

### Formatters and Linters
- **black** - Python code formatter
- **isort** - import sorting
- **ruff** - fast Python linter

### Debuggers
- **debugpy** - Python debugger

## ⌨️ Keybindings

### Basic Commands
| Command | Action |
|---------|--------|
| `<leader>` | Space (main key) |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Search content |
| `<leader>fw` | Search word under cursor |
| `<leader>e` | File tree (Neo-tree) |
| `<leader>o` | Toggle file tree |

### Python Development
| Command | Action |
|---------|--------|
| `<leader>py` | Run current Python file |
| `<leader>cv` | Select virtual environment |

### Django Commands
| Command | Action |
|---------|--------|
| `<leader>dj` | Django manage.py (interactive) |
| `<leader>ds` | Django shell |
| `<leader>dr` | Django runserver |
| `<leader>dm` | Django migrate |

### FastAPI Commands
| Command | Action |
|---------|--------|
| `<leader>rf` | Run FastAPI server (uvicorn) |
| `<leader>rs` | Run tests (pytest) |

### LSP Functions
| Command | Action |
|---------|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Show documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>f` | Format file |

### Git Integration (LazyGit)
| Command | Action |
|---------|--------|
| `<leader>gg` | Open LazyGit |
| `<leader>gc` | Git commits |
| `<leader>gt` | Git status |

### Debugging (DAP)
| Command | Action |
|---------|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue execution |
| `<leader>ds` | Step over |
| `<leader>do` | Step out |
| `<leader>di` | Step into |
| `<leader>dt` | Terminate debug |

### Navigation and Editing
| Command | Action |
|---------|--------|
| `<C-h/j/k/l>` | Switch between windows |
| `<leader>w` | Save file |
| `<leader>q` | Close window |
| `<leader>c` | Close buffer |
| `<leader>/` | Toggle comment |

## 🔧 Virtual Environment Setup

### Supported Paths
- `~/.virtualenvs/` - virtualenvwrapper
- `~/.pyenv/versions/` - pyenv environments
- `./.venv/` - local project environments

### Usage
1. Open Python project
2. Press `<leader>cv`
3. Select desired environment from list
4. LSP will automatically switch to selected Python

## 🐍 Python Projects

### Django Project
```python
# Django project structure
myproject/
├── manage.py
├── myproject/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── myapp/
    ├── __init__.py
    ├── models.py
    ├── views.py
    └── urls.py
```

**Commands:**
- `<leader>dr` - start dev server
- `<leader>ds` - Django shell for testing
- `<leader>dm` - apply migrations

### FastAPI Project
```python
# main.py
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class User(BaseModel):
    name: str
    email: str

@app.get("/")
async def root():
    return {"message": "Hello FastAPI!"}
```

**Commands:**
- `<leader>rf` - start server with hot reload
- `<leader>rs` - run tests

## 🔍 Search and Navigation

### Telescope (File Search)
- `<leader>ff` - find files by name
- `<leader>fg` - search content (live grep)
- `<leader>fb` - search open buffers
- `<leader>fh` - search history
- `<leader>fm` - search marks

### Neo-tree (File Manager)
- `<leader>e` - toggle file tree
- `<leader>o` - focus file tree
- In tree: `a` - create file/folder, `d` - delete, `r` - rename

## 🎨 Code Formatting

### Automatic Formatting
- Format on save enabled by default
- Black for Python code
- isort for import sorting
- Ruff for style fixes

### Manual Formatting
- `<leader>f` - format current file
- `:Format` - formatting command

## 🐛 Debugging

### Debugpy Setup
```python
# Add breakpoint in code
import debugpy
debugpy.breakpoint()

# Or use built-in Neovim breakpoints
```

### Starting Debug Session
1. Set breakpoint: `<leader>db`
2. Start debugging: `<leader>dc`
3. Use navigation commands for step-by-step execution

## 📦 Plugin Management

### Lazy.nvim Commands
```vim
:Lazy                 " Open plugin manager
:Lazy sync            " Sync plugins
:Lazy update          " Update plugins  
:Lazy clean           " Remove unused plugins
:Lazy profile         " Profile loading
```

### Mason Commands
```vim
:Mason                " Open Mason
:MasonInstall <name>  " Install package
:MasonUpdate          " Update all packages
:MasonLog             " View logs
```

## 🔧 Diagnostics and Troubleshooting

### System Health Check
```vim
:checkhealth          " General check
:checkhealth lsp      " LSP check
:checkhealth python   " Python check
:checkhealth mason    " Mason check
```

### LSP Information
```vim
:LspInfo              " LSP server info
:LspRestart           " Restart LSP
:LspLog               " LSP logs
```

### Common Issues

**LSP not working:**
1. Check `:LspInfo`
2. Ensure server installed in `:Mason`
3. Restart LSP: `:LspRestart`

**Formatting not working:**
1. Check formatter installation: `:Mason`
2. Check configuration: `:checkhealth null-ls`

**Virtual environment not detected:**
1. Use `<leader>cv` for manual selection
2. Ensure environment contains Python executable

## 🎯 Performance

### Load Times
- Cold start: ~1-2 seconds
- Hot start: ~0.5 seconds
- Lazy loading for most plugins

### Optimization
- Plugins load on demand
- LSP servers start only for relevant files
- Treesitter parsers install automatically

## 🔄 Updates

### AstroNvim Update
```bash
# In AstroNvim configuration
:AstroUpdate
```

### Plugin Updates
```vim
:Lazy sync
```

### LSP Server Updates
```vim
:Mason
# Select package and press 'U' to update
```

## 🤝 Support

### Documentation
- [AstroNvim Docs](https://docs.astronvim.com/)
- [AstroCommunity](https://github.com/AstroNvim/astrocommunity)
- [Neovim Docs](https://neovim.io/doc/)

### Community
- [AstroNvim Discord](https://discord.gg/UcZutyeaFW)
- [GitHub Issues](https://github.com/AstroNvim/AstroNvim/issues)

## 📝 License

This configuration is based on AstroNvim Template and distributed under the same license.

---

**Version:** AstroNvim v5+ | **Python:** 3.10+ | **Last Updated:** 2025-01-08