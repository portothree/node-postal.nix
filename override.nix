{ pkgs ? import <nixpkgs> { inherit system; }, system ? builtins.currentSystem
}:

let nodeEnv = import ./default.nix { inherit pkgs system; };
in nodeEnv // {
  node-postal = nodeEnv.node-postal.override {
    buildInputs = with pkgs; [ nodePackages.node-gyp-build libpostal ];
    preRebuild = ''
      sed -i -e "s|#!/usr/bin/env node|#! ${pkgs.nodejs}/bin/node|" node_modules/node-gyp-build/bin.js
    '';
  };
}
