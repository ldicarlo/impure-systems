{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec
      {
        defaultPackage = pkgs.stdenv.mkDerivation rec {
          name = "impure.systems";
          src = ./.;
          installPhase = ''
            # Build the site to the $out directory
            export JEKYLL_ENV=production
            ${pkgs.jekyll}/bin/jekyll build --destination $out
          '';
        };
        devShells.default = pkgs.mkShell
          {

            buildInputs = [
              pkgs.jekyll
              pkgs.bundler
              (pkgs.writeShellScriptBin
                "serve"
                ''
                  echo "Running server: visit http://localhost:8000/example/index.html"
                  ${pkgs.bundler}/bin/bundler install
                  ${pkgs.jekyll}/bin/jekyll serve .
                '')
            ];
          };
      }
    );
}
