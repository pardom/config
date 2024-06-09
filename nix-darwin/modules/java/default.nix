{ inputs, config, pkgs, ... }:

let
  sdkman-command = ''
    source ~/.sdkman/bin/sdkman-init.sh
  '';
in
{
  programs.zsh.initExtra = sdkman-command;
}
