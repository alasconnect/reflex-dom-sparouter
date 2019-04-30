{ mkDerivation, base, reflex, reflex-dom, stdenv, text
}:
mkDerivation {
  pname = "reflex-dom-sparouter";
  version = "0.1.0";
  src = ./.;
  libraryHaskellDepends = [
    base reflex reflex-dom stdenv text
  ];
  license = stdenv.lib.licenses.asl20;
}
