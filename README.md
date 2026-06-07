# nixos-config

> [!WARNING]
> this is my **personal** nixos configuration, built from scratch as a
> learning project. it is tailored to my own machines and habits, so most of
> it will not work out of the box for you. treat it as something to read and
> borrow from, not a turnkey setup.

a modular, flake-based configuration driving two machines from a single repo.
dotfiles are managed by [hjem](https://github.com/feel-co/hjem) in symlink-only
mode: native config files in `config/` are the single source of truth, and hjem
just links them into place. no `programs.*`-style config generation.

## foreword

i'm learning linux and nix in the open. this repo is the practice ground. the
goal is to understand rather than to assemble the flashiest setup, so things are kept deliberately small and explicit. 
if a choice looks naive, it probably reflects where i was in the learning curve when
i made it.

## hosts

| name | machine | gpu | role |
|---|---|---|---|
| `navi` | thinkpad x1 carbon gen 12 (meteor lake) | intel arc (integrated) | laptop, daily driver |
| `games` | asus tuf gaming h770-pro, i7-13700kf | nvidia rtx 4070 | desktop, gaming |

the main per-host differences:

- **navi** is a laptop, so it enables power management and ships `powertop`.
  its hidpi panel runs at a fractional hyprland scale.
- **games** has the nvidia proprietary driver, steam and gaming tweaks,
  coolercontrol and runs its display at scale 1.
- **wayle** (the status bar) reads a different `runtime.toml` per host, since
  navi needs a battery indicator and games does not.

## structure

```
nixos-config/
├── flake.nix              # inputs (nixpkgs unstable + hjem), declares both hosts
├── hosts/
│   ├── navi/              # thinkpad: default.nix + hardware.nix
│   └── games/             # desktop: default.nix + hardware.nix
├── modules/               # reusable system modules, imported per host
│   ├── core/              # boot, locale, networking, nix daemon, users
│   ├── desktop/           # hyprland, sddm, audio, fonts, printing, hjem
│   ├── hardware/          # intel, nvidia, bluetooth
│   └── programs/          # cli, apps, office, gaming
├── config/                # native dotfiles (hyprland.lua, kitty.conf, etc.)
└── wallpapers/
```

modules are opt-in: each host imports only the ones it needs. `modules/desktop`
pulls in the shared graphical stack, while `modules/desktop/hjem.nix` declares
the dotfile symlinks.


## dotfiles workflow

- system packages are declared in nix modules under `modules/`
- native dotfiles (`.conf`, `.lua`, `.toml`, `.jsonc`) live in `config/<tool>/`
- at rebuild time, hjem links `~/.config/<tool>/...` to the matching files in
  `config/<tool>/`
- editing a dotfile and reloading the tool is **not** enough: hjem links point
  into the nix store, not the live repo, so a change only takes effect after a
  rebuild
- hjem refuses to overwrite an existing file by default (`clobberFiles = false`),
  which mirrors the old home-manager backup behaviour

## desktop

- session: hyprland (default), kde plasma 6 as fallback
- display manager: sddm
- launcher: rofi
- status bar: wayle
- terminal: kitty
- shell: fish + starship
- lock screen: hyprlock
- image viewer: imv (might change soon)

## system

- network: networkmanager + tailscale + mullvad
- secret service: gnome-keyring
- automatic nix gb collection
