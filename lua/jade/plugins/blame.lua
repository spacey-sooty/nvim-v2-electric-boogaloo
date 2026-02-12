return {
    "FabijanZulj/blame.nvim",
    config = function()
        require("blame").setup()
        vim.keymap.set('n', '<C-b>', '<CMD>BlameToggle<cr>', {})
    end
}
