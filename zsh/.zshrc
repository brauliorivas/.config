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

# >>> Codex installer >>>
export PATH="/home/brauliorivas/.local/bin:$PATH"
# <<< Codex installer <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/brauliorivas/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

. "$HOME/.cargo/env"

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

function copy_dev_template() {
  local src_dir="$HOME/.config"

  cp "$src_dir/flake.template.nix" ./flake.nix 2>/dev/null || echo "Missing flake.template.nix"
  cp "$src_dir/.envrc.template" ./.envrc 2>/dev/null || echo "Missing .envrc.template"
}

alias cd=z
alias ls=eza
alias cat=bat
alias grep=rg
alias top=btop
alias ps=procs
alias vi=nvim
alias locate=plocate
alias tree-sitter-cli=tree-sitter
alias hyprpicker=hyprpicker -a
alias fr=nix-direnv-reload

fastfetch

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
