# Poaclu's ZSH config

## Powerline

powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

## Oh my zsh config

export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="candy"
ZSH_TMUX_AUTOSTART='true'
plugins=(git
	archlinux
	lol
	man
	tmux)
source $ZSH/oh-my-zsh.sh

# Use shell (generic) rc
source $HOME/.shellrc

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
