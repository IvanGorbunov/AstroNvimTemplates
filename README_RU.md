# AstroNvim Python Development Environment

> Современная IDE на базе AstroNvim для полноценной Python разработки с поддержкой Django и FastAPI

**Русская версия | [English Version](README.md)**

## 📋 Оглавление

- [AstroNvim Python Development Environment](#astronvim-python-development-environment)
  - [📋 Оглавление](#-оглавление)
  - [🚀 Особенности](#-особенности)
  - [🛠️ Установка](#️-установка)
    - [Резервное копирование текущей конфигурации](#резервное-копирование-текущей-конфигурации)
    - [Клонирование репозитория](#клонирование-репозитория)
  - [📁 Структура проекта](#-структура-проекта)
  - [⚡ Быстрый старт](#-быстрый-старт)
    - [Системные требования](#системные-требования)
    - [Первый запуск](#первый-запуск)
    - [Ручная установка инструментов (опционально)](#ручная-установка-инструментов-опционально)
    - [🐍 Управление версиями Python (опционально)](#-управление-версиями-python-опционально)
    - [Создание виртуальных окружений с pyenv](#создание-виртуальных-окружений-с-pyenv)
  - [🛠️ Установленные инструменты](#️-установленные-инструменты)
    - [LSP серверы (через Mason)](#lsp-серверы-через-mason)
    - [Форматтеры и линтеры](#форматтеры-и-линтеры)
    - [Отладчики](#отладчики)
    - [Утилиты](#утилиты)
  - [⌨️ Горячие клавиши](#️-горячие-клавиши)
    - [Основные команды](#основные-команды)
    - [Python разработка](#python-разработка)
    - [Django команды](#django-команды)
    - [FastAPI команды](#fastapi-команды)
    - [LSP функции](#lsp-функции)
    - [Git интеграция (LazyGit)](#git-интеграция-lazygit)
    - [Отладка (DAP)](#отладка-dap)
    - [Навигация и редактирование](#навигация-и-редактирование)
  - [🔧 Настройка виртуальных окружений](#-настройка-виртуальных-окружений)
    - [Поддерживаемые пути](#поддерживаемые-пути)
    - [Использование](#использование)
  - [🐍 Python проекты](#-python-проекты)
    - [Django проект](#django-проект)
    - [FastAPI проект](#fastapi-проект)
  - [🔍 Поиск и навигация](#-поиск-и-навигация)
    - [Telescope (поиск файлов)](#telescope-поиск-файлов)
    - [Neo-tree (файловый менеджер)](#neo-tree-файловый-менеджер)
  - [🎨 Форматирование кода](#-форматирование-кода)
    - [Автоматическое форматирование](#автоматическое-форматирование)
    - [Ручное форматирование](#ручное-форматирование)
  - [🐛 Отладка](#-отладка)
    - [Настройка debugpy](#настройка-debugpy)
    - [Запуск отладки](#запуск-отладки)
  - [📦 Управление плагинами](#-управление-плагинами)
    - [Lazy.nvim команды](#lazynvim-команды)
    - [Mason команды](#mason-команды)
  - [🔧 Диагностика и устранение проблем](#-диагностика-и-устранение-проблем)
    - [Проверка здоровья системы](#проверка-здоровья-системы)
    - [LSP информация](#lsp-информация)
    - [Часто встречающиеся проблемы](#часто-встречающиеся-проблемы)
  - [🎯 Производительность](#-производительность)
    - [Время загрузки](#время-загрузки)
    - [Оптимизация](#оптимизация)
  - [🔄 Обновление](#-обновление)
    - [Обновление AstroNvim](#обновление-astronvim)
    - [Обновление плагинов](#обновление-плагинов)
    - [Обновление LSP серверов](#обновление-lsp-серверов)
  - [🤝 Поддержка](#-поддержка)
    - [Документация](#документация)
    - [Сообщество](#сообщество)
  - [📝 Лицензия](#-лицензия)

## 🚀 Особенности

- **Python LSP**: Pyright + Ruff для анализа кода и линтинга
- **Форматирование**: Black + isort для автоматического форматирования
- **Django поддержка**: Команды manage.py, shell, runserver
- **FastAPI поддержка**: Uvicorn сервер, тестирование
- **Виртуальные окружения**: Автоматическое определение и переключение
- **Отладка**: DAP для Python debugging
- **Веб-разработка**: HTML, CSS, JSON LSP серверы

## 🛠️ Установка

### Резервное копирование текущей конфигурации

Создайте резервную копию вашей текущей конфигурации nvim и общих папок:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Клонирование репозитория

**Создание нового пользовательского репозитория из этого шаблона:**

Нажмите кнопку "Use this template" выше, чтобы создать новый репозиторий для хранения вашей пользовательской конфигурации.

Вы также можете просто клонировать этот репозиторий напрямую, если не хотите отслеживать вашу пользовательскую конфигурацию в GitHub.

**Клонирование репозитория:**

```bash
git clone https://github.com/IvanGorbunov/AstroNvimTemplates.git ~/.config/nvim
cd ~/.config/nvim
git checkout python3
```

## 📁 Структура проекта

```
~/.config/nvim/
├── init.lua                    # Точка входа AstroNvim
├── lua/
│   ├── community.lua           # AstroCommunity пакеты
│   ├── lazy_setup.lua         # Настройка Lazy.nvim
│   ├── polish.lua             # Финальные настройки
│   └── plugins/
│       ├── astrocore.lua      # Основные настройки AstroNvim
│       ├── astrolsp.lua       # LSP конфигурация
│       ├── astroui.lua        # UI настройки
│       ├── mason.lua          # Mason инструменты
│       ├── none-ls.lua        # Форматирование
│       ├── python-env.lua     # Виртуальные окружения
│       ├── python-frameworks.lua # Django/FastAPI
│       ├── treesitter.lua     # Подсветка синтаксиса
│       └── user-options.lua   # Пользовательские настройки
└── README.md                  # Этот файл
```

## ⚡ Быстрый старт

### Системные требования
- Neovim >= 0.10 ([Инструкция по установке](https://github.com/neovim/neovim/blob/master/INSTALL.md))
- Python 3.10+ (поддержка 3.12, 3.13)
- Node.js и npm
- ripgrep, fd-find
- Git

### Первый запуск
```bash
# Запустить Neovim
nvim

# Все плагины установятся автоматически
# При первом запуске может потребоваться время на установку
```

### Ручная установка инструментов (опционально)

## Установка необходимых инструментов через Mason

> **Важно:** `ruff-lsp` устарел. Используем встроенный LSP из `ruff` (`ruff server`).
> Также выбираем **один** Python-сервер: `pyright` **или** `basedpyright`.

### Минимальная установка (Python-backend)
```vim
:MasonUninstall ruff-lsp
:MasonInstall ruff pyright black isort debugpy stylua tree-sitter-cli
```

или, если предпочитаешь Based Pyright:
```vim
:MasonUninstall ruff-lsp
:MasonInstall ruff basedpyright black isort debugpy stylua tree-sitter-cli
```

### +Опционально (если нужны LSP для фронта/шаблонов)
```vim
:MasonInstall json-lsp html-lsp css-lsp emmet-ls
```

### Pip-tools (в активном venv проекта)
```bash
pip install -U ruff black isort debugpy
```

> После установки: `:LspInfo` — должны быть активны `ruff` + (**pyright** *или* **basedpyright**).
> Форматирование: оставь **black** (или замени на `ruff_format` через none-ls, но не ставь оба одновременно).

**Дополнительные команды Mason:**
```vim
" Открыть менеджер пакетов Mason
:Mason

" Обновить все установленные пакеты
:MasonUpdate

" Проверить статус установки
:MasonLog
```

**Системные зависимости (установка через пакетный менеджер):**
```bash
# Ubuntu/Debian
sudo apt install python3-pip nodejs npm ripgrep fd-find git

# Arch Linux
sudo pacman -S python-pip nodejs npm ripgrep fd git

# macOS (Homebrew)
brew install python nodejs npm ripgrep fd git
```

### 🐍 Управление версиями Python (опционально)

Установка Python 3.12 и 3.13 через pyenv без изменения системного Python:

```bash
# Установка pyenv
curl https://pyenv.run | bash

# Добавим в ~/.bashrc или ~/.zshrc
echo -e '\n# Pyenv' >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

# Установка необходимых зависимостей (Ubuntu/Debian)
sudo apt update
sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
libffi-dev liblzma-dev

# Установка версий Python
pyenv install 3.12.7
pyenv install 3.13.0
pyenv global 3.12.7

# Проверка установки
python --version
pyenv versions
```

**Примечание:** После установки новых версий Python перезапустите Neovim и используйте `<leader>cv` для выбора нужного Python окружения.

### Создание виртуальных окружений с pyenv

После установки версий Python создайте виртуальные окружения для конкретных проектов:

```bash
# Перейдите в директорию вашего проекта
cd /path/to/your/project

# Создайте виртуальное окружение с определенной версией Python
pyenv virtualenv 3.12.7 myproject-env

# Установите локальную версию Python для проекта
pyenv local myproject-env

# Проверьте, что окружение активно
python --version
which python

# Установите зависимости проекта
pip install --upgrade pip
pip install django fastapi uvicorn pytest black isort ruff

# Создайте requirements.txt
pip freeze > requirements.txt
```

**Альтернатива: использование .venv (локальные окружения проекта):**
```bash
# Создайте локальный .venv в директории проекта
pyenv exec python -m venv .venv

# Активируйте окружение (ручная активация)
source .venv/bin/activate

# Или используйте pyenv local для автоактивации
echo ".venv/bin/python" > .python-version
```

**Команды pyenv для виртуальных окружений:**
```bash
# Список всех окружений
pyenv versions

# Создать новое окружение
pyenv virtualenv <версия-python> <имя-окружения>

# Удалить окружение
pyenv uninstall <имя-окружения>

# Установить глобальное по умолчанию
pyenv global <имя-окружения>

# Установить локальное окружение проекта
pyenv local <имя-окружения>
```

**Интеграция с Neovim:**
- Neovim автоматически определяет файлы `.python-version`
- Используйте `<leader>cv` для ручного выбора окружений
- LSP серверы будут использовать выбранный интерпретатор Python

## 🛠️ Установленные инструменты

### LSP серверы (через Mason)
- **pyright** - основной Python LSP сервер (Microsoft)
- **basedpyright** - форк pyright от сообщества с дополнительными функциями
- **ruff** - современный Python линтер и форматтер (встроенный LSP)
- **html-lsp** - HTML поддержка
- **css-lsp** - CSS поддержка  
- **json-lsp** - JSON поддержка
- **emmet-ls** - расширение HTML/CSS аббревиатур

### Форматтеры и линтеры
- **black** - Python код форматтер
- **isort** - сортировка импортов
- **ruff** - быстрый линтер Python
- **stylua** - Lua форматтер

### Отладчики
- **debugpy** - Python debugger

### Утилиты
- **tree-sitter-cli** - генератор парсеров Tree-sitter

## ⌨️ Горячие клавиши

### Основные команды
| Команда | Действие |
|---------|----------|
| `<leader>` | Пробел (основная клавиша) |
| `<leader>ff` | Поиск файлов (Telescope) |
| `<leader>fg` | Поиск по содержимому |
| `<leader>fw` | Поиск слова под курсором |
| `<leader>e` | Файловое дерево (Neo-tree) |
| `<leader>o` | Переключить файловое дерево |

### Python разработка
| Команда | Действие |
|---------|----------|
| `<leader>py` | Запустить текущий Python файл |
| `<leader>cv` | Выбрать виртуальное окружение |

### Django команды
| Команда | Действие |
|---------|----------|
| `<leader>dj` | Django manage.py (интерактивно) |
| `<leader>ds` | Django shell |
| `<leader>dr` | Django runserver |
| `<leader>dm` | Django migrate |

### FastAPI команды
| Команда | Действие |
|---------|----------|
| `<leader>rf` | Запуск FastAPI сервера (uvicorn) |
| `<leader>rs` | Запуск тестов (pytest) |

### LSP функции
| Команда | Действие |
|---------|----------|
| `gd` | Перейти к определению |
| `gr` | Найти ссылки |
| `K` | Показать документацию |
| `<leader>rn` | Переименовать символ |
| `<leader>ca` | Code actions |
| `<leader>f` | Форматировать файл |

### Git интеграция (LazyGit)
| Команда | Действие |
|---------|----------|
| `<leader>gg` | Открыть LazyGit |
| `<leader>gc` | Git commits |
| `<leader>gt` | Git status |

### Отладка (DAP)
| Команда | Действие |
|---------|----------|
| `<leader>db` | Поставить/убрать breakpoint |
| `<leader>dc` | Продолжить выполнение |
| `<leader>ds` | Шаг вперед |
| `<leader>do` | Шаг через функцию |
| `<leader>di` | Шаг в функцию |
| `<leader>dt` | Завершить отладку |

### Навигация и редактирование
| Команда | Действие |
|---------|----------|
| `<C-h/j/k/l>` | Переключение между окнами |
| `<leader>w` | Сохранить файл |
| `<leader>q` | Закрыть окно |
| `<leader>c` | Закрыть буфер |
| `<leader>/` | Переключить комментарий |

## 🔧 Настройка виртуальных окружений

### Поддерживаемые пути
- `~/.virtualenvs/` - virtualenvwrapper
- `~/.pyenv/versions/` - pyenv окружения
- `./.venv/` - локальные окружения проекта

### Использование
1. Открыть Python проект
2. Нажать `<leader>cv`
3. Выбрать нужное окружение из списка
4. LSP автоматически переключится на выбранный Python

## 🐍 Python проекты

### Django проект
```python
# Структура Django проекта
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

**Команды:**
- `<leader>dr` - запустить dev сервер
- `<leader>ds` - Django shell для тестирования
- `<leader>dm` - применить миграции

### FastAPI проект
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

**Команды:**
- `<leader>rf` - запустить сервер с hot reload
- `<leader>rs` - запустить тесты

## 🔍 Поиск и навигация

### Telescope (поиск файлов)
- `<leader>ff` - поиск файлов по имени
- `<leader>fg` - поиск по содержимому (live grep)
- `<leader>fb` - поиск среди открытых буферов
- `<leader>fh` - история поиска
- `<leader>fm` - поиск по marks

### Neo-tree (файловый менеджер)
- `<leader>e` - переключить файловое дерево
- `<leader>o` - фокус на файловом дереве
- В дереве: `a` - создать файл/папку, `d` - удалить, `r` - переименовать

## 🎨 Форматирование кода

### Автоматическое форматирование
- Форматирование при сохранении включено по умолчанию
- Black для Python кода
- isort для сортировки импортов
- Ruff для исправления стилистических ошибок

### Ручное форматирование
- `<leader>f` - форматировать текущий файл
- `:Format` - команда форматирования

## 🐛 Отладка

### Настройка debugpy
```python
# В коде добавить breakpoint
import debugpy
debugpy.breakpoint()

# Или использовать встроенные breakpoints Neovim
```

### Запуск отладки
1. Поставить breakpoint: `<leader>db`
2. Запустить отладку: `<leader>dc`
3. Использовать команды навигации для пошагового выполнения

## 📦 Управление плагинами

### Lazy.nvim команды
```vim
:Lazy                 " Открыть менеджер плагинов
:Lazy sync            " Синхронизировать плагины
:Lazy update          " Обновить плагины  
:Lazy clean           " Удалить неиспользуемые плагины
:Lazy profile         " Профилировать загрузку
```

### Mason команды
```vim
:Mason                " Открыть Mason
:MasonInstall <name>  " Установить пакет
:MasonUpdate          " Обновить все пакеты
:MasonLog             " Посмотреть логи
```

## 🔧 Диагностика и устранение проблем

### Проверка здоровья системы
```vim
:checkhealth          " Общая проверка
:checkhealth lsp      " Проверка LSP
:checkhealth python   " Проверка Python
:checkhealth mason    " Проверка Mason
```

### LSP информация
```vim
:LspInfo              " Информация о LSP серверах
:LspRestart           " Перезапустить LSP
:LspLog               " Логи LSP
```

### Часто встречающиеся проблемы

**LSP не работает:**
1. Проверить `:LspInfo`
2. Убедиться что сервер установлен в `:Mason`
3. Перезапустить LSP: `:LspRestart`

**Форматирование не работает:**
1. Проверить установку форматтеров: `:Mason`
2. Проверить конфигурацию: `:checkhealth null-ls`

**Виртуальное окружение не определяется:**
1. Использовать `<leader>cv` для ручного выбора
2. Убедиться что окружение содержит Python executable

## 🎯 Производительность

### Время загрузки
- Холодный старт: ~1-2 секунды
- Горячий старт: ~0.5 секунды
- Lazy loading для большинства плагинов

### Оптимизация
- Плагины загружаются по требованию
- LSP серверы запускаются только для соответствующих файлов
- Treesitter парсеры устанавливаются автоматически

## 🔄 Обновление

### Обновление AstroNvim
```bash
# В конфигурации AstroNvim
:AstroUpdate
```

### Обновление плагинов
```vim
:Lazy sync
```

### Обновление LSP серверов
```vim
:Mason
# Выбрать пакет и нажать 'U' для обновления
```

## 🤝 Поддержка

### Документация
- [AstroNvim Docs](https://docs.astronvim.com/)
- [AstroCommunity](https://github.com/AstroNvim/astrocommunity)
- [Neovim Docs](https://neovim.io/doc/)

### Сообщество
- [AstroNvim Discord](https://discord.gg/UcZutyeaFW)
- [GitHub Issues](https://github.com/AstroNvim/AstroNvim/issues)

## 📝 Лицензия

Эта конфигурация основана на AstroNvim Template и распространяется под той же лицензией.

---

**Версия:** AstroNvim v5+ | **Python:** 3.10+ | **Дата обновления:** 2025-01-09