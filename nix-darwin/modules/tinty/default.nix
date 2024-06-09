{
  home = {
    sessionVariables = {
      BASE16_SHELL_ENABLE_VARS = 1;
    };
  };

  programs.zsh.initExtra = ''
    source ${./setup.sh}
  '';

}
