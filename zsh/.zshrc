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

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
  you-should-use
  colored-man-pages
  tmux
)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config $HOME/.config/night-owl.omp.json)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

copy_dev_template() {
  local src_dir="$HOME/.config"

  cp "$src_dir/flake.template.nix" ./flake.nix 2>/dev/null || echo "Missing flake.template.nix"
  cp "$src_dir/.envrc.template" ./.envrc 2>/dev/null || echo "Missing .envrc.template"
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
alias fr=nix-direnv-reload

fastfetch
