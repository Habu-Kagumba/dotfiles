return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  { "jghauser/mkdir.nvim", event = "BufNewFile" },
  "nordtheme/vim"
}
