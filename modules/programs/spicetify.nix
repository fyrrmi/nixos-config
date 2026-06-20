# module: programs/spicetify
# spotify modifié via spicetify-nix (thème + extensions)
{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
    ];

    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
