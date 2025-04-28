{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { self, nixpkgs }: {
    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
          pkgs = import nixpkgs { inherit system; };
        });
    in {
        packages = forAllSystems ({ pkgs }: {
          default = {
            monero-cli; 
            rustup;
            helix;
          };
    
  };
}
