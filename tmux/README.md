# Tmux Setup

## 1. Install Tmux
```bash
sudo apt install tmux
```

## 2. Install TPM (Plugin Manager)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## 3. Copy Config
```bash
cp .tmux.conf ~/
```

## 4. Install Plugins
```bash
# Start tmux
tmux

# Inside tmux: Press Ctrl+a then Shift+I (capital I)
# Wait for plugins to install
```

## 5. Dependencies
```bash
# For clipboard support
sudo apt install xclip

# For tmux-resurrect (session saving)
# Already handled by TPM
```

# Key Bindings

## Tmux
- `Ctrl+a` = Prefix (instead of Ctrl+b)
- `Ctrl+a c` = New window
- `Ctrl+a |` = Split vertical
- `Ctrl+a -` = Split horizontal
- `Ctrl+a n` = Split + open nvim
- `Ctrl+h/j/k/l` = Navigate panes (works with nvim too)
- `Ctrl+a r` = Reload config

