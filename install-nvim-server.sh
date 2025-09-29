#!/bin/bash

#################################################
# AstroNvim Python Development Environment
# Server Installation Script
#################################################
# Automated installation of Neovim + AstroNvim Python configuration
# Supports Ubuntu/Debian systems
# Run as root: curl -fsSL <script-url> | bash
#################################################

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Error handler
error_exit() {
    log_error "$1"
    exit 1
}

# Check if running as root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        error_exit "This script must be run as root. Use: sudo $0"
    fi
}

# Detect OS distribution
detect_os() {
    if [[ ! -f /etc/os-release ]]; then
        error_exit "Cannot detect OS. /etc/os-release not found"
    fi
    
    . /etc/os-release
    
    log_info "Detected OS: $ID $VERSION_CODENAME"
    
    case "$ID" in
        ubuntu|debian)
            OS_TYPE="$ID"
            OS_CODENAME="${VERSION_CODENAME:-unknown}"
            ;;
        *)
            error_exit "Unsupported OS: $ID. Only Ubuntu and Debian are supported"
            ;;
    esac
}

# Configure apt repositories
configure_repositories() {
    log_info "Configuring APT repositories for $OS_TYPE $OS_CODENAME"
    
    case "$OS_TYPE" in
        ubuntu)
            cat > /etc/apt/sources.list << EOF
deb http://archive.ubuntu.com/ubuntu $OS_CODENAME main universe multiverse restricted
deb http://archive.ubuntu.com/ubuntu $OS_CODENAME-updates main universe multiverse restricted
deb http://archive.ubuntu.com/ubuntu $OS_CODENAME-backports main universe multiverse restricted
deb http://security.ubuntu.com/ubuntu $OS_CODENAME-security main universe multiverse restricted
EOF
            ;;
        debian)
            cat > /etc/apt/sources.list << EOF
deb http://deb.debian.org/debian $OS_CODENAME main contrib non-free non-free-firmware
deb http://deb.debian.org/debian $OS_CODENAME-updates main contrib non-free non-free-firmware
deb http://security.debian.org/debian-security $OS_CODENAME-security main contrib non-free non-free-firmware
EOF
            ;;
    esac
    
    log_success "APT repositories configured"
}

# Update system and install base packages
install_base_packages() {
    log_info "Updating package index and installing base packages"
    
    apt-get update
    
    # Essential packages
    local base_packages=(
        ca-certificates
        curl
        gnupg
        lsb-release
        git
        unzip
        wget
        build-essential
        software-properties-common
    )
    
    apt-get install -y --no-install-recommends "${base_packages[@]}"
    
    log_success "Base packages installed"
}

# Install Python and pip
install_python() {
    log_info "Installing Python 3 and pip"
    
    # Try to install python3-pip from package manager
    if apt-cache show python3-pip >/dev/null 2>&1; then
        apt-get install -y --no-install-recommends python3-pip python3-venv
    else
        log_warning "python3-pip package not available, using alternative method"
        
        # Ensure Python 3 is available
        apt-get install -y --no-install-recommends python3 python3-venv
        
        # Install pip using ensurepip or get-pip.py
        if python3 -m ensurepip --upgrade 2>/dev/null; then
            log_success "pip installed via ensurepip"
        else
            log_warning "ensurepip failed, downloading get-pip.py"
            curl -fsSL https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
            python3 /tmp/get-pip.py
            rm -f /tmp/get-pip.py
        fi
    fi
    
    log_success "Python and pip installed"
}

# Install development tools
install_dev_tools() {
    log_info "Installing development tools (ripgrep, fd-find)"
    
    # Install ripgrep and fd-find
    apt-get install -y --no-install-recommends ripgrep fd-find || {
        log_warning "Some packages might not be available in repositories"
    }
    
    # Create fd symlink if fdfind exists
    if [[ -x /usr/bin/fdfind ]] && [[ ! -x /usr/local/bin/fd ]]; then
        ln -sf /usr/bin/fdfind /usr/local/bin/fd
        log_success "Created fd symlink"
    fi
    
    log_success "Development tools installed"
}

# Install Node.js
install_nodejs() {
    log_info "Installing Node.js"
    
    if command -v node >/dev/null 2>&1; then
        log_info "Node.js already installed: $(node --version)"
        return 0
    fi
    
    # Install Node.js via NodeSource repository
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
    apt-get install -y --no-install-recommends nodejs
    
    log_success "Node.js installed: $(node --version)"
}

# Install Neovim
install_neovim() {
    log_info "Installing Neovim"
    
    # Download and install Neovim from GitHub releases
    local nvim_version="stable"
    local nvim_url="https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
    local install_dir="/opt/nvim-linux64"
    
    # Remove existing installation
    rm -rf "$install_dir"
    rm -f /usr/local/bin/nvim
    
    # Download and extract
    cd /tmp
    curl -fsSL "$nvim_url" -o nvim-linux64.tar.gz
    
    # Verify download
    if [[ ! -f nvim-linux64.tar.gz ]]; then
        error_exit "Failed to download Neovim"
    fi
    
    # Extract to /opt
    tar xzf nvim-linux64.tar.gz -C /opt/
    
    # Create symlink
    ln -sf "$install_dir/bin/nvim" /usr/local/bin/nvim
    
    # Cleanup
    rm -f nvim-linux64.tar.gz
    
    # Verify installation
    if ! /usr/local/bin/nvim --version >/dev/null 2>&1; then
        error_exit "Neovim installation verification failed"
    fi
    
    log_success "Neovim installed: $(/usr/local/bin/nvim --version | head -1)"
}

# Install Nerd Fonts
install_nerd_fonts() {
    log_info "Installing JetBrainsMono Nerd Font"
    
    local fonts_dir="/usr/local/share/fonts"
    local temp_dir="/tmp/nerd-fonts"
    
    # Create fonts directory
    mkdir -p "$fonts_dir"
    mkdir -p "$temp_dir"
    
    cd "$temp_dir"
    
    # Download JetBrainsMono Nerd Font
    local font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
    
    curl -fsSL "$font_url" -o JetBrainsMono.zip
    
    if [[ ! -f JetBrainsMono.zip ]]; then
        log_warning "Failed to download Nerd Font, continuing without it"
        return 0
    fi
    
    # Extract fonts
    unzip -q JetBrainsMono.zip -d jetbrainsmono
    
    # Copy font files
    find jetbrainsmono -name "*.ttf" -exec cp {} "$fonts_dir/" \;
    
    # Update font cache
    if command -v fc-cache >/dev/null 2>&1; then
        fc-cache -fv >/dev/null 2>&1
        log_success "Font cache updated"
    else
        log_warning "fc-cache not available, install fontconfig to update font cache"
    fi
    
    # Cleanup
    cd /
    rm -rf "$temp_dir"
    
    log_success "JetBrainsMono Nerd Font installed"
}

# Install AstroNvim configuration
install_astronvim_config() {
    log_info "Installing AstroNvim Python configuration"
    
    local user_home
    local config_dir
    
    # Determine user and home directory
    if [[ -n "${SUDO_USER:-}" ]]; then
        user_home="/home/$SUDO_USER"
        config_dir="$user_home/.config"
    else
        user_home="/root"
        config_dir="$user_home/.config"
    fi
    
    # Create config directory
    mkdir -p "$config_dir"
    
    # Remove existing nvim config
    rm -rf "$config_dir/nvim"
    
    # Clone AstroNvim configuration
    git clone https://github.com/IvanGorbunov/AstroNvimTemplates.git "$config_dir/nvim"
    
    cd "$config_dir/nvim"
    
    # Checkout python3 branch
    git fetch origin
    git checkout python3
    
    # Set proper ownership
    if [[ -n "${SUDO_USER:-}" ]]; then
        chown -R "$SUDO_USER:$SUDO_USER" "$config_dir/nvim"
    fi
    
    log_success "AstroNvim configuration installed in $config_dir/nvim"
}

# Install Python packages for development
install_python_packages() {
    log_info "Installing Python development packages"
    
    local python_packages=(
        ruff
        black
        isort
        debugpy
        pytest
    )
    
    # Install globally or in user space
    if [[ -n "${SUDO_USER:-}" ]]; then
        # Install for the user
        sudo -u "$SUDO_USER" python3 -m pip install --user --upgrade "${python_packages[@]}"
    else
        # Install globally
        python3 -m pip install --upgrade "${python_packages[@]}"
    fi
    
    log_success "Python development packages installed"
}

# Verify installation
verify_installation() {
    log_info "Verifying installation"
    
    echo "=== Installation Verification ==="
    
    # Check versions
    local checks=(
        "python3 --version"
        "pip --version || pip3 --version"
        "git --version"
        "rg --version"
        "fdfind --version || fd --version"
        "node --version"
        "npm --version"
        "nvim --version | head -1"
    )
    
    for check in "${checks[@]}"; do
        if eval "$check" 2>/dev/null; then
            log_success "$check"
        else
            log_warning "Failed: $check"
        fi
    done
    
    echo "================================"
}

# Cleanup function
cleanup() {
    log_info "Cleaning up temporary files"
    
    # Remove temporary files
    rm -rf /tmp/nvim-linux64.tar.gz
    rm -rf /tmp/nerd-fonts
    rm -rf /tmp/get-pip.py
    
    # Clean apt cache
    apt-get autoremove -y
    apt-get autoclean
    
    log_success "Cleanup completed"
}

# Main installation function
main() {
    log_info "Starting AstroNvim Server Installation"
    echo "================================================"
    
    # Pre-installation checks
    check_root
    detect_os
    
    # Installation steps
    configure_repositories
    install_base_packages
    install_python
    install_dev_tools
    install_nodejs
    install_neovim
    install_nerd_fonts
    install_astronvim_config
    install_python_packages
    
    # Post-installation
    verify_installation
    cleanup
    
    echo "================================================"
    log_success "AstroNvim installation completed successfully!"
    echo ""
    log_info "Next steps:"
    echo "1. Run 'nvim' to start Neovim"
    echo "2. Wait for plugins to install automatically"
    echo "3. Use ':Mason' to install additional LSP servers"
    echo "4. Check README.md for configuration details"
    echo ""
    log_info "Useful commands:"
    echo "- nvim --version: Check Neovim version"
    echo "- :checkhealth: Verify Neovim configuration"
    echo "- :Mason: Manage LSP servers and tools"
}

# Run main function
main "$@"
