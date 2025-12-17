if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


if [ -x "$(command -v exa)" ]; then
    alias ls="exa"
    alias la="exa --long --all --group"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"


export PATH="/home/prav/.cargo/bin:$PATH"
export PATH="/usr/bin/alacritty:$PATH"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH_THEME="~/powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"

alias vim="nvim"
alias py3="python3"
alias theme="~/.config/alacritty/change-theme.sh"
alias vol="pavucontrol"
alias files="caja"
alias horny="wine ~/Downloads/SummertimeSaga-0-20-16-pc/SummertimeSaga.exe"
alias compress="tar -cJvf"
alias pref="PureRef"

# ENV VARS
export VIM_HOME=~/.config/nvim
export REPOS_HOME=~/repos
export POPCORN=~/personal/Popcorn

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
