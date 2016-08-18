{ config, pkgs, ... }:

{
  # List services that you want to enable:

  # Essentials
services = {
	openssh = { 
	enable = true;
	startWhenNeeded = true;
		};

	haveged.enable = true;

    avahi = { enable = true; nssmdns = true; };

	miniupnpd = {
		enable = true;
		externalInterface = "";
		internalIPs = [ "wlp2s0" "enp1s0" ];
		};

  # Enable the X11 windowing system.
	xserver = {
		enable = true;
		layout = "us";
		#xkbOptions = "eurosign:e";

		#displayManager.sddm.enable = true;

		displayManager.lightdm.enable = true;

		desktopManager = {
			xfce.enable = true;
           # enlightenment.enable = true;
			default = "xfce";
				};

		windowManager = {
			spectrwm.enable = true;
			i3.enable = true;
			};
#		autorun = false;

#        videoDrivers = [ "modesetting" "ati" "cirrus" "vesa" "vmware" ];

		useGlamor = true;
		enableCtrlAltBackspace = true;
		libinput = {
			enable = true;
			accelProfile = "adaptive";
			sendEventsMode = "disabled-on-external-mouse";
			};

 #       deviceSection = ''
  #              Driver  "modesetting"
   #         '';
		};

## Utilities
	smartd.enable = true;
	upower.enable = true;
	transmission.enable = true;

 ## Printing
	printing = {
		enable = true;
		gutenprint = true;
		};
#	logind.extraConfig = ''
#		IdleAction = sleep
#		IdleActionSec = 900
#		'';
	gnome3 = {
		gvfs.enable = true;
		};

	cjdns = {
		enable = true;
		UDPInterface = {
                connectTo = {

			        "68.96.80.118:46242" = {
                        publicKey = "p0j807r0cqsmm690wrbvljtxgkunn369hw9wknly307z6lhsj2w0.k";
                        password = "1xbcjwq85z5qwmhjx1kclsx390yjl36";
                        };

                    "104.200.29.163:53053" = {
                        publicKey = "1941p5k8qqvj17vjrkb9z97wscvtgc1vp8pv1huk5120cu42ytt0.k";
                        password = "0YUg6eJ06NHUCMZexLj2F2cGjeENgX3";
                        };

#                    "192.241.171.154:62718" = {
 #                       password = "public_access";
  #                      publicKey = "1y1jmqrw4r31jlp6yqmq30067rcp0tsgsdm3cs4k8l33pyfhpwn0.k";
   #                     };

    #                 "198.245.60.32:10000" = { password = "yzx0lvd1td67tx3pqlb4z81g22hjnqt";
     #                                           publicKey = "fdud7rqg7puz4hf6u4kztfku0pbujw88l29s4ugwhf61vgqv6cj0.k"; };

      #              "cynical.us:29501" = {
       #                 password = "vsrlj7qznyf9t6cn6whrnfxf15vb6y4";
        #                publicKey = "tz0s42w2v11tfx5pkmqls0p3zt39m0bgt32ztxwrwgt6kcqhtcb0.k"; };
                    };
              bind = "0.0.0.0:43211";

                      };
                    };
		    	

    canto-daemon.enable = true;

    teamviewer.enable = true;
	};
}
