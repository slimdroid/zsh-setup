#!/bin/bash

# Обновляем систему
brew update

# Устанавливаем Zsh, если он не установлен
if ! command -v zsh &> /dev/null; then
    echo "Zsh не найден. Устанавливаем..."
    brew install zsh
else
    echo "Zsh уже установлен."
fi

# Устанавливаем Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Устанавливаем Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
else
    echo "Oh My Zsh уже установлен."
fi

# Устанавливаем плагины
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Устанавливаем zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting уже установлен."
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Устанавливаем zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions уже установлен."
fi

# Добавляем плагины в .zshrc
if ! grep -q "plugins=(.*zsh-syntax-highlighting.*)" ~/.zshrc; then
    sed -i '' 's/plugins=(/plugins=(zsh-syntax-highlighting zsh-autosuggestions /' ~/.zshrc
fi

echo "Перезапускаем shell..."
exec zsh
