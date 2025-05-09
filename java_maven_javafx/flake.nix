{
  description = "Java development environment with JavaFX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            jdk
            maven
            openjfx
            scenebuilder
          ];

          shellHook = ''
            export JAVA_HOME=${pkgs.jdk}
            export JAVA_OPTS="--module-path ${pkgs.openjfx}/lib/openjfx --add-modules=javafx.controls,javafx.fxml"
          '';
        };
      }
    );
}
