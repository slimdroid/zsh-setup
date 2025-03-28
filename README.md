# Ultimate guide Oh my zsh for Macbook on Apple Silicon.

## Install [Homebrew](https://github.com/robbyrussell/oh-my-zsh){:target="_blank" rel="noopener noreferrer"}

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
If Homebrew already installed, just update all package definitions (formulae) and Homebrew itself:
```bash
brew update
```

## Install [ZSH](https://www.zsh.org/)
```bash
brew install zsh
```

### Set zsh as your default shell
```bash
chsh -s $(which zsh)
```

## Install [GIT](https://git-scm.com/)
```zsh
brew install git
```

##  Install [Oh My ZSH](https://ohmyz.sh/)
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Plugins for OMZ

## Install [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/)
### 1. Clone this repository in oh-my-zsh's plugins directory:

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 2. Activate the plugin in `~/.zshrc`:
### Note that zsh-syntax-highlighting must be the last plugin sourced.

```zsh
plugins=( [plugins...] zsh-syntax-highlighting)
```

## Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/)
### 1. Clone this repository in oh-my-zsh's plugins directory:

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### 2. Add the plugin to the list of plugins for Oh My Zsh to load (inside`~/.zshrc`):

```zsh
plugins=(
    # other plugins...
    zsh-autosuggestions
)
```

## Setup Theme for OMZ
https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh

https://gist.github.com/kevin-smets/8568070

Other plugins:
 - eza
 - mc
 - htop
 - tmux

Select Text Editor by Default

Set VS Code CLI

Set Fleet CLI


## Reopen terminal


### Happy?
<a href="https://www.buymeacoffee.com/slimdroid" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
