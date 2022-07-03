{ vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "fcitx5-nvim";
  version = "1.0.0";
  src = ../..;
  meta.homepage = "https://github.com/sei40kr/fcitx5.nvim";
}
