# auto-im.nvim

Inactivate IM on leaving insert/cmdline mode 

## Installation

### packer.nvim

```lua
use({ 
  "sei40kr/auto-im.nvim",
  event = { "InsertEnter *", "CmdlineEnter *" },
  config = function()
    require("auto-im").setup()
  end
})
```
