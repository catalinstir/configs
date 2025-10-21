# Neovim Setup Guide

## 1. Install Neovim

```bash
# Download AppImage (need Neovim ver >= 0.11)
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# mock link, search the proper AppImage on the official site
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```

## 2. Install lazy.nvim

```bash
git clone --filter=blob:none https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim
```

## 3. Copy Config Files

Ensure `~/.config/nvim` has this structure:
```
~/.config/nvim/
├── init.lua
├── lazy-lock.json
└── lua/
    ├── config.lua
    └── config/
        ├── options.lua
        ├── keymaps.lua
        ├── lsp.lua
        ├── cmp.lua
        ├── colorscheme.lua
        ├── lazy.lua
        └── plugins/
            ├── ui.lua
            ├── lsp.lua
            ├── mason.lua
            ├── cmp.lua
            ├── treesitter.lua
            ├── telescope.lua
            ├── conform.lua
            ├── harpoon.lua
            ├── flash.lua
            ├── autopairs.lua
            ├── tmux-navigator.lua
            ├── vimtex.lua
            ├── catppuccin.lua
            └── kanagawa.lua
```

## 4. Install Dependencies

### Node.js & npm (for LSPs and formatters)
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
```

### Python & pip
```bash
sudo apt install python3 python3-pip python3-venv
```

### Rust (for some formatters)
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Build essentials
```bash
sudo apt install build-essential clang cmake
```

### Ripgrep (for Telescope live_grep)
```bash
sudo apt install ripgrep
```

### fd (optional, better file finding)
```bash
sudo apt install fd-find
```

## 5. First Launch

```bash
nvim
```

Lazy will automatically:
- Install all plugins
- Download language parsers
- Set up Mason

Wait for everything to complete (watch bottom of screen).

## 6. Install LSP Servers & Formatters

```vim
:Mason
```

Install these (use `/` to search, `i` to install):
- **LSPs**: clangd, rust-analyzer, pyright, typescript-language-server, lua-language-server, css-lsp, jdtls, omnisharp, texlab
- **Formatters**: stylua, clang-format, prettier, black, isort
- **DAP** (optional): codelldb, debugpy

Or install via command line:
```bash
# Formatters via npm/pip/cargo
npm install -g prettier
pip install black isort
cargo install stylua
```

## 7. Clang-format Configuration

Use the `.clang-format` file in your project or in home (`~/.clang-format`).
```bash
nvim ~/.clang-format
```

## 8. Install Nerd Font (for icons)

```bash
# Download a Nerd Font (e.g., JetBrainsMono)
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -fv

# Set terminal font to "JetBrainsMono Nerd Font"
```

## 9. Optional: Tmux Integration

```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy .tmux.conf to ~/
# Then in tmux: Ctrl+a + I (capital i) to install plugins
```

## 10. Verify Everything

```vim
:checkhealth
```

Look for:
- lazy.nvim
- mason
- lspconfig
- treesitter
- telescope
- conform

## Key Bindings Cheatsheet

### General
- `<leader>` = Space
- `;` = `:` (command mode)
- `K` = Show hover info

### Files
- `<leader>ff` = Find files
- `<leader>fg` = Live grep
- `<leader>tt` = Toggle file tree

### Harpoon
- `<leader>ha` = Add file
- `<leader>hr` = Remove file
- `<leader>hc` = Clear all
- `<C-e>` = Toggle menu (Don't use in NvimTree)
- `<leader>1-4` = Jump to file

### Tabs
- `<leader>tn` = New tab
- `<leader>tc` = Close tab
- `<leader>te` = Open terminal in new tab
- `<Tab>` / `<S-Tab>` = Next/Prev tab
- `<M-1>` to `<M-9>` = Go to tab 1-9

### Formatting
- `<leader>fm` = Format file/selection (formats on save too)

### LSP
- `<leader>e` = Show diagnostic
- `<leader>q` = Diagnostic quickfix

### Clipboard
- `<leader>y/d/p/P` = Clipboard ops

### Navigation (with tmux)
- `<C-h/j/k/l>` = Move between splits/tmux panes

## Troubleshooting

### Plugins not loading
```vim
:Lazy sync
```

### LSP not working
```vim
:LspInfo
:Mason
```

### Treesitter errors
```vim
:TSUpdate
```

### Reset everything
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
# Then restart nvim
```
