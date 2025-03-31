#!/bin/bash

# Определяем операционную систему
OS="$(uname)"

if [[ "$OS" == "Darwin" ]]; then
    echo "Определена MacOS"
    
    # Обновляем brew
    brew update
    
    # Устанавливаем Zsh, если он не установлен
    if ! command -v zsh &> /dev/null; then
        echo "Zsh не найден. Устанавливаем..."
        brew install zsh
    else
        echo "Zsh уже установлен."
    fi

elif [[ "$OS" == "Linux" ]]; then
    echo "Определен Linux"
    
    # Обновляем пакетный менеджер
    sudo apt update -y && sudo apt upgrade -y
    
    # Устанавливаем curl, если его нет
    if ! command -v curl &> /dev/null; then
        echo "Устанавливаем curl..."
        sudo apt install -y curl
    fi
    
    # Устанавливаем Zsh, если его нет
    if ! command -v zsh &> /dev/null; then
        echo "Устанавливаем Zsh..."
        sudo apt install -y zsh
    else
        echo "Zsh уже установлен."
    fi
else
    echo "Неизвестная операционная система. Скрипт поддерживает только MacOS и Linux."
    exit 1
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
