# nixos-config

> [!WARNING]
> personal nixos configuration, built from scratch as a learning project.
> it's a work in progress, not a reference setup.

## TO-DO:
dig into hjem and see if its worth replacing home-manager
find an alternative to rofi
dig into foot terminal

modular flake-based config supporting two machines. home-manager is used in
minimal mode — it manages symlinks to native dotfiles only, never via the
`programs.*` options. native config files in `config/` remain the single
source of truth.

## hosts

| name | machine | gpu |
|---|---|---|
| `navi` | thinkpad x1 carbon gen 12
| `games` | asus tuf desktop, i7-13700kf | nvidia rtx 4070

`games` is a work in progress (placeholder modules, full install coming).

## structure

```
nixos-config/
├── flake.nix              # inputs (nixpkgs unstable + home-manager), declares hosts
├── hosts/
│   ├── navi/              # thinkpad: default.nix + hardware.nix
│   └── games/              # desktop (wip)
├── modules/               # reusable system modules, opt-in per host
│   ├── core/              # boot, locale, networking, nix daemon, users
│   ├── desktop/           # hyprland, sddm, audio, fonts, printing
│   ├── hardware/          # intel, nvidia, bluetooth
│   └── programs/          # gaming (steam + controllers)
├── home/                  # home-manager — symlinks only
├── config/                # native dotfiles (hyprland.lua, kitty.conf, etc.)
└── wallpapers/
```

## rebuild

```sh
sudo nixos-rebuild switch --flake .#<hostname>
```

where `<hostname>` is `navi` or `games`.

reminder: flakes only see git-tracked files. after creating or editing any
file in the repo, `git add` it before rebuilding.

## dotfiles workflow

- system packages are declared in nix modules under `modules/`
- native dotfiles (`.conf`, `.lua`, `.toml`) live in `config/<tool>/`
- at rebuild time, home-manager creates symlinks from `~/.config/<tool>/`
  to the matching files in `config/<tool>/`
- home-manager's `programs.*` and `wayland.*` options are intentionally
  avoided — keeping native dotfiles as the single source of truth

## desktop

- session: hyprland (default), kde plasma 6 as fallback
- display manager: sddm
- launcher: rofi
- status bar: wayle
- terminal: kitty
- shell: fish + starship
- lock screen: hyprlock
- wallpaper: awww

## system

- network: networkmanager + tailscale + mullvad vpn
- audio: pipewire
- automatic nix garbage collection (weekly, keeps 7 days of generations)
- firefox enabled at system level
