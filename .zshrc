# --- Powerlevel10k instant prompt (must stay near the top) ---
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Completion (before antidote so compdef/fzf-tab work) ---
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # case-insensitive

# --- Antidote plugin manager ---
source "$HOME/.antidote/antidote.zsh"
antidote load   # reads ~/.zsh_plugins.txt

# --- Powerlevel10k theme ---
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE \
       HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS
export HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|pwd|* --help)"

# --- Navigation niceties ---
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS

# --- zoxide (smarter cd) ---
eval "$(zoxide init zsh)"
alias cd='z'

# --- pkgfile "command not found" handler ---
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && \
  source /usr/share/doc/pkgfile/command-not-found.zsh

# --- Colored man pages ---
export LESS_TERMCAP_md="$(tput bold 2>/dev/null; tput setaf 2 2>/dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2>/dev/null)"

# --- Modern CLI aliases ---
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias la='eza -a --icons'
alias lt='eza --tree --icons'
alias cat='bat'

# --- CachyOS / Arch aliases ---
alias make="make -j$(nproc)"
alias ninja="ninja -j$(nproc)"
alias n="ninja"
alias c="clear"
alias rmpkg="sudo pacman -Rsn"
alias cleanch="sudo pacman -Scc"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias update="sudo pacman -Syu"
alias jctl="journalctl -p 3 -xb"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias tb="nc termbin.com 9999"
alias apt="man pacman"
alias apt-get="man pacman"
alias please="sudo"

# --- fzf keybindings ---
export FZF_BASE=/usr/share/fzf
source <(fzf --zsh) 2>/dev/null

# --- Autosuggestions tweak ---
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
