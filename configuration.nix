{ pkgs, config, modulesPath, ... }:

{
  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "bill";
    startMenuLaunchers = true;
    nativeSystemd = true;
    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

  };
  environment = {
    systemPackages = with pkgs; [           # Default packages installed system-wide
      vim
      git
      curl
    ];
  };

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "22.05";
}
