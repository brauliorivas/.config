HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt beep extendedglob nomatch
unsetopt autocd notify
bindkey -v
zstyle :compinstall filename '~/.config/zsh/.zshrc'
autoload -Uz compinit
compinit

export ZSH="$HOME/.config/ohmyzsh"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  you-should-use
  colored-man-pages
)
source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config $HOME/.config/night-owl.omp.json)"
eval "$(zoxide init zsh)"

export EDITOR=nvim

alias grep=ripgrep
alias find=fd
alias top=btop
alias ps=procs
alias cat=bat
alias vi=nvim

fastfetch
