# General
alias cl=clear
alias reload="source ~/.zshrc"

# SSH
alias sshconfig="vi ~/.ssh/config"

# Finder
alias o="open ."
alias clock="tuime -f SevenSeg -g '#f5e0dc' -g '#cdd6f4' -g '#f2cdcd' -g '#cba6f7'"
alias ls=lsd
alias ll="ls -l"
alias llah="ls -lah"
alias la="ls -a"
alias lt="ls --tree"

# lock screen
alias afk="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# IP addresses
alias ip='curl -fsSL -4 https://1.1.1.1/cdn-cgi/trace | awk -F= "/^ip=/{print \$2}"'
alias localip="ipconfig getifaddr en0"

# VS Code
alias codei="code-insiders ."
alias co="code ."

# Node.js / npm / pnpm
alias ni="npm install"
alias ns="npm start"
alias nb="npm run build"
alias pn=pnpm
alias pnx="pnpm dlx"

# Git
alias gi="git init"
alias gaa="git add ."
alias ga="git add"
alias gm="git commit -m "
alias gs="git status"
alias gpo="git push origin"
alias gb="git branch"
alias gcb="git checkout -b"
alias gc="git checkout"
alias wip="git add . && git commit -m 'wip🚧🚧'"
alias nah="git reset --hard && git clean -df"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Composer
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"

# Laravel
alias a="php artisan"
alias pas="php artisan serve"
alias tinker="php artisan tinker"
alias rl="php artisan route:list"
alias fresh="php artisan migrate:fresh"
alias m="php artisan migrate"
alias mfs='php artisan migrate:fresh --seed'
alias pat='php artisan test'
alias patf='php artisan test --filter'
alias oc='php artisan optimize:clear'

# PHP Unit Test
alias p="./vendor/bin/pest"
alias pf="./vendor/bin/pest --filter"
alias ppc="./vendor/bin/pest --parallel --compact"

# MySQL
alias mysql-start="mysql.server start"
alias mysql-stop="mysql.server stop"

# Redis
alias redis-start="brew services start redis"
alias redis-stop="brew services stop redis"
alias redis-restart="brew services restart redis"
alias redis-monitor="redis-cli monitor"
alias flush-redis="redis-cli FLUSHALL"

# Docker
alias dc=docker-compose

# Directory
alias ..='cd ..'
alias ...='cd ../..'
alias dev="cd ~/dev/"
alias works='cd ~/works'
alias hana='cd ~/works/hana'
alias dashboard='cd ~/works/hana/dashboard'
alias middleware='cd ~/works/hana/middleware'
alias fieldapp='cd ~/works/hana/field-app-home-ui-and-offline-hana-app'
alias clientapp='cd ~/works/hana/client-app-front-page-ui'
alias api='cd ~/works/hana/hana-web-app-api/api'
alias devops='cd ~/works/hana/devops/docker/API'