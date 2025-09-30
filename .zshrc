# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.zsh/aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
neofetch

export PATH="$PATH:/home/soup/bin/scripts"
export TERMINAL=kitty
#scripts
wallpaper() {
  ~/.zsh/scripts/walEngine.sh "$1"
  #kill -9 $PPID
}

export EDITOR=nvim
export VISUAL=nvim

function osdev(){
  export PATH="$HOME/opt/cross/bin:$PATH"
  export TARGET=i686-elf
}

# SSH_AUTH_SOCK="$HOME/.ssh-agent.socket"
# checks to see if SSH agent is running, if it is it'll process its process id number

[ -z "$SSH_AGENT_PID" ] &&
export SSH_AGENT_PID=$(ps ux | grep -w ssh-agent | grep -vwE 'defunct|grep' | grep -wm1 "$SSH_AUTH_SOCK" | awk '{print $2}')

[ -n "$SSH_AGENT_PID" ] && [ -z "$SSH_AUTH_SOCK" ] &&
export SSH_AUTH_SOCK=$( (ps "$SSH_AGENT_PID" | grep -w -- '-a' | sed "s/.* -a //;s/ .*//" | grep -- /) || (find /tmp/ssh-* -name \*$(($SSH_AGENT_PID-1)) -o -name \*$(($SSH_AGENT_PID-2)) -type s 2> /dev/null) )

( [ -z "$SSH_AGENT_PID" ] || [ -z "$SSH_AUTH_SOCK" ] ) &&
eval $(ssh-agent $([ -n "$SSH_AUTH_SOCK" ] && rm -f "$SSH_AUTH_SOCK" && echo -n "-a $SSH_AUTH_SOCK") -s) 1> /dev/null
