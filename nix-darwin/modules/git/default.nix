{ pkgs, ... }:

let
  git-alias = pkgs.fetchFromGitHub {
    owner = "gitalias";
    repo = "gitalias";
    rev = "12c40fc70b37c9a26dd9f8ff72f61ca7d98e32d2";
    sha256 = "sha256-At11Q9zmtM5mj6nD5oA1656AUWCMxt6U5FU8pbOIeM4=";
  };
in
{
  programs = {
    git = {
      enable = true;
      extraConfig = {
        credential.helper = "osxkeychain";

        diff.tool = "Kaleidoscope";
        difftool.prompt = false;
        difftool.Kaleidoscope.cmd = "ksdiff --partial-changeset --relative-path \"$MERGED\" -- \"$LOCAL\" \"$REMOTE\"";

        merge.tool = "Kaleidoscope";
        mergetool.Kaleidoscope.cmd = "ksdiff --merge --output \"$MERGED\" --base \"$BASE\" -- \"$LOCAL\" --snapshot \"$REMOTE\" --snapshot";
      };
      includes = [
        { path = "${git-alias}/gitalias.txt"; }
      ];
      userEmail = "mpardo@netflix.com";
      userName = "Michael Pardo";
      difftastic = {
        enable = true;
      };
      diff-so-fancy = {
        enable = false;
      };
    };
  };
}
