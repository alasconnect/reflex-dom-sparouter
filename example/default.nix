{ reflex-platform ? import ./nix/reflex-platform.nix { }
, nixpkgs ? import ./nix/nixpkgs.nix { version = "unstable"; }
, }:

reflex-platform.project ({ pkgs, ... }: {
  packages = {
    example = ./.;
    reflex-dom-sparouter = ../reflex;
  };

  # overrides = self: super: {
  #   http-media = pkgs.haskell.lib.dontCheck super.http-media;
  #   servant-reflex = pkgs.haskell.lib.dontHaddock (
  #     pkgs.haskell.lib.doJailbreak super.servant-reflex
  #   );
  # };

  shells = {
    ghcjs = [
      "example"
    ];
  };

  shellToolOverrides = ghc: super: {
    # current nixpkgs in reflex-platform is 2.0.0.1, we want >= 2.2.0.0
    cabal-install = nixpkgs.haskellPackages.cabal-install;
  };
})
