-- CodeCompanion AI
local prefix = "<Leader>A"
local cc_maps = {
  [prefix] = { desc = " CodeCompanion" },
  [prefix .. "a"] = { "<cmd>CodeCompanionActions<CR>", desc = "Open the action palette" },
  [prefix .. "c"] = { "<cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle a chat buffer" },
  [prefix .. "cg"] = { "<cmd>CodeCompanionChat gemini Toggle<CR>", desc = "Toggle a chat buffer [Gemini]" },
  [prefix .. "co"] = { "<cmd>CodeCompanionChat llama Toggle<CR>", desc = "Toggle a chat buffer [Ollama]" },
  [prefix .. "ca"] = { "<cmd>CodeCompanionChat anthropic Toggle<CR>", desc = "Toggle a chat buffer [Anthropic]" },
  [prefix .. "cd"] = { "<cmd>CodeCompanionChat deepseek Toggle<CR>", desc = "Toggle a chat buffer [Deepseek]" },
  [prefix .. "t"] = { "<cmd>CodeCompanionChat Add<CR>", desc = "Add selected text to a chat buffer" },
  [prefix .. "tg"] = { "<cmd>CodeCompanionChat gemini Add<CR>", desc = "Add selected text to a chat buffer [Gemini]" },
  [prefix .. "to"] = { "<cmd>CodeCompanionChat llama Add<CR>", desc = "Add selected text to a chat buffer [Ollama]" },
  [prefix .. "ta"] = {
    "<cmd>CodeCompanionChat anthropic Add<CR>",
    desc = "Add selected text to a chat buffer [Anthropic]",
  },
  [prefix .. "td"] = {
    "<cmd>CodeCompanionChat deepseek Add<CR>",
    desc = "Add selected text to a chat buffer [Deepseek]",
  },
}

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
      {
        "Davidyz/VectorCode",
        version = "*",
        build = "pipx upgrade vectorcode",
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
      },
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = cc_maps,
            v = cc_maps,
          },
        },
      },
    },
    config = function()
      require("codecompanion").setup {
        strategies = {
          chat = {
            adapter = "gemini",
            tools = {
              ["mcp"] = {
                callback = function() return require "mcphub.extensions.codecompanion" end,
                description = "Call tools and resources from the MCP servers",
                opts = {
                  show_result_in_chat = true,
                  make_vars = true,
                  make_slash_commands = true,
                },
              },
              vectorcode = {
                description = "Run VectorCode to retrieve the project context",
                callback = function() return require("vectorcode.integrations").codecompanion.chat.make_tool() end,
              },
            },
          },
          inline = {
            adapter = "gemini",
          },
          cmd = {
            adapter = "gemini",
          },
        },
        adapters = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              schema = {
                model = {
                  default = "claude-3-5-haiku-20241022",
                },
              },
              env = {
                api_key = "cmd:op read op://Personal/AI/Anthropic --no-newline",
              },
            })
          end,
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              schema = {
                model = {
                  default = "gemini-2.5-flash-preview-05-20",
                },
              },
              env = {
                api_key = "cmd:op read op://Personal/AI/Gemini --no-newline",
              },
            })
          end,
          deepseek = function()
            return require("codecompanion.adapters").extend("deepseek", {
              schema = {
                model = {
                  default = "deepseek-chat",
                },
              },
              env = {
                api_key = "cmd:op read op://Personal/AI/Deepseek --no-newline",
              },
            })
          end,
          llama = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "llama",
              schema = {
                model = {
                  default = "llama3.2:latest",
                },
                num_ctx = {
                  default = 20000,
                },
              },
            })
          end,
        },
        display = {
          action_pallete = {
            provider = "telescope",
          },
        },
      }
    end,
    init = function()
      vim.cmd [[cab cc CodeCompanion]]
      require("plugins.codecompanion.fidget-spinner"):init()
    end,
  },
}
