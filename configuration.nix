# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	./hardware.nix
	./virtualisation.nix
	./services.nix
	./networking.nix
	./security.nix
    ];

  boot = {
	cleanTmpDir = true;
	loader = {
	systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;
		};
	kernelModules = [ "tcp_diag" "pktcdvd" ];
	kernelParams = [ "workqueue.power_efficient"
			];
	extraModprobeConfig = ''
		options loop max_part=15
		options snd_hda_intel power_save=1
				'';
#    blacklistedKernelModules = [ "i915" ];
	};

    i18n = {
      consoleFont = "Lat2-Terminus16";
      consoleKeyMap = "us";
      defaultLocale = "en_US.UTF-8";
    };

#    time.timeZone = "America/Jamaica";
#    time.timeZone = "UTC";

    environment = {
	systemPackages = with pkgs;[
		testdisk
		foremost  dosfstools  ntfs3g
		weechat   chntpw      iw
		lynx      w3m         iproute
		libarchive mcelog     wget
		mtools	nmap_graphical
        pciutils	
			];

	    etc = {
		    "toprc".text = 
		    ''
		    s
		    4.0
		    '';
#		"systemd/sleep.conf".text =
#		 ''
#[Sleep]
#SuspendState = freeze
#		'';
		};
      # shells = [ pkgs.xonsh ];
	};

   fonts = {
        fonts = [ pkgs.hasklig pkgs.fira-code ];
        fontconfig = {
            ultimate.substitutions = "combi";
            #defaultFonts = {
             #   monospace = [ "Hasklig" "Dejavu Sans Mono" ];
                #serif = [  ];
                #sansSerif = [ ];
              #  };
            };
        };

  # Define a user account. Don't forget to set a password with ‘passwd’. 
  # users.extraUsers.guest = {
  #   isNormalUser = true; uid = 1000;
  # };
    users.extraUsers.me = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "transmission"
#      "libvirtd" ];
        "vboxusers" ];
	uid = 1000;
      };

    nix.gc.automatic = true;
    nix.buildCores = 2;
    nix.gc.dates = "19:00";

    programs = {
	light.enable = true;
	bash.enableCompletion = true;
	nano.nanorc = ''
			set nowrap
			set tabstospaces
			set tabsize 4
			'';
    tmux = { enable = true;
            aggressiveResize = true;
            baseIndex = 1;
            newSession = true;
            historyLimit = 10000;
            terminal = "tmux-256color";
            };
        };

    fileSystems."/".options = [ "auto_da_alloc" "journal_checksum" 
"lazytime" ];
    fileSystems."/home".options = [ "auto_da_alloc" "lazytime" 
"journal_checksum" ];

  # The NixOS release to be compatible with for stateful data such as 
  # databases.
#  system.stateVersion = "16.03";

   system.autoUpgrade = { enable = true; dates = "21:00"; };

   zramSwap = {
      enable = true;
      memoryPercent = 50;
      numDevices = 2;
     };

}
