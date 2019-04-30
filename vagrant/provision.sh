#!/usr/bin/env bash
set -e -u -x

function bootstrap_nix_upgrade
{
  sudo nix-channel --add https://nixos.org/channels/nixos-19.03 nixos
  sudo nix-channel --update
  sudo nixos-rebuild switch --upgrade
}

function bootstrap_cabal
{
  nix-env -iA nixos.cabal-install
  nix-env -iA nixos.cabal2nix
}

# bootstrap_nix_upgrade
bootstrap_cabal
