{ config, pkgs, ... }:

{
  # Reflex Support
  nix.binaryCaches = [ "https://cache.nixos.org/" "https://nixcache.reflex-frp.org" ];
  nix.binaryCachePublicKeys = [ "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI=" ];

  # Packages for Vagrant
  environment.systemPackages = with pkgs; [
    # system
    gcc
    gnumake

    # util
    wget

    # general dev
    nano
    git

    (haskellPackages.ghcWithPackages (self : [
      self.ghcid
      self.zip-archive
      self.zlib
    ]))

    # haskell dev
    binutils
    nix-prefetch-git
    stack
    zip
    unzip

    # terminal
    bash
  ];

  networking.firewall.enable = false;
}
