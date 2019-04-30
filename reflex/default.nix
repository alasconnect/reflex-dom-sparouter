let
  pkgs = import <nixpkgs> {
    config.permittedInsecurePackages =
      [ "webkitgtk-2.4.11"
      ];
  };

in
  pkgs.haskellPackages.callPackage ./packages.nix { }
