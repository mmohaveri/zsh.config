# ZSH Config

This repository contains my zsh configuration.

To use is simply clone it in your `~/.config` directory and
create a symbolic link from `zshrc` to `~/.zshrc`.

```bash
git clone --recurse-submodules git@github.com:mmohaveri/zsh.config.git ~/.config/zsh
ln -s ~/.config/zsh/zshrc ~/.zshrc
```

This config relies on following external dependencies:

1. [Starship](https://github.com/starship/starship) for its prompt
  - Can be installed either by `curl -sS https://starship.rs/install.sh | sh` or `cargo install starship --locked`
