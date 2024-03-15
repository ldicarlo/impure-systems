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
          src = ./jekyll;
          name = "env";
          ruby = pkgs.ruby_3_2;
          gemfile = ./jekyll/Gemfile;
          lockfile = ./jekyll/Gemfile.lock;
          gemset = ./jekyll/gemset.nix;
        };
      inherit (pkgs) stdenv lib;
    in
    rec  {
      devShells.${system}.default =
        pkgs.mkShell {
          test = '''';
          buildInputs = [ pkgs.bundix env pkgs.hugo ];
        };
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "impure-systems";

        src = ./jekyll;
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

