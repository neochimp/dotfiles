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
