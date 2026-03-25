return {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {},
    config = function()
        require("catppuccin").setup({
          transparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin-mocha")
    end
}
