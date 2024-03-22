{ config, pkgs, inputs, username,
  gtkThemeFromScheme, ... }:
let 
  inherit (import ./options.nix)
    gitUsername gitEmail theme browser 
    wallpaperDir wallpaperGit flakeDir 
    waybarStyle;
in {
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";

  # Set The Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes."${theme}";

  # Import Program Configurations
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.hyprland.homeManagerModules.default
    ./config/home
  ];
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
     # pkgs.hello
    atuin
    zoxide
    ncdu
    kitty
    zellij
    # vim
    vim-full
    google-chrome
    ranger
    qbittorrent
    fzf
    dunst
    tmux
    sweet-folders

            bc
            easyeffects
            eza
            fastfetch
            fd
            ffmpeg
            ffmpegthumbnailer
            glib
            go
            htop
            jq
            killall
            lxappearance
            mesa
            meson
            mpv
            ninja
            nitrogen
            nixfmt
            p7zip
            pdfgrep
            powerline-go
            ripgrep
            rsync
            statix # syntax checker for nix, for doom emacs
            sxhkd
            ueberzugpp
            unzip
            wget
            wmctrl
            wmname
            xclip
            youtube-dl
            zip
            grim
            kanshi
            mako
            meson
            nwg-look
            sxiv
            imagemagick
            wofi
            mpv     
            qpdfview 
            vlc
            udiskie
            xdotool
            gcc   
            llvm_8
            gvfs
            lm_sensors
            ncurses 
            alsaUtils
            brightnessctl   
            sweet-folders
            sweet

  ];

  # Define Settings For Xresources
  xresources.properties = {
    "Xcursor.size" = 24;
  };

  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };

  programs.atuin = {
    enable = true;
  };

  # programs.atuin.enableFishIntegration = true;
  # programs.atuin.enableZshIntegration = true;
  programs.atuin.enableBashIntegration = true;

  # programs.bash = {
  #    enable = true;
  #    enableCompletion = true;
  #  };

  # programs.fish.enable = true;

 programs.zsh = {
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;
      plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
  };

programs.zsh.initExtra = ''
source ~/.p10k.zsh '';

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
        enable = true;
        createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

 programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";
};
    };

  programs.home-manager.enable = true;
}
