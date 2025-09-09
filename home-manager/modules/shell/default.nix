{
  inputs,
  config,
  pkgs,
  ...
}:
{

  imports = [
    ./git.nix
    inputs.nix4nvchad.homeManagerModule
  ];

  programs.zsh = {
    enable = true;
    initContent = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';

    shellAliases = {
      cd = "z";
      ls = "eza";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      (python3.withPackages (
        ps: with ps; [
          python-lsp-server
          flake8
        ]
      ))
    ];
    hm-activation = true;
    backup = true;
  };
}
