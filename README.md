# nixos-config

my personal nixos configuration, built from scratch as a learning project.
it's a work in progress, not a reference setup.

## structure

- `flake.nix` — entry point
- `configuration.nix` — main system config, imports the modules below
- `hardware-configuration.nix` — generated hardware scan
- `gaming.nix` — steam + nintendo controller support, split into its own module
