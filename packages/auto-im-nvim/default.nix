{ vimUtils }:

vimUtils.buildVimPluginFrom2Nix {
  pname = "auto-im.nvim";
  version = "1.0.0";
  src = ../..;
  meta.homepage = "https://github.com/sei40kr/auto-im.nvim";
}
