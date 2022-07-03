{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/master";
  };

  outputs = { self, flake-utils, nixpkgs }:
    let inherit (flake-utils.lib) eachSystem;
      systems = [ "x86_64-darwin" "x86_64-linux" ];
    in
    eachSystem systems (system:
      let pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = {
          fcitx5-nvim = pkgs.callPackage ./packages/fcitx5-nvim { };
        };

        devShell = pkgs.mkShell {
          buildInputs = [
            (pkgs.neovim.override {
              configure = {
                customRC = ''
                  lua require("fcitx5").setup()
                '';
                packages.myVimPackage.start = [ self.packages.${system}.fcitx5-nvim ];
              };
            })
          ];
          shellHook = ''
            export NVIM_LOG_FILE=log
            export VIM=
            export VIMRUNTIME=
            export XDG_CONFIG_HOME=$(mktemp -d)
            export XDG_DATA_HOME=$(mktemp -d)
            export VIMINIT=
            exec nvim
          '';
        };
      });
}
