# Shell & Tmux Setup Guide

## Zsh Setup

### 1. Install Zsh & Oh-My-Zsh
```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 2. Install Plugins
```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-z (directory jumper)
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
```

### 3. Install Dependencies
```bash
# fzf (fuzzy finder)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# cowsay & fortune (optional, for fun startup messages)
sudo apt install cowsay fortune
```

### 4. Copy Config Files
```bash
cp .zshrc ~/
cp .zsh_functions ~/
cp .zsh_templates ~/
source ~/.zshrc
```

### 5. Set Zsh as Default
```bash
chsh -s $(which zsh)
```

## Bash Setup (Minimal)

### If You Use Bash Instead
```bash
cp .bashrc ~/
source ~/.bashrc
```

Most aliases/functions are zsh-specific, so bash is more basic.

## Tmux Setup

### 1. Install Tmux
```bash
sudo apt install tmux
```

### 2. Install TPM (Plugin Manager)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 3. Copy Config
```bash
cp .tmux.conf ~/
```

### 4. Install Plugins
```bash
# Start tmux
tmux

# Inside tmux: Press Ctrl+a then Shift+I (capital I)
# Wait for plugins to install
```

### 5. Dependencies
```bash
# For clipboard support
sudo apt install xclip

# For tmux-resurrect (session saving)
# Already handled by TPM
```

## Key Bindings

### Tmux
- `Ctrl+a` = Prefix (instead of Ctrl+b)
- `Ctrl+a c` = New window
- `Ctrl+a |` = Split vertical
- `Ctrl+a -` = Split horizontal
- `Ctrl+a n` = Split + open nvim
- `Ctrl+h/j/k/l` = Navigate panes (works with nvim too)
- `Ctrl+a r` = Reload config

### Zsh
- `Ctrl+R` = Search history (fzf)
- `z <dir>` = Jump to directory (zsh-z)
- `f` = Fuzzy find files (fzf with preview)

## Custom Functions (Zsh)

### Project Templates
- `C++` = Create C++ project with CMakeLists.txt
- `C` = Create C project with Makefile
- `Class` = Create C++ class (basic)
- `Class2` = Create C++ class (with subdirs)

### Utilities
- `Cmake` = Build with cmake
- `CC <file>` = Compile & run C file
- `Nasm <file>` = Assemble & link NASM file
- `mkcd <dir>` = mkdir + cd
- `add_executables_to_gitignore` = Auto-add to .gitignore
- `chmac` = Change MAC address (hardcoded interface)

## Verify Setup

### Zsh
```bash
echo $SHELL  # Should show /usr/bin/zsh
which zsh
```

### Tmux
```bash
tmux -V  # Check version
# Start tmux and check if prefix works
```

## Troubleshooting

### Zsh plugins not working
```bash
source ~/.zshrc
# Or restart terminal
```

### Tmux plugins not installing
```bash
# Remove and reinstall TPM
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Restart tmux, then Ctrl+a + I
```

### fzf not working
```bash
~/.fzf/install --all
source ~/.zshrc
```
