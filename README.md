# fcitx5.nvim

Inactivate the Fcitx5 IM on leaving insert mode 

## Installation

### packer.nvim

```lua
use({ 
  "sei40kr/fcitx5.nvim",
  event = { "InsertEnter *", "CmdlineEnter *" },
  config = function()
    require("fcitx5").setup()
  end
})
```
