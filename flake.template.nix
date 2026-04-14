{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.11";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # dep = pkgs.stdenv.mkDerivation rec {
      #   pname = "";
      #   version = "";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "";
      #     repo = "";
      #     rev = "v${version}";
      #     hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      #   };
      #   buildInputs = [
      #   ];
      #   nativeBuildInputs = [
      #   ];
      # };
    in
    {
      devShells.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "dev-env";
        version = "v1.0.0";
        buildInputs = [
        ];
      };
    };
}
