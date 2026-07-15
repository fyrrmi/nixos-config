default:
    @just --list

fmt:
    nix fmt

lint:
    nix run --inputs-from . nixpkgs#statix -- check .
    nix run --inputs-from . nixpkgs#deadnix -- --fail .

check:
    #!/usr/bin/env bash
    set -euo pipefail
    system="$(nix eval --raw --expr builtins.currentSystem)"
    nix build ".#checks.${system}.formatting"
    if [ "$(uname)" = "Darwin" ]; then
        nix eval .#darwinConfigurations.sommei.system.drvPath
    else
        nix eval .#nixosConfigurations.navi.config.system.build.toplevel.drvPath
        nix eval .#nixosConfigurations.games.config.system.build.toplevel.drvPath
    fi

switch:
    #!/usr/bin/env bash
    set -euo pipefail
    if [ "$(uname)" = "Darwin" ]; then
        sudo darwin-rebuild switch --flake .
    else
        sudo nixos-rebuild switch --flake .
    fi

build:
    #!/usr/bin/env bash
    set -euo pipefail
    if [ "$(uname)" = "Darwin" ]; then
        darwin-rebuild build --flake .
    else
        nixos-rebuild build --flake .
    fi

update:
    nix flake update

bump input:
    nix flake update {{ input }}
