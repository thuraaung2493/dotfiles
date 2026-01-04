nvm_find_nvmrc() {
  return 1
}

export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"

nvm_lazy_load() {
  unset -f node npm npx nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

nvm() { nvm_lazy_load; nvm "$@"; }
node() { nvm_lazy_load; node "$@"; }
npm() { nvm_lazy_load; npm "$@"; }
npx() { nvm_lazy_load; npx "$@"; }

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"


# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/blackmonster/Library/Application Support/Herd/config/php/85/"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/blackmonster/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/blackmonster/Library/Application Support/Herd/config/php/74/"