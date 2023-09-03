{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      env = pkgs.bundlerEnv
        {
          name = "env";
          ruby = pkgs.ruby;
          gemfile = ./Gemfile;
          lockfile = ./Gemfile.lock;
          gemset = ./gemset.nix;
        };
      inherit (pkgs) stdenv lib;
    in
    rec  {
      devShells.default =
        pkgs.mkShell {
          buildInputs = [ pkgs.bundix ];
        };
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "impure-systems";

        src = self;
        buildInputs = with pkgs; [
          env
        ];

        buildPhase = ''
          ${env}/bin/jekyll build
        '';
        installPhase = ''
          mkdir -p $out
          cp -r _site/* $out/
        '';
      };
    };

}
