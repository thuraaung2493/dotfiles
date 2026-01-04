#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

mkdir -p ~/.zsh ~/.config ~/.ssh

ln -sf "$DOTFILES/zsh/zshrc" ~/.zshrc
ln -sf "$DOTFILES/zsh/*.zsh" ~/.zsh/

ln -sf "$DOTFILES/git/config" ~/.gitconfig
ln -sf "$DOTFILES/git/ignore" ~/.gitignore_global

ln -sf "$DOTFILES/vim/vimrc" ~/.vimrc

if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --file="$DOTFILES/Brewfile"

echo "✅ Dotfiles and development tools installed"
