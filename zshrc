# Poaclu's ZSH config

## Oh my zsh config

export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="candy"
ZSH_TMUX_AUTOSTART='true'
plugins=(aliases colored-man-pages fzf ufw zsh-interactive-cd)
source $ZSH/oh-my-zsh.sh

# Use shell rc (generic)
source $HOME/.shellrc

# Use aliases
source $HOME/.aliasrc

# command not found Requires pkgfile
source /usr/share/doc/pkgfile/command-not-found.zsh

# Launch Starship prompt
eval "$(starship init zsh)"

# Use zoxide instead of cd
eval "$(zoxide init zsh)"
alias cd="z"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
