# Configs (Neovim, Zsh, Tmux, Bash, Vim, VSCode)

## Installation
You will find setup guides for each one in their READMEs:
- Neovim: [Neovim readme](neovim/README.md)
- Zsh: [Zsh readme](zsh/README.md)
- Tmux: [TMux readme](tmux/README.md)
- Bash: [Bash readme](bash/README.md)
- Vim: [Vim readme](vim/README.md)
- VSCode: [VSCode readme](vscode/README.md)

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

