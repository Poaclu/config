# Poaclu's ZSH config
clear
export VISUAL=bat
export EDITOR=nvim

#welcome command
fastfetch

## Powerline

powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## Oh my zsh config

export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="candy"
ZSH_TMUX_AUTOSTART='true'
plugins=(git
	tmux)
source $ZSH/oh-my-zsh.sh

### ALIASES ###

# Changing "ls" to "exa"sudo pacman -S git dlang-dmd
alias ls='exa -lah --color=always --group-directories-first'

# Fixing ln to help
alias ln="ln -rsf"

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -virf"

# bare git repo alias for dotfiles
alias dots="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# use neovim instead of vim
alias vim="nvim"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# help kitty terminal with ssh
alias ksh="kitty +kitten ssh"

#few shortcuts just in case
alias ..='cd ..'

#just a troll
alias hackwow="cmatrix | lolcat"

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"

#continue download
alias wget="wget -c"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#clear shortcut
alias cls="clear && fastfetch"

#Shutdown and reboot shortcuts
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#from tech titus
alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

alias su="su -l"
alias docker="podman"
alias ytop="ytop -abps"

#Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# Use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

# sudo not required for some system commands
for command in mount umount sv pacman updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

# Add stuff to PATH
export PATH=$PATH:/home/poaclu/.cargo/bin:/home/poaclu/.local/bin:/var/lib/snapd/snap/bin

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

plugins=(vscode archlinux lol man)

# Thefuck
eval $(thefuck --alias)

### SETTING THE STARSHIP PROMPT ###
#eval "$(starship init zsh)"
