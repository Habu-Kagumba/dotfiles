return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "MCPHub",
  build = "bundled_build.lua",
  config = function()
    require("mcphub").setup {
      use_bundled_binary = true,
      port = 6543,
      config = vim.fn.expand "~/.config/mcphub/servers.json",
      log = {
        level = vim.log.levels.WARN,
        to_file = false,
        file_path = nil,
        prefix = "MCPHub",
      },
      auto_approve = true,
      extensions = {
        codecompanion = {
          show_result_in_chat = true,
          make_vars = true,
        },
      },
    }
  end,
}
