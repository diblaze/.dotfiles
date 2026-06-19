# ~/.zshrc

# --- Antidote plugin manager ---
source /usr/share/zsh-antidote/antidote.zsh
antidote load   # reads ~/.zsh_plugins.txt

# --- Prompt ---
eval "$(starship init zsh)"

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE
export HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|pwd|* --help)"

# --- Completion ---
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # case-insensitive

cleanup() {
  local orphans
  orphans=$(pacman -Qtdq)
  [[ -n "$orphans" ]] && sudo pacman -Rsn $orphans || echo "No orphans to remove."
}

# --- pkgfile "command not found" handler (Arch-native, better than OMZ's) ---
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

# --- CachyOS / Arch aliases (kept from default config) ---
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
# Arch newcomer helpers
alias apt="man pacman"
alias apt-get="man pacman"
alias please="sudo"

# --- fzf keybindings (Ctrl+R history, Ctrl+T files) ---
export FZF_BASE=/usr/share/fzf
source <(fzf --zsh) 2>/dev/null


# --- Autosuggestions tweak ---
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
