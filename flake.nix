{
  description = "node-postal";
  inputs = { nixpkgs = { url = "nixpkgs/nixos-22.05"; }; };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.node-postal = import ./default.nix {
        inherit system;
        inherit pkgs;
      };
      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
    };
}
