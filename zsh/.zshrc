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
export EDITOR=nvim

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
  you-should-use
  colored-man-pages
)
source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config $HOME/.config/night-owl.omp.json)"
eval "$(zoxide init zsh)"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias grep=rg
alias find=fd
alias top=btop
alias ps=procs
alias cat=bat
alias vi=nvim
alias tree-sitter-cli=tree-sitter
alias ls=eza
alias hyprpicker=hyprpicker -a
alias locate=plocate

fastfetch
