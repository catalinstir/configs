# Zsh Setup

## 1. Install Zsh & Oh-My-Zsh
```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 2. Install Plugins
```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-z (directory jumper)
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
```

## 3. Install Dependencies
```bash
# fzf (fuzzy finder)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### 4. Copy Config Files
```bash
cp .zshrc ~/

# Create a ~/.zsh directory for the other config files
mkdir -p ~/.zsh
cp zsh/.zsh_functions ~/.zsh/
cp zsh/.zsh_templates ~/.zsh/
cp zsh/.zsh_aliases ~/.zsh/

source ~/.zshrc
```

### 5. Set Zsh as Default
```bash
chsh -s $(which zsh)
```
