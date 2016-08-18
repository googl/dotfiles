{ config, pkgs, ... }:

{
	security = {
#		grsecurity.enable = true;
#		hideProcessInformation = true;
		sudo.extraConfig = ''
			Defaults editor=/usr/bin/rnano
			'';
		};
}
