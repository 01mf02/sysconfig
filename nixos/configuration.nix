# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sdb";
    };

    # disable HDMI output
    extraModprobeConfig = ''
      options snd_hda_intel enable=0,1
    '';

    kernelPackages = pkgs.linuxPackages_3_18;
  };


  hardware = {
    pulseaudio.enable = true;
    opengl.driSupport32Bit = true;
  };

  networking = {
    hostName = "nuc-nixos";
    hostId = "95a87356";
    networkmanager.enable = true;
  };


  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "de";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Vienna";

  nixpkgs.config = {
    allowUnfree = true;

    firefox = {
      enableAdobeFlash = true;
      enableOfficialBranding = true;
    };

    packageOverrides = pkgs : {
      clawsMail = pkgs.clawsMail.override {
        enableSpellcheck = true;
        enableLdap = true;
      };
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    abiword
    aspell
    aspellDicts.cs
    aspellDicts.de
    aspellDicts.en
    aspellDicts.fr
    aspellDicts.it
    audacious
    bc
    biber
    clawsMail
    easytag
    enchant
    evince
    firefoxWrapper
    fortune
    git
    gitg
    gnome3.file-roller
    gnumeric
    gparted
    gst_plugins_good
    gst_plugins_bad
    gst_plugins_ugly
    haskellPackages.cabal-install
    haskellPackages.cabal2nix
    haskellPackages.ghc
    haskellPackages.idris
    htop
    mercurial
    lyx
    gcc
    gnumake
    imagemagick
    mplayer
    networkmanagerapplet
    ocaml
    ocamlPackages.camlp5_6_strict
    pandoc
    pavucontrol
    pdfgrep
    pnmixer
    polyml
    rlwrap
    subversion
    system_config_printer
    (texLiveAggregationFun { paths = 
      [ texLive texLiveBeamer texLiveCMSuper texLiveExtra texLiveModerncv texLivePGF
        lmodern ]; })
    transmission_gtk
    unzip
    vimPlugins.airline
    vimPlugins.idris-vim
    vimPlugins.Solarized
    vimPlugins.vim2hs
    vimHugeX
    wget
    wine
    xfce.parole
    xfce.xfce4_datetime_plugin
    zip
  ];

  services = {
    dbus.enable = true;

    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };

    # automatic network printer discovery
    avahi.enable = true;

    locate.enable = true;
    # update search index every three hours
    locate.period = "0 */3 * * *";

    gnome3.gnome-keyring.enable = true;

    xserver = {
      enable = true;
      layout = "de";
      xkbOptions = "compose:rctrl";

      displayManager.lightdm.enable = true;

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
      # windowManager.default = "xmonad";

      desktopManager.xfce.enable = true;
      desktopManager.default = "xfce";
    };

  };

  # users.mutableUsers = false;
  users.extraUsers.michi = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "audio" "disk" "networkmanager" "video" "wheel" ];
    initialPassword = "michi";
  };

  fileSystems =
  [ { mountPoint = "/";
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    }

    { mountPoint = "/home";
      device = "/dev/disk/by-label/home";
      fsType = "ext4";
    }

    { mountPoint = "/media";
      device = "/dev/disk/by-label/oldhome";
      fsType = "ext4";
    }
  ];

  swapDevices =
  [ { device = "/dev/disk/by-label/swap"; }
  ];

}
