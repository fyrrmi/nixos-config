# homebrew formulae (bash, handbrake, mole) — en fin de PATH,
# nix passe devant en cas de conflit
set -gx PATH $PATH /opt/homebrew/bin /opt/homebrew/sbin
# npm global binaries
set -gx PATH $HOME/.npm-global/bin $PATH
# Personal scripts
set -gx PATH $HOME/scripts $PATH

starship init fish | source
# opencode
fish_add_path /Users/user/.opencode/bin
# Hermes Agent — ensure ~/.local/bin is on PATH
fish_add_path "$HOME/.local/bin"
