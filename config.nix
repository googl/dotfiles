{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; rec { # pkgs_ is the original set of packages
    all = with pkgs; buildEnv { # pkgs is your overridden set of packages itself
     name = "all";
       paths = [
         androidsdk btfs #kde4.calligra
	canto-curses  cdrdao cdrkit #chromium
	conky  conkeror  dex      dillo
        dmenu       dunst       dvdplusrwtools
	ed	email f2fs-tools farbfeld  ffmpeg-full 
	firefox-bin
     fossil gfxtablet gimp-with-plugins      gist 
	git	gmic gnupg  
    imagemagick jre	kde5.krita  kde5.polkit-kde-agent kde5.okular
        ldns libarchive libnotify  libsysfs  
    libreoffice-still mailsend maim
    miniupnpc mpv neovim nethogs   ngrok      nix-repl  nox
	noto-fonts-emoji  pamixer pandoc  pass 
   powertop	pybitmessage  python35Packages.you-get
	qemu remmina   reptyr    silver-searcher	slop   #st 
	stow   surfraw sxhkd sylpheed 
	tdesktop texlive.combined.scheme-basic  
    xsel winswitch  youtube-dl   zathura     zathuraCollection.zathura_pdf_mupdf
      ];
    };

    dillo = pkgs_.dillo.overrideDerivation (oldAttrs: {
       configureFlags = [ "--enable-ipv6" oldAttrs.configureFlags];
    });
   };
}
