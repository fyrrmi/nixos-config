# symlinks vers les dotfiles wayle natifs
# runtime.toml diffère selon le host (battery sur navi, pas sur games)
{ osConfig, ... }:
{
  home.file.".config/wayle/tombi.toml".source = ../config/wayle/tombi.toml;
  home.file.".config/wayle/config.toml".source = ../config/wayle/config.toml;
  home.file.".config/wayle/schema.json".source = ../config/wayle/schema.json;
  home.file.".config/wayle/runtime.toml".source =
    if osConfig.networking.hostName == "navi"
    then ../config/wayle/runtime-navi.toml
    else ../config/wayle/runtime-games.toml;
}
