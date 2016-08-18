{ config, pkgs, ... }:

## Networking settings
{
   networking = {
	hostName = "motoko";
#	firewall = {
#		autoLoadConntrackHelpers = false;
#		connectionTrackingModules = [];
#			};
	networkmanager = {
		enable = true;
			};
	nameservers =  [ "50.116.40.226" "77.88.8.8" ];

    defaultMailServer = {
        directDelivery = true;
        hostName = "gator4064.hostgator.com:465";
        useTLS = true;
        authUser = "carey.riley@moneaguecollege.edu.jm";
            };
		};
}
