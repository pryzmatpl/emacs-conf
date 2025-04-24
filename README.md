# Modern Emacs Configuration

A modular, optimized Emacs configuration with support for multiple programming languages and modern development features.

## Features

- **Modern UI**: Doom themes and modeline for a clean, attractive interface
- **Language Support**: C/C++, Rust, Python, PHP, Java, JavaScript/TypeScript, React, Vue
- **Development Tools**: LSP integration, code completion, syntax checking, debugging
- **Intuitive Navigation**: Project management, fuzzy finding, tree view
- **Optimized Performance**: Native compilation, deferred loading, garbage collection tuning
- **Modular Design**: Easy to understand, modify, and share across systems

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/emacs-config.git ~/.emacs.d
```

### 2. Install LSP Servers

Install the required Language Server Protocol servers for your development needs:

```bash
# JavaScript/TypeScript/React/Vue
npm install -g typescript-language-server @volar/vue-language-server

# Python
pip install python-lsp-server

# C/C++
# On Ubuntu/Debian:
sudo apt install clangd
# On Arch Linux:
sudo pacman -S clang

# Rust
rustup component add rust-analyzer

# Java
# LSP-Java downloads Eclipse JDT Language Server automatically

# PHP
npm install -g intelephense
```

### 3. Launch Emacs

The configuration will automatically download and install all required packages on the first launch.

## Structure

- `init.el`: Main entry point
- `early-init.el`: Early initialization for better startup performance
- `lisp/packages.el`: Package management
- `lisp/ui.el`: User interface configuration
- `lisp/lang.el`: Programming language support
- `lisp/keybindings.el`: Key bindings and shortcuts
- `custom.el`: Machine-specific settings (git-ignored)

## Key Bindings

### General
- `M-x`: Run command (enhanced with Ivy)
- `C-x C-f`: Find file
- `C-x b`: Switch buffer
- `C-c p`: Projectile commands
- `C-c t`: Toggle Treemacs file browser
- `M-/`: Comment/uncomment region
- `C-x g`: Magit status

### LSP (Language Server Protocol)
- `C-c l r`: Rename symbol
- `C-c l f`: Format buffer
- `C-c l a`: Code actions
- `C-c l d`: Go to definition
- `C-c l i`: Find implementation
- `C-c l s`: Find references

### Debugging (DAP-Mode)
- `C-c d`: Start debugging
- `C-c d b`: Toggle breakpoint
- `C-c d c`: Continue
- `C-c d n`: Next step
- `C-c d s`: Step in
- `C-c d o`: Step out
- `C-c d r`: Restart
- `C-c d q`: Disconnect

## Customization

To add your own customizations without modifying the core files:

1. Create a file in the `lisp` directory (e.g., `lisp/custom-config.el`)
2. Add your customizations
3. Require it in `init.el` by adding `(require 'custom-config)` before the load of `custom.el`

Machine-specific settings will be saved in `custom.el`, which is ignored by Git.

## Troubleshooting

- If you encounter any issues with LSP, check that the corresponding language server is installed and in your PATH
- For package-specific problems, try refreshing packages with `M-x package-refresh-contents`
- Emacs will show warnings in the `*Warnings*` buffer if there are issues with the configuration 