# Neovide setup

## Instalation 
Universal: [AppImage](https://github.com/neovide/neovide/releases)
```bash
chmod +x Neovide-x86_64.AppImage
./Neovide-x86_64.AppImage

# create softlink
sudo ln -s $(realpath Neovide-x86_64.AppImage) /usr/local/bin/neovide
```

## Setup
Copy the `config.toml` file to `~/.config/neovide/`.

> [!IMPORTANT]
> There are `neovim` setting for neovide present in `options.lua`
