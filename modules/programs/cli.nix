{ pkgs, ... }:
{
 environment.systemPackages = with pkgs; [
   tmux
   just
   yazi
 ];
}
