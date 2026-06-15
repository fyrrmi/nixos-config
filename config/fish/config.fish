# Add M1 Homebrew binaries (critical for brew, git, etc.)
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
# npm global binaries
set -gx PATH $HOME/.npm-global/bin $PATH
# Personal scripts
set -gx PATH $HOME/scripts $PATH

starship init fish | source
# opencode
fish_add_path /Users/user/.opencode/bin
# Hermes Agent — ensure ~/.local/bin is on PATH
fish_add_path "$HOME/.local/bin"
