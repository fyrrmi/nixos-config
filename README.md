# nixos-config

> [!WARNING]
> Documentatiom might be out-of-date.
> this is my **personal** nix configuration, built from scratch as a
> learning project. it is tailored to my own machines and habits, so most of
> it will not work out of the box for you.

dotfiles are managed by
[hjem](https://github.com/feel-co/hjem) in symlink-only mode: native config
files in `config/` are the single source of truth, and hjem just links them
into place.

## foreword

i'm learning linux and nix in the open. this repo is the practice ground. the
goal is to understand rather than to assemble the flashiest setup, so things are kept deliberately small and explicit. 
if a choice looks naive, it probably reflects where i was in the learning curve when
i made it.

## hosts

| name | machine | platform | gpu | role |
|---|---|---|---|---|
| `sommei` | macbook pro (m1 pro) | nix-darwin (macos, `aarch64-darwin`) | — | multimedia daily driver |
| `navi` | thinkpad x1 carbon gen 12 (meteor lake) | nixos | intel arc (integrated) | learning machine |
| `games` | asus tuf gaming h770-pro, i7-13700kf | nixos | nvidia rtx 4070 | desktop, gaming |


the main per-host differences:

- **navi** is a laptop, so it enables power management and ships `powertop`.
  its hidpi panel runs at a fractional hyprland scale.
- **games** has the nvidia proprietary driver, steam and gaming tweaks,
  coolercontrol and runs its display at scale 1.
- on the two nixos hosts, **wayle** (the status bar) reads a different
  `runtime.toml` per host, since navi needs a battery indicator and games does
  not.
- **sommei** runs macos. nix-darwin handles the declarative system config
  and homebrew runs alongside it for the gui casks nix covers poorly on mac.

## structure

```
nixos-config/
├── flake.nix              # inputs (nixpkgs unstable + nix-darwin + hjem), declares all three hosts
├── hosts/
│   ├── navi/              # thinkpad
│   ├── games/             # desktop
│   └── sommei/            # macbook
├── modules/               
│   ├── core/              # boot, locale, networking, nix daemon, users
│   ├── desktop/           # hyprland, sddm, audio, fonts, printing, hjem
│   ├── hardware/          # intel, nvidia, bluetooth
│   └── programs/          # cli, apps, office, gaming
├── config/                # native dotfiles (hyprland.lua, kitty.conf, etc.)
└── wallpapers/
```

modules are opt-in: each host imports only the ones it needs. `modules/desktop`
pulls in the shared graphical stack on the nixos hosts, while
`modules/desktop/hjem.nix` declares the dotfile symlinks. the darwin host pulls
in only what makes sense on macos.

## dotfiles workflow

- system packages are declared in nix modules under `modules/`
- native dotfiles (`.conf`, `.lua`, `.toml`, `.jsonc`) live in `config/<tool>/`
- at rebuild time, hjem links `~/.config/<tool>/...` (or `/Users/<user>/...` on
  darwin) to the matching files in `config/<tool>/`
- hjem links **files**, not whole directories, so it doesn't clobber things like
  fish's `conf.d/` or `functions/`
- editing a dotfile and reloading the tool is **not** enough: hjem links point
  into the nix store, not the live repo, so a change only takes effect after a
  rebuild

## desktop (nixos hosts)

- session: hyprland (default), kde plasma 6 as fallback (need to remove it)
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
- automatic nix gc
- `sommei` (macos): touch id for sudo (declarative), homebrew tolerated
  alongside nix for gui casks
