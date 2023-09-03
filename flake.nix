{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        env = pkgs.bundlerEnv
          {
            name = "env";
            ruby = pkgs.ruby;
            gemfile = ./Gemfile;
            lockfile = ./Gemfile.lock;
            gemset = ./gemset.nix;
          };
      in
      rec  {
        devShells.default =
          pkgs.mkShell {
            buildInputs = [ pkgs.bundix ];
          };
        defaultPackage = pkgs.stdenv.mkDerivation {
          name = "app";

          src = self;
          buildInputs = with pkgs; [
            env
          ];

          buildPhase = ''
            ${env}/bin/jekyll build
          '';
          installPhase = ''
            mkdir -p $out
            cp -r _site $out/_site
          '';
        };
      }

    );
}
