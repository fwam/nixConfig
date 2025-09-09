{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Xenia";
    userEmail = "kontakt@fwam.fyi";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
