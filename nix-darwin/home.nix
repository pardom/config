{ inputs, config, pkgs, ... }:

{
  imports = [
    ./modules/android
    ./modules/bat
    ./modules/direnv
    ./modules/eza
    ./modules/fzf
    ./modules/git
    ./modules/java
    ./modules/neovim
    ./modules/tinty
    ./modules/tmux
    ./modules/zoxide
    ./modules/zsh
  ];

  home = {
    stateVersion = "23.11";

    packages = [
      pkgs.cargo
      pkgs.cmake
      pkgs.dotnet-sdk
      pkgs.exercism
      pkgs.jq
      pkgs.maven
      pkgs.mono
      pkgs.ripgrep
      pkgs.tldr
      pkgs.watchman
      pkgs.wget
    ];
  };

  programs.home-manager.enable = true;
}
