# nixos-config

> [!WARNING]
> my personal nixos configuration is built from scratch as a learning project
> it's a work in progress, not a reference setup

## structure

- `flake.nix` — entry point, pins nixpkgs to the unstable channel
- `configuration.nix` — main system config, imports the modules below
- `desktop.nix` — display, session, audio, and wayland desktop pieces
- `gaming.nix` — steam + nintendo controller support, split into its own module
- `config/` — native dotfiles, mirrors `~/.config/`

## desktop

- session: hyprland (default), with kde plasma 6 as a fallback
- launcher: rofi
- status bar: wayle
- wallpaper: awww
- lock screen: hyprlock
- audio: pipewire

## system

- network: networkmanager, with tailscale and mullvad vpn
- shell: fish
- firefox enabled at system level
- automatic garbage collection (weekly, keeps 14 days of generations)

## notes

dotfiles workflow: packages are declared in nix, but the native config files
live under `config/<tool>/` in this repo and are symlinked to `~/.config/<tool>/`.
home-manager is intentionally not used for now
