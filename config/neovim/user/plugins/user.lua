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
    "ur4ltz/surround.nvim",
    config = function()
      require "surround".setup { mappings_style = "surround" }
    end,
  },
  "mattn/emmet-vim",
}
