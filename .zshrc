# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.zsh/aliases
source $HOME/.zsh/scripts/command-chime/terminal_chime.zsh
#nvm for nodejs
#source /usr/share/nvm/init-nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
neofetch

export PATH="$PATH:/home/soup/bin/scripts"
export TERMINAL=kitty
#scripts
wallpaper() {
  ~/bin/scripts/walEngine.sh "$1"
  #kill -9 $PPID
}

export EDITOR=nvim
export VISUAL=nvim

function osdev(){
  export PATH="$HOME/opt/cross/bin:$PATH"
  export TARGET=i686-elf
}


# SSH_AUTH_SOCK="$HOME/.ssh-agent.socket"
# checks to see if SSH agent is running, if not, start it 
#
SSH_ENV="$HOME/.ssh/agent_env"

start_agent() {
  echo "Starting new ssh-agent"
  eval "$(ssh-agent -s)" >/dev/null
  # save env for new shells
  printf 'export SSH_AUTH_SOCK=%q\nexport SSH_AGENT_PID=%q\n' \
         "$SSH_AUTH_SOCK" "$SSH_AGENT_PID" >"$SSH_ENV"
  chmod 600 "$SSH_ENV"
  # add your key(s)
  ssh-add ~/.ssh/id_ed25519 2>/dev/null || ssh-add ~/.ssh/id_rsa 2>/dev/null
}

# If we have saved env, source it, then verify the agent is alive
if [ -f "$SSH_ENV" ]; then
  . "$SSH_ENV" >/dev/null
  # If socket missing or agent not responding, start a new one
  if ! [ -S "$SSH_AUTH_SOCK" ] || ! ssh-add -l >/dev/null 2>&1; then
    start_agent
  fi
else
  start_agent
fi

# Optional: Increase history size
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$HOME/.zsh_history"

# Share history between all sessions and write to file immediately
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Optional: additional history options
setopt HIST_IGNORE_DUPS   # Don't record an entry that was just recorded again
setopt HIST_SAVE_NO_DUPS  # Older duplicates are omitted
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry
setopt HIST_FIND_NO_DUPS  # Do not display a line previously found

