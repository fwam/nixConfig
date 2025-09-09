{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.lixPackageSets.stable.lix; # I don't know why, but it started using nix again.
  nix.settings.experimental-features = "nix-command flakes";

  users.users.xenia = {
    name = "xenia";
    home = "/Users/xenia";
  };

  security.pam.services.sudo_local.touchIdAuth = true;
  environment.systemPackages = [ pkgs.raycast ];
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
}
