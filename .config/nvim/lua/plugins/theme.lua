return {
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1001,
        config = function()
            vim.cmd.colorscheme("cyberdream")
        end,
    },
    { "folke/noice.nvim", enabled = false },
}
