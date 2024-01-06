# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.grub.device = nodev;
  # boot.loader.grub.efiSupport = true;

  networking = {
  	hostName = "dragonfly"; # Define your hostname.
	firewall.enable = false;
	wireless = {
	  # Pick only one of the below networking options.
	  enable = true;  # Enables wireless support via wpa_supplicant.
  	  # networkmanager.enable = true;  # Easiest to use and most distros use this by default.
	  networks = {
    	    "Big'Poc" = { 
	      psk = "Poaclu678910";
	        };
	    };
	};
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "fr";
  #   useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
  services = { 
  	xserver = {
		enable = true;
		windowManager.dwm.enable = true;
		layout = "fr";
  		# xkbOptions = "eurosign:e,caps:escape";
		libinput.enable = true;
	};
  };

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.poaclu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = "/run/current-system/sw/bin/zsh";
    packages = with pkgs; [
	brave
	oh-my-zsh
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	bat
	bitwarden
	btop
	cargo
	curl
	cmatrix
	dmenu
	dwm
	exa
	gcc
	git
	gnumake
	kitty
	lutris
	lolcat
	neofetch
	neovim
	obsidian
	openssl
	powerline
	slock
	st
	starship
	stdenv
	steam
	steam-run
	thefuck
	tldr
	tmux
	tmuxp
	topgrade
	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	xorg.libX11
	xorg.libX11.dev
	xorg.libxcb
	xorg.libXft
	xorg.libXinerama
	xorg.xinit
	xorg.xinput
	zsh
  ];
  
  nixpkgs = {
  	config.allowUnfree = true;
  	overlays = [
  	(final: prev: {
		dwm = prev.dwm.overrideAttrs (old: { src = /home/poaclu/Github/dwm ;});
		st = prev.st.overrideAttrs (old: { src = /home/poaclu/Github/st ;});
	})
     ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

