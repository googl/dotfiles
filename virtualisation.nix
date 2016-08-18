{ config, pkgs, ... }:

## Virtualisation settings
{
#  virtualisation.libvirtd.enable = true;
    virtualisation.virtualbox = {
       host.enable = true;
      };
}
