{ config, pkgs, ... }:

{
hardware = {
	cpu.intel.updateMicrocode = true;
	enableKSM = true;
	pulseaudio = {
		enable = true;
		support32Bit = true;
			};

	opengl = {
#		s3tcSupport = true;
		driSupport32Bit = true;
		extraPackages = with pkgs;
			[ vaapiIntel ];
		extraPackages32 = with pkgs.pkgsi686Linux;
			[ vaapiIntel ];
		};
		};
}
