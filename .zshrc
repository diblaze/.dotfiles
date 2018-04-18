# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/diblaze/.oh-my-zsh

source /usr/share/zsh/share/antigen.zsh

COMPLETION_WAITING_DOTS="true"


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

#default
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

#Plugins
#antigen bundle colored-man
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle djui/alias-tips

antigen apply

#NVM
source /usr/share/nvm/init-nvm.sh

alias cls=clear
alias grb="sudo grub-reboot 2 && reboot"
export ANDROID_HOME=/opt/android-sdk

screenfetch

alias ls='ls --color=auto'
alias vim="nvim"
alias aur="yaourt"

alias cls='printf "\033c"; screenfetch'
alias g++='g++ -Wall -Wextra -Weffc++ -pedantic'
#alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias sus="systemctl suspend"
alias hib="systemctl hibernate"

eval $(thefuck --alias)
source /usr/share/nvm/init-nvm.sh
export ANDROID_HOME=/home/deniii/Android/Sdk
export ANDROID_SDK_ROOT=/home/deniii/Android/Sdk

#PATH
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH=$PATH:$HOME/bin/pintos

#PINTOS
alias cdpintos="cd ~/Git/IDA/pintos/src/userprog"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"
