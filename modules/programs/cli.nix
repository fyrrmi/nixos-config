# module: programs/cli
# terminal tools — tmux, just
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
    just
  ];
}
