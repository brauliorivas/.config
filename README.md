# .config

Don't forget to do:
```bash
cp $HOME/.config/zsh/.zshenv $HOME/.zshenv

wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

ZSH=$HOME/.config/ohmyzsh sh install.sh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH_CUSTOM/plugins/zsh-vi-mode
```

Autoload a nix flake
```bash
echo "use flake" >> .envrc && direnv allow
```
