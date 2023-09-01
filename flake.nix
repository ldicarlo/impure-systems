{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        env = pkgs.bundlerEnv
          {
            name = "impure-systems";
            gemfile = ./Gemfile;
            lockfile = ./Gemfile.lock;
            gemset = ./gemset.nix;
          };
      in
      rec {
        defaultPackage = pkgs.stdenv.mkDerivation
          {
            name = "env";

            buildInputs = with pkgs; [
              libxslt
              ruby
              bashInteractive
              zlib
              pkg-config
              libxml2
              bundler
              jekyll
              rubyPackages.jekyll-feed
            ];
          };
      }

    );
}
