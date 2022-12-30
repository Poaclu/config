#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/poaclu/.byobu/prompt ] && . /home/poaclu/.byobu/prompt   #byobu-prompt#
