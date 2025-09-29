# Justin's Dotfiles

## nvim
Contains the directory structure for neovim config. Requires neovim 0.11+ 

### Install Dependencies
```sh
brew install tree-sitter

npm i -g vscode-langservers-extracted typescript-language-server typescript @tailwindcss/language-server
```

### Install configuration

> [!WARNING]  
> This clears all existing neovim configuration and replaces with this configuration, use with caution

`rsync -a ./nvim/ ~/.config/nvim/`

## tmux
Contains .tmux.conf to put in `~` that configures the look/bindings for tmux

### Install Dependencies
```sh
brew install tmux
```
