{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim

          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons

          ms-python.python
          tamasfe.even-better-toml
        ];
      };
    };
  };
}
