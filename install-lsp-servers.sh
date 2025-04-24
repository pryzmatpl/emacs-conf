#!/bin/bash
# install-lsp-servers.sh - Install LSP servers for Emacs configuration
# Usage: ./install-lsp-servers.sh [all|js|python|cpp|rust|php|java]

set -e

echo "Installing LSP servers for Emacs configuration..."

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
elif [ -f /etc/debian_version ]; then
    OS="Debian"
elif [ -f /etc/arch-release ]; then
    OS="Arch Linux"
elif [ -f /etc/fedora-release ]; then
    OS="Fedora"
else
    OS="Unknown"
fi

echo "Detected OS: $OS"

install_js_servers() {
    echo "Installing JavaScript/TypeScript/Vue language servers..."
    npm install -g typescript-language-server typescript
    npm install -g @volar/vue-language-server
    npm install -g @vue/language-server
    echo "JavaScript/TypeScript/Vue LSP servers installed."
}

install_python_servers() {
    echo "Installing Python language server..."
    pip install --user python-lsp-server[all]
    pip install --user pylsp-mypy pyls-isort python-lsp-black
    echo "Python LSP server installed."
}

install_cpp_servers() {
    echo "Installing C/C++ language server (clangd)..."
    if [[ "$OS" == "Ubuntu"* || "$OS" == "Debian"* ]]; then
        sudo apt update
        sudo apt install -y clangd
    elif [[ "$OS" == "Arch"* ]]; then
        sudo pacman -Sy --noconfirm clang
    elif [[ "$OS" == "Fedora"* ]]; then
        sudo dnf install -y clang-tools-extra
    else
        echo "Could not identify your distribution. Please install clangd manually."
    fi
    echo "C/C++ language server installed."
}

install_rust_servers() {
    echo "Installing Rust language server..."
    if command -v rustup &> /dev/null; then
        rustup component add rust-analyzer
    else
        echo "rustup not found. Please install Rust first: https://rustup.rs/"
    fi
    echo "Rust language server installed."
}

install_php_servers() {
    echo "Installing PHP language server..."
    npm install -g intelephense
    echo "PHP language server installed."
}

install_java_servers() {
    echo "Java LSP server will be automatically downloaded by lsp-java."
    echo "Ensure you have Java JDK installed on your system."
    if [[ "$OS" == "Ubuntu"* || "$OS" == "Debian"* ]]; then
        echo "You can install JDK with: sudo apt install default-jdk"
    elif [[ "$OS" == "Arch"* ]]; then
        echo "You can install JDK with: sudo pacman -S jdk-openjdk"
    elif [[ "$OS" == "Fedora"* ]]; then
        echo "You can install JDK with: sudo dnf install java-latest-openjdk-devel"
    fi
}

case "$1" in
    "js"|"javascript"|"typescript"|"vue")
        install_js_servers
        ;;
    "python"|"py")
        install_python_servers
        ;;
    "cpp"|"c++"|"c")
        install_cpp_servers
        ;;
    "rust")
        install_rust_servers
        ;;
    "php")
        install_php_servers
        ;;
    "java")
        install_java_servers
        ;;
    "all"|"")
        install_js_servers
        install_python_servers
        install_cpp_servers
        install_rust_servers
        install_php_servers
        install_java_servers
        ;;
    *)
        echo "Unknown option: $1"
        echo "Usage: ./install-lsp-servers.sh [all|js|python|cpp|rust|php|java]"
        exit 1
        ;;
esac

echo "LSP server installation complete!"
echo "You may need to restart Emacs for the changes to take effect." 